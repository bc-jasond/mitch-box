CREATE DATABASE IF NOT EXISTS `list` /*!40100 DEFAULT CHARACTER SET UTF8 */;

USE `list`;

CREATE TABLE  IF NOT EXISTS `list` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(140) NOT NULL,
  `created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` TIMESTAMP NULL DEFAULT NULL,
  `deleted` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8;

CREATE TABLE IF NOT EXISTS `list_item` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `list_id` BIGINT(20) UNSIGNED NOT NULL,
  `content` VARCHAR(140) NOT NULL,
  `created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` TIMESTAMP NULL DEFAULT NULL,
  `deleted` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `list_id_idx` (`list_id`) USING BTREE,
  CONSTRAINT `fk_id` FOREIGN KEY (`list_id`) REFERENCES `list` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=INNODB DEFAULT CHARSET=UTF8;

SET FOREIGN_KEY_CHECKS = 0 ;
TRUNCATE TABLE list ;
TRUNCATE TABLE list_item ;
SET FOREIGN_KEY_CHECKS = 1 ;

INSERT INTO list (title) VALUES ('Chunder Valley'),('Thames Sunday'),('Bad Dawg') ;

INSERT INTO list_item (list_id, content)
	VALUES
		((SELECT id FROM list WHERE title LIKE 'ch%'), 'Roll \' em high')
		,((SELECT id FROM list WHERE title LIKE 'ch%'), 'Slap yo mammy hina')
		,((SELECT id FROM list WHERE title LIKE 'ch%'), 'In this bidness')
		,((SELECT id FROM list WHERE title LIKE 'th%'), 'British Sunset')
		,((SELECT id FROM list WHERE title LIKE 'th%'), 'Pissed on Cidre')
		,((SELECT id FROM list WHERE title LIKE 'th%'), 'Pass the Geebey')
		,((SELECT id FROM list WHERE title LIKE 'th%'), 'Fish, Chips \'n Christ') ;

SELECT * FROM list_item;


#SELECT list_id, title, content
#	FROM list l
#	INNER JOIN list_item li ON l.id = li.list_id
#WHERE l.title LIKE 'c%';
