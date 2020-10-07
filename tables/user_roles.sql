--DROP TABLE user_roles PURGE;
CREATE TABLE user_roles (
    user_id             VARCHAR2(30)    NOT NULL,
    role_id             VARCHAR2(30)    NOT NULL,
    --
    CONSTRAINT pk_user_roles PRIMARY KEY (user_id, role_id),
    --
    CONSTRAINT fk_users_roles_user_id FOREIGN KEY (user_id)
        REFERENCES users (user_id),
    --
    CONSTRAINT fk_users_roles_role_id FOREIGN KEY (role_id)
        REFERENCES roles (role_id)
);
--
CREATE INDEX fk_users_roles_role_id ON user_roles (role_id) COMPUTE STATISTICS;
--
COMMENT ON TABLE  user_roles                     IS 'List of roles assigned to users';
--
COMMENT ON COLUMN user_roles.user_id             IS 'User ID from `users` table';
COMMENT ON COLUMN user_roles.role_id             IS 'Role ID from `roles` table';

