CREATE OR REPLACE VIEW p800_uploaded_sheet_content AS
WITH s AS (
    SELECT
        s.*,
        NVL(apex.get_item('$TARGET'), s.uploader_id) AS target
    FROM uploaded_file_sheets s
    WHERE s.file_name   = apex.get_item('$FILE')
        AND s.sheet_id  = apex.get_item('$SHEET')
),
m AS (
    SELECT
        SUM(CASE WHEN m.target_column IS NOT NULL   AND m.source_column IS NOT NULL THEN 1 ELSE 0 END)                      AS mapped_cols,
        SUM(CASE WHEN m.source_column IS NULL       AND (m.is_key IS NOT NULL OR m.is_nn IS NOT NULL) THEN 1 ELSE 0 END)    AS missing_cols
    FROM p800_sheet_columns_mapping m
)
SELECT
    CASE WHEN apex.get_item('$SHOW_COLS') IS NOT NULL
        THEN '<b>Columns</b>'
        ELSE    'Columns'
        END AS list_label,
    --
    'Mapped: ' || m.mapped_cols ||
        CASE WHEN m.missing_cols > 0 THEN ', Missing: ' || m.missing_cols END
        AS supplemental,
    s.sheet_cols        AS count_,
    --
    apex.get_page_link (
        in_page_id      => sess.get_page_id(),
        in_names        => 'P800_FILE,P800_SHEET,P800_TARGET,P800_SHOW_COLS,P800_RESET',
        in_values       => s.file_name || ',' || s.sheet_id || ',' || s.target || ',Y,Y'
    ) AS target_url
FROM s
CROSS JOIN m
UNION ALL
--
SELECT
    CASE WHEN apex.get_item('$SHOW_DATA') IS NOT NULL
        THEN '<b>Rows</b>'
        ELSE    'Rows'
        END AS list_label,
    --
    NULL                AS supplemental,
    s.sheet_rows        AS count_,
    --
    apex.get_page_link (
        in_page_id      => sess.get_page_id(),
        in_names        => 'P800_FILE,P800_SHEET,P800_TARGET,P800_SHOW_DATA,P800_RESET',
        in_values       => s.file_name || ',' || s.sheet_id || ',' || s.target || ',Y,Y'
    ) AS target_url
FROM s;
