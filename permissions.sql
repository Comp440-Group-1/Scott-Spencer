/* 6:21:59 PM root@127.0.0.1 Comp440ProjectScottSpencer */ SELECT user FROM mysql.user LIMIT 1;
/* 6:22:00 PM root@127.0.0.1 Comp440ProjectScottSpencer */ SELECT * FROM mysql.user ORDER BY user;
/* 6:22:00 PM root@127.0.0.1 Comp440ProjectScottSpencer */ SELECT * FROM mysql.db;
/* 6:22:00 PM root@127.0.0.1 Comp440ProjectScottSpencer */ SHOW PRIVILEGES;
/* 6:22:18 PM root@127.0.0.1 Comp440ProjectScottSpencer */ SELECT user FROM mysql.user LIMIT 1;
/* 6:22:18 PM root@127.0.0.1 Comp440ProjectScottSpencer */ SELECT * FROM mysql.user ORDER BY user;
/* 6:22:18 PM root@127.0.0.1 Comp440ProjectScottSpencer */ SELECT * FROM mysql.db;
/* 6:22:18 PM root@127.0.0.1 Comp440ProjectScottSpencer */ SHOW PRIVILEGES;
/* 6:23:52 PM root@127.0.0.1 Comp440ProjectScottSpencer */ SELECT user FROM mysql.user LIMIT 1;
/* 6:23:52 PM root@127.0.0.1 Comp440ProjectScottSpencer */ SELECT * FROM mysql.user ORDER BY user;
/* 6:23:52 PM root@127.0.0.1 Comp440ProjectScottSpencer */ SELECT * FROM mysql.db;
/* 6:23:52 PM root@127.0.0.1 Comp440ProjectScottSpencer */ SHOW PRIVILEGES;
/* 6:29:14 PM root@127.0.0.1 Comp440ProjectScottSpencer */ CREATE USER 'appuser1'@'localhost' IDENTIFIED BY 'appuser1';
/* 6:29:14 PM root@127.0.0.1 Comp440ProjectScottSpencer */ UPDATE mysql.user SET max_questions = 0, max_updates = 0, max_connections = 0 WHERE User = 'appuser1' AND Host = 'localhost';
/* 6:29:14 PM root@127.0.0.1 Comp440ProjectScottSpencer */ REVOKE CREATE ROUTINE, CREATE VIEW, CREATE USER, ALTER, SHOW VIEW, CREATE, ALTER ROUTINE, EVENT, SUPER, INSERT, RELOAD, SELECT, DELETE, FILE, SHOW DATABASES, TRIGGER, SHUTDOWN, REPLICATION CLIENT, GRANT OPTION, PROCESS, REFERENCES, UPDATE, DROP, REPLICATION SLAVE, EXECUTE, LOCK TABLES, CREATE TEMPORARY TABLES, INDEX ON *.* FROM 'appuser1'@'localhost';
/* 6:29:14 PM root@127.0.0.1 Comp440ProjectScottSpencer */ RENAME USER ''@'localhost' TO 'admin'@'localhost';
/* 6:29:14 PM root@127.0.0.1 Comp440ProjectScottSpencer */ SET PASSWORD FOR 'admin'@'localhost' = PASSWORD('admin');
/* 6:29:14 PM root@127.0.0.1 Comp440ProjectScottSpencer */ FLUSH PRIVILEGES;
/* 6:29:16 PM root@127.0.0.1 Comp440ProjectScottSpencer */ SELECT user FROM mysql.user LIMIT 1;
/* 6:29:16 PM root@127.0.0.1 Comp440ProjectScottSpencer */ SELECT * FROM mysql.user ORDER BY user;
/* 6:29:16 PM root@127.0.0.1 Comp440ProjectScottSpencer */ SELECT * FROM mysql.db;
/* 6:29:16 PM root@127.0.0.1 Comp440ProjectScottSpencer */ SHOW PRIVILEGES;
/* 6:29:41 PM root@127.0.0.1 Comp440ProjectScottSpencer */ UPDATE mysql.user SET max_questions = 0, max_updates = 0, max_connections = 0 WHERE User = 'admin' AND Host = 'localhost';
/* 6:29:41 PM root@127.0.0.1 Comp440ProjectScottSpencer */ GRANT CREATE ROUTINE, CREATE VIEW, CREATE USER, ALTER, SHOW VIEW, CREATE, ALTER ROUTINE, EVENT, SUPER, INSERT, RELOAD, SELECT, DELETE, FILE, SHOW DATABASES, TRIGGER, SHUTDOWN, REPLICATION CLIENT, GRANT OPTION, PROCESS, REFERENCES, UPDATE, DROP, REPLICATION SLAVE, EXECUTE, LOCK TABLES, CREATE TEMPORARY TABLES, INDEX ON *.* TO 'admin'@'localhost';
/* 6:29:41 PM root@127.0.0.1 Comp440ProjectScottSpencer */ SELECT USER, HOST FROM mysql.db WHERE USER = 'admin' AND HOST = 'localhost' AND DB = 'Comp440ProjectScottSpencer';
/* 6:29:41 PM root@127.0.0.1 Comp440ProjectScottSpencer */ GRANT CREATE ROUTINE, CREATE VIEW, ALTER, SHOW VIEW, CREATE, ALTER ROUTINE, EVENT, INSERT, SELECT, DELETE, TRIGGER, GRANT OPTION, REFERENCES, UPDATE, DROP, EXECUTE, LOCK TABLES, CREATE TEMPORARY TABLES, INDEX ON `Comp440ProjectScottSpencer`.* TO 'admin'@'localhost';
/* 6:29:41 PM root@127.0.0.1 Comp440ProjectScottSpencer */ FLUSH PRIVILEGES;
/* 6:29:43 PM root@127.0.0.1 Comp440ProjectScottSpencer */ SELECT user FROM mysql.user LIMIT 1;
/* 6:29:43 PM root@127.0.0.1 Comp440ProjectScottSpencer */ SELECT * FROM mysql.user ORDER BY user;
/* 6:29:43 PM root@127.0.0.1 Comp440ProjectScottSpencer */ SELECT * FROM mysql.db;
/* 6:29:43 PM root@127.0.0.1 Comp440ProjectScottSpencer */ SHOW PRIVILEGES;
/* 6:30:34 PM root@127.0.0.1 Comp440ProjectScottSpencer */ UPDATE mysql.user SET max_questions = 0, max_updates = 0, max_connections = 0 WHERE User = 'appuser1' AND Host = 'localhost';
/* 6:30:34 PM root@127.0.0.1 Comp440ProjectScottSpencer */ GRANT SELECT, UPDATE ON *.* TO 'appuser1'@'localhost';
/* 6:30:34 PM root@127.0.0.1 Comp440ProjectScottSpencer */ REVOKE CREATE ROUTINE, CREATE VIEW, CREATE USER, ALTER, SHOW VIEW, CREATE, ALTER ROUTINE, EVENT, SUPER, INSERT, RELOAD, DELETE, FILE, SHOW DATABASES, TRIGGER, SHUTDOWN, REPLICATION CLIENT, GRANT OPTION, PROCESS, REFERENCES, DROP, REPLICATION SLAVE, EXECUTE, LOCK TABLES, CREATE TEMPORARY TABLES, INDEX ON *.* FROM 'appuser1'@'localhost';
/* 6:30:34 PM root@127.0.0.1 Comp440ProjectScottSpencer */ FLUSH PRIVILEGES;
/* 6:30:37 PM root@127.0.0.1 Comp440ProjectScottSpencer */ SELECT user FROM mysql.user LIMIT 1;
/* 6:30:37 PM root@127.0.0.1 Comp440ProjectScottSpencer */ SELECT * FROM mysql.user ORDER BY user;
/* 6:30:37 PM root@127.0.0.1 Comp440ProjectScottSpencer */ SELECT * FROM mysql.db;
/* 6:30:37 PM root@127.0.0.1 Comp440ProjectScottSpencer */ SHOW PRIVILEGES;