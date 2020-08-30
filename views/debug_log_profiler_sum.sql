CREATE OR REPLACE VIEW logs_profiler_sum AS
SELECT
    p.package_name,
    p.module_name,
    p.module_type,
    p.overload,
    p.total_calls,
    p.total_time,
    ROUND(p.total_time / SUM(p.total_time) OVER() * 100, 2) AS module_perc
FROM (
    SELECT
        p.name                  AS package_name,
        NVL(m.module_name, '-') AS module_name,
        m.module_type,
        m.overload,
        SUM(p.total_calls)      AS total_calls,
        SUM(p.total_time)       AS total_time
    FROM logs_profiler p
    LEFT JOIN logs_modules m
        ON m.package_name   = p.name
        AND p.line          BETWEEN m.body_start AND m.body_end
    WHERE p.total_time      > 0
    GROUP BY p.name, m.module_name, m.module_type, m.overload
) p
ORDER BY total_time DESC, p.package_name, p.module_name, p.overload;
--
COMMENT ON COLUMN logs_profiler_sum.package_name   IS 'Package name';
COMMENT ON COLUMN logs_profiler_sum.module_name    IS 'Module name';
COMMENT ON COLUMN logs_profiler_sum.module_type    IS 'Module type (function/procedure)';
COMMENT ON COLUMN logs_profiler_sum.overload       IS 'Overload ID';
COMMENT ON COLUMN logs_profiler_sum.total_calls    IS 'Number of occurences/calls';
COMMENT ON COLUMN logs_profiler_sum.total_time     IS 'Time spent on module';
COMMENT ON COLUMN logs_profiler_sum.module_perc    IS 'Percentage of total time spent on module';

