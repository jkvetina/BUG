CREATE OR REPLACE FORCE VIEW p952_triggers AS
WITH x AS (
    SELECT /* result_cache cardinality(1) */
        c.app_id,
        c.today,
        NULLIF(apex.get_item('$TABLE') || '__', '__') AS filter_table
    FROM calendar c
    WHERE c.app_id      = sess.get_app_id()
        AND c.today     = app.get_date_str()
),
r AS (
    SELECT /* materialize */
        l.module_name,
        COUNT(l.log_id)                                                                     AS calls_,
        SUM(TO_NUMBER(REGEXP_SUBSTR(l.arguments, '^[[]"INSERTED:(\d+)"', 1, 1, NULL, 1)))   AS inserted_,
        SUM(TO_NUMBER(REGEXP_SUBSTR(l.arguments, '^[[]"UPDATED:(\d+)"',  1, 1, NULL, 1)))   AS updated_,
        SUM(TO_NUMBER(REGEXP_SUBSTR(l.arguments, '^[[]"DELETED:(\d+)"',  1, 1, NULL, 1)))   AS deleted_
    FROM x
    JOIN logs l
        ON l.today          = x.today
        AND l.app_id        = x.app_id
        AND l.flag          = 'G'
        AND l.module_name   = NVL(x.filter_table, l.module_name)
        AND l.arguments     IS NOT NULL
    GROUP BY l.module_name
)
SELECT
    t.table_name,
    g.trigger_name,
    --
    CASE
        WHEN g.trigger_name         = t.table_name || '__'  -- get_trigger_name(), used in TREE package too
            AND g.trigger_type      = 'COMPOUND'
            AND g.triggering_event  = 'INSERT OR UPDATE OR DELETE'
            AND g.before_statement  = 'YES'
            AND g.before_row        = 'YES'
            AND g.after_row         = 'YES'
            AND g.after_statement   = 'YES'
            AND g.status            = 'ENABLED'
        THEN apex.get_icon('fa-check-square', 'Compound trigger present and valid')
        END AS trigger_,
    --
    CASE
        WHEN u.uploader_id IS NOT NULL
            THEN apex.get_icon('fa-check-square', 'Table has Uploader')
            END AS uploader_,
    --
    r.calls_,
    r.inserted_,
    r.updated_,
    r.deleted_,
    --
    o.last_ddl_time
FROM user_tables t
LEFT JOIN user_triggers g
    ON g.table_name     = t.table_name
LEFT JOIN user_objects o
    ON o.object_name    = g.trigger_name
LEFT JOIN user_mviews v
    ON v.mview_name     = t.table_name
LEFT JOIN r
    ON r.module_name    = g.trigger_name
LEFT JOIN uploaders u
    ON u.app_id         = sess.get_app_id()
    AND u.target_table  = t.table_name
WHERE t.table_name      NOT LIKE '%\_%$' ESCAPE '\'
    AND t.table_name    NOT IN (
        'LOGS',
        'LOGS_LOBS',
        'LOGS_SETUP',
        'LOGS_EVENTS',
        'SESSIONS'
    )
    AND t.table_name    = NVL(apex.get_item('$TABLE'), t.table_name)
    AND v.mview_name    IS NULL;

