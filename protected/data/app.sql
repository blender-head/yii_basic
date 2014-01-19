CREATE TABLE IF NOT EXISTS yii_basic.user (
id INT UNSIGNED NOT NULL AUTO_INCREMENT,
username VARCHAR(45) NOT NULL,
email VARCHAR(60) NOT NULL,
pass CHAR(64) NOT NULL,
type ENUM('public','author','admin') NOT NULL,
date_entered TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (id),
UNIQUE INDEX username_UNIQUE (username ASC),
UNIQUE INDEX email_UNIQUE (email ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8

INSERT INTO user (username, email, pass) VALUES ('admin', 'admin@mail.com', SHA2('12345678', 256))

CREATE TABLE IF NOT EXISTS yii_basic.page (
id INT UNSIGNED NOT NULL AUTO_INCREMENT,
user_id INT UNSIGNED NOT NULL,
live TINYINT(1) UNSIGNED NOT NULL DEFAULT 0,
title VARCHAR(100) NOT NULL,
content LONGTEXT NULL,
date_updated TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
date_published DATE NULL,
PRIMARY KEY (id),
INDEX fk_page_user_idx (user_id ASC),
INDEX date_published (date_published ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci

INSERT INTO page (user_id, title, content) VALUES (23, 'This is the page title.', 'This is the page content.')

CREATE TABLE IF NOT EXISTS yii_basic.comment (
id INT UNSIGNED NOT NULL AUTO_INCREMENT,
user_id INT UNSIGNED NOT NULL,
page_id INT UNSIGNED NOT NULL,
comment MEDIUMTEXT NOT NULL,
date_entered TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (id),
INDEX fk_comment_user_idx (user_id ASC),
INDEX fk_comment_page_idx (page_id ASC),
INDEX date_entered (date_entered ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci

INSERT INTO comment (user_id, page_id, comment) VALUES (23, 149, 'This is the comment.')

CREATE TABLE IF NOT EXISTS yii_basic.file (
id INT UNSIGNED NOT NULL AUTO_INCREMENT,
user_id INT UNSIGNED NOT NULL,
name VARCHAR(80) NOT NULL,
type VARCHAR(45) NOT NULL,
size INT UNSIGNED NOT NULL,
description MEDIUMTEXT NULL,
date_entered TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
date_updated DATETIME NULL,
PRIMARY KEY (id),
INDEX fk_file_user1_idx (user_id ASC),
INDEX name (name ASC),
INDEX date_entered (date_entered ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci

INSERT INTO file (user_id, name, type, size, description) VALUES (23, 'somefile.pdf', 'application/pdf', 239085, 'This is the description')

CREATE TABLE IF NOT EXISTS yii_basic.page_has_file (
page_id INT UNSIGNED NOT NULL,
file_id INT UNSIGNED NOT NULL,
PRIMARY KEY (page_id, file_id),
INDEX fk_page_has_file_file_idx (file_id ASC),
INDEX fk_page_has_file_page_idx (page_id ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8