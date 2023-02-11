+----+--------------------------------------------------------------+----------------------------+--------------+--------------------+------------+-----------+--------------------+----------+-----------+----------------------------+
| id |                           password                           |         last_login         | is_superuser |      username      | first_name | last_name |       email        | is_staff | is_active |        date_joined         |
+----+--------------------------------------------------------------+----------------------------+--------------+--------------------+------------+-----------+--------------------+----------+-----------+----------------------------+
| 1  | pbkdf2_sha256$390000$VPHmSDiYcZQxzKdsRMPuh1$+UL+TYDNBJ/pNt1v | 2023-02-10 13:48:19.693340 | 0            | samia@hum.com      |            |           | samia@hum.com      | 0        | 1         | 2023-02-09 22:52:31.568899 |
|    | E2GxpX2ocbJiGoKFEk7Gd0y0WRA=                                 |                            |              |                    |            |           |                    |          |           |                            |
+----+--------------------------------------------------------------+----------------------------+--------------+--------------------+------------+-----------+--------------------+----------+-----------+----------------------------+
| 2  | pbkdf2_sha256$390000$RAXjSr4uKIdKcGtjQGabe9$RYsw7ST73JQ0ZR52 | 2023-02-10 13:44:46.475190 | 0            | cindy@starfall.com |            |           | cindy@starfall.com | 0        | 1         | 2023-02-10 13:44:46.179000 |
|    | XuogW3yuU6UNdgWX42CAXuD6EVA=                                 |                            |              |                    |            |           |                    |          |           |                            |
+----+--------------------------------------------------------------+----------------------------+--------------+--------------------+------------+-----------+--------------------+----------+-----------+----------------------------+
CREATE TABLE IF NOT EXISTS "django_migrations" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "app" varchar(255) NOT NULL, "name" varchar(255) NOT NULL, "applied" datetime NOT NULL);
CREATE TABLE sqlite_sequence(name,seq);
CREATE TABLE IF NOT EXISTS "django_content_type" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "app_label" varchar(100) NOT NULL, "model" varchar(100) NOT NULL);
CREATE UNIQUE INDEX "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" ("app_label", "model");
CREATE TABLE IF NOT EXISTS "auth_group_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "group_id" integer NOT NULL REFERENCES "auth_group" ("id") DEFERRABLE INITIALLY DEFERRED, "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE UNIQUE INDEX "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" ("group_id", "permission_id");
CREATE INDEX "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" ("group_id");
CREATE INDEX "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" ("permission_id");
CREATE TABLE IF NOT EXISTS "auth_permission" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "content_type_id" integer NOT NULL REFERENCES "django_content_type" ("id") DEFERRABLE INITIALLY DEFERRED, "codename" varchar(100) NOT NULL, "name" varchar(255) NOT NULL);
CREATE UNIQUE INDEX "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" ("content_type_id", "codename");
CREATE INDEX "auth_permission_content_type_id_2f476e4b" ON "auth_permission" ("content_type_id");
CREATE TABLE IF NOT EXISTS "auth_group" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(150) NOT NULL UNIQUE);
CREATE TABLE IF NOT EXISTS "mail_user" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "password" varchar(128) NOT NULL, "last_login" datetime NULL, "is_superuser" bool NOT NULL, "username" varchar(150) NOT NULL UNIQUE, "first_name" varchar(150) NOT NULL, "last_name" varchar(150) NOT NULL, "email" varchar(254) NOT NULL, "is_staff" bool NOT NULL, "is_active" bool NOT NULL, "date_joined" datetime NOT NULL);
CREATE TABLE IF NOT EXISTS "mail_user_groups" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "user_id" integer NOT NULL REFERENCES "mail_user" ("id") DEFERRABLE INITIALLY DEFERRED, "group_id" integer NOT NULL REFERENCES "auth_group" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE IF NOT EXISTS "mail_user_user_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "user_id" integer NOT NULL REFERENCES "mail_user" ("id") DEFERRABLE INITIALLY DEFERRED, "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE IF NOT EXISTS "mail_email" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "subject" varchar(255) NOT NULL, "body" text NOT NULL, "timestamp" datetime NOT NULL, "read" bool NOT NULL, "archived" bool NOT NULL, "sender_id" integer NOT NULL REFERENCES "mail_user" ("id") DEFERRABLE INITIALLY DEFERRED, "user_id" integer NOT NULL REFERENCES "mail_user" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE IF NOT EXISTS "mail_email_recipients" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "email_id" integer NOT NULL REFERENCES "mail_email" ("id") DEFERRABLE INITIALLY DEFERRED, "user_id" integer NOT NULL REFERENCES "mail_user" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE UNIQUE INDEX "mail_user_groups_user_id_group_id_35ce6c3a_uniq" ON "mail_user_groups" ("user_id", "group_id");
CREATE INDEX "mail_user_groups_user_id_4eebf452" ON "mail_user_groups" ("user_id");
CREATE INDEX "mail_user_groups_group_id_a4890e73" ON "mail_user_groups" ("group_id");
CREATE UNIQUE INDEX "mail_user_user_permissions_user_id_permission_id_52c21408_uniq" ON "mail_user_user_permissions" ("user_id", "permission_id");
CREATE INDEX "mail_user_user_permissions_user_id_1c678589" ON "mail_user_user_permissions" ("user_id");
CREATE INDEX "mail_user_user_permissions_permission_id_2a9ce862" ON "mail_user_user_permissions" ("permission_id");
CREATE INDEX "mail_email_sender_id_102f874d" ON "mail_email" ("sender_id");
CREATE INDEX "mail_email_user_id_49d60181" ON "mail_email" ("user_id");
CREATE UNIQUE INDEX "mail_email_recipients_email_id_user_id_5d5f085d_uniq" ON "mail_email_recipients" ("email_id", "user_id");
CREATE INDEX "mail_email_recipients_email_id_8554d849" ON "mail_email_recipients" ("email_id");
CREATE INDEX "mail_email_recipients_user_id_447857d9" ON "mail_email_recipients" ("user_id");
CREATE TABLE IF NOT EXISTS "django_admin_log" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "object_id" text NULL, "object_repr" varchar(200) NOT NULL, "action_flag" smallint unsigned NOT NULL CHECK ("action_flag" >= 0), "change_message" text NOT NULL, "content_type_id" integer NULL REFERENCES "django_content_type" ("id") DEFERRABLE INITIALLY DEFERRED, "user_id" integer NOT NULL REFERENCES "mail_user" ("id") DEFERRABLE INITIALLY DEFERRED, "action_time" datetime NOT NULL);
CREATE INDEX "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" ("content_type_id");
CREATE INDEX "django_admin_log_user_id_c564eba6" ON "django_admin_log" ("user_id");
CREATE TABLE IF NOT EXISTS "django_session" ("session_key" varchar(40) NOT NULL PRIMARY KEY, "session_data" text NOT NULL, "expire_date" datetime NOT NULL);
CREATE INDEX "django_session_expire_date_a5c62663" ON "django_session" ("expire_date");
.archive ...             Manage SQL archives
.auth ON|OFF             Show authorizer callbacks
.backup ?DB? FILE        Backup DB (default "main") to FILE
.bail on|off             Stop after hitting an error.  Default OFF
.binary on|off           Turn binary output on or off.  Default OFF
.cd DIRECTORY            Change the working directory to DIRECTORY
.changes on|off          Show number of rows changed by SQL
.check GLOB              Fail if output since .testcase does not match
.clone NEWDB             Clone data into NEWDB from the existing database
.connection [close] [#]  Open or close an auxiliary database connection
.databases               List names and files of attached databases
.dbconfig ?op? ?val?     List or change sqlite3_db_config() options
.dbinfo ?DB?             Show status information about the database
.dump ?OBJECTS?          Render database content as SQL
.echo on|off             Turn command echo on or off
.eqp on|off|full|...     Enable or disable automatic EXPLAIN QUERY PLAN
.excel                   Display the output of next command in spreadsheet
.exit ?CODE?             Exit this program with return-code CODE
.expert                  EXPERIMENTAL. Suggest indexes for queries
.explain ?on|off|auto?   Change the EXPLAIN formatting mode.  Default: auto
.filectrl CMD ...        Run various sqlite3_file_control() operations
.fullschema ?--indent?   Show schema and the content of sqlite_stat tables
.headers on|off          Turn display of headers on or off
.help ?-all? ?PATTERN?   Show help text for PATTERN
.import FILE TABLE       Import data from FILE into TABLE
.imposter INDEX TABLE    Create imposter table TABLE on index INDEX
.indexes ?TABLE?         Show names of indexes
.limit ?LIMIT? ?VAL?     Display or change the value of an SQLITE_LIMIT
.lint OPTIONS            Report potential schema issues.
.load FILE ?ENTRY?       Load an extension library
.log FILE|off            Turn logging on or off.  FILE can be stderr/stdout
.mode MODE ?OPTIONS?     Set output mode
.nonce STRING            Suspend safe mode for one command if nonce matches
.nullvalue STRING        Use STRING in place of NULL values
.once ?OPTIONS? ?FILE?   Output for the next SQL command only to FILE
.open ?OPTIONS? ?FILE?   Close existing database and reopen FILE
.output ?FILE?           Send output to FILE or stdout if FILE is omitted
.parameter CMD ...       Manage SQL parameter bindings
.print STRING...         Print literal STRING
.progress N              Invoke progress handler after every N opcodes
.prompt MAIN CONTINUE    Replace the standard prompts
.quit                    Exit this program
.read FILE               Read input from FILE or command output
.recover                 Recover as much data as possible from corrupt db.
.restore ?DB? FILE       Restore content of DB (default "main") from FILE
.save ?OPTIONS? FILE     Write database to FILE (an alias for .backup ...)
.scanstats on|off        Turn sqlite3_stmt_scanstatus() metrics on or off
.schema ?PATTERN?        Show the CREATE statements matching PATTERN
.selftest ?OPTIONS?      Run tests defined in the SELFTEST table
.separator COL ?ROW?     Change the column and row separators
.session ?NAME? CMD ...  Create or control sessions
.sha3sum ...             Compute a SHA3 hash of database content
.shell CMD ARGS...       Run CMD ARGS... in a system shell
.show                    Show the current values for various settings
.stats ?ARG?             Show stats or turn stats on or off
.system CMD ARGS...      Run CMD ARGS... in a system shell
.tables ?TABLE?          List names of tables matching LIKE pattern TABLE
.testcase NAME           Begin redirecting output to 'testcase-out.txt'
.testctrl CMD ...        Run various sqlite3_test_control() operations
.timeout MS              Try opening locked tables for MS milliseconds
.timer on|off            Turn SQL timer on or off
.trace ?OPTIONS?         Output each SQL statement as it is run
.vfsinfo ?AUX?           Information about the top-level VFS
.vfslist                 List all available VFSes
.vfsname ?AUX?           Print the name of the VFS stack
.width NUM1 NUM2 ...     Set minimum column widths for columnar output
auth_group                  django_session            
auth_group_permissions      mail_email                
auth_permission             mail_email_recipients     
django_admin_log            mail_user                 
django_content_type         mail_user_groups          
django_migrations           mail_user_user_permissions
auth_group                  django_session            
auth_group_permissions      mail_email                
auth_permission             mail_email_recipients     
django_admin_log            mail_user                 
django_content_type         mail_user_groups          
django_migrations           mail_user_user_permissions
