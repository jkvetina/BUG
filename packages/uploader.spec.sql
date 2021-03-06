CREATE OR REPLACE PACKAGE uploader AS

    -- DML ERR tables just for Uploder to investigate failed rows
    dml_tables_owner            CONSTANT VARCHAR2(30)       := 'DEV';
    dml_tables_postfix          CONSTANT VARCHAR2(30)       := '_U$';
    dml_tables_cols             CONSTANT NUMBER(4)          := 60;

    -- exception used in FORALL exception handling
    forall_failed               EXCEPTION;
    PRAGMA                      EXCEPTION_INIT(forall_failed, -24381);

    -- collections used for individial uploaders
    TYPE target_rows_t
        IS TABLE OF             PLS_INTEGER INDEX BY PLS_INTEGER;
    --
    TYPE target_ids_t
        IS TABLE OF             PLS_INTEGER;

    -- delete flag
    delete_flag_name            CONSTANT VARCHAR2(30)       := 'DELETE_FLAG';
    delete_flag_value           CONSTANT VARCHAR2(2)        := 'Y';             -- ORA_ERR_OPTYP$%TYPE

    -- custom uploader prefix
    uploader_prefix             CONSTANT VARCHAR2(30)       := 'UPLOADER_';





    PROCEDURE upload_file (
        in_session_id           sessions.session_id%TYPE,
        in_file_name            uploaded_files.file_name%TYPE,
        in_target               uploaded_files.uploader_id%TYPE     := NULL
    );



    PROCEDURE upload_files (
        in_session_id           sessions.session_id%TYPE
    );



    FUNCTION get_basename (
        in_file_name            uploaded_files.file_name%TYPE
    )
    RETURN VARCHAR2;



    PROCEDURE parse_file (
        in_file_name            uploaded_file_sheets.file_name%TYPE,
        in_uploader_id          uploaded_file_sheets.uploader_id%TYPE       := NULL
    );



    PROCEDURE process_file_sheet (
        in_file_name            uploaded_file_sheets.file_name%TYPE,
        in_sheet_id             uploaded_file_sheets.sheet_id%TYPE,
        in_uploader_id          uploaded_file_sheets.uploader_id%TYPE,
        in_commit               VARCHAR2                                    := NULL
    );



    PROCEDURE copy_uploaded_data_to_collection (
        in_uploader_id          uploaders.uploader_id%TYPE,
        in_header_name          VARCHAR2                    := '$HEADER_'
    );



    PROCEDURE delete_file (
        in_file_name            uploaded_files.file_name%TYPE
    );



    PROCEDURE download_file (
        in_file_name            uploaded_files.file_name%TYPE
    );



    PROCEDURE create_uploader (
        in_uploader_id          uploaders.uploader_id%TYPE,
        in_clear_current        BOOLEAN                                 := TRUE
    );



    PROCEDURE create_uploader_mappings (
        in_uploader_id          uploaders_mapping.uploader_id%TYPE,
        in_clear_current        BOOLEAN                                 := FALSE
    );



    FUNCTION get_procedure_name (
        in_uploader_id      uploaders.uploader_id%TYPE
    )
    RETURN uploaders.target_table%TYPE;



    FUNCTION get_u$_table_name (
        in_table_name           uploaders.target_table%TYPE
    )
    RETURN uploaders.target_table%TYPE;



    PROCEDURE rebuild_dml_err_table (
        in_table_name           uploaders.target_table%TYPE
    );



    PROCEDURE uploader_template (
        in_file_name            uploaded_file_sheets.file_name%TYPE,
        in_sheet_id             uploaded_file_sheets.sheet_id%TYPE,
        in_uploader_id          uploaded_file_sheets.uploader_id%TYPE,
        in_commit               VARCHAR2                                := NULL
    );



    FUNCTION generate_columns (
        in_uploader_id          uploaders.uploader_id%TYPE,
        in_type                 VARCHAR2,
        in_indentation          PLS_INTEGER                     := NULL
    )
    RETURN VARCHAR2;



    PROCEDURE generate_procedure (
        in_uploader_id          uploaders.uploader_id%TYPE
    );



    FUNCTION get_cursor_from_query (
        in_query                VARCHAR2
    )
    RETURN SYS_REFCURSOR;



    PROCEDURE update_mapping (
        in_uploader_id          uploaders_mapping.uploader_id%TYPE,
        in_source_column        uploaders_mapping.source_column%TYPE,
        in_target_column        uploaders_mapping.target_column%TYPE,
        in_overwrite_value      uploaders_mapping.overwrite_value%TYPE
    );

END;
/
