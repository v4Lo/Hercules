DROP TABLE IF EXISTS `recaptcha`;
CREATE TABLE IF NOT EXISTS `recaptcha` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `account_id` INT(11) UNSIGNED NOT NULL default '0',
  `char_id` int(11) unsigned NOT NULL default '0',
  `ip` VARCHAR(100) NOT NULL DEFAULT '',
  `solving` int(1) unsigned NOT NULL default '1',
  `time_created` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `captcha_id` VARCHAR(100) NOT NULL DEFAULT '',
  `tries` int(11) unsigned NOT NULL default '0',
  `time_solved` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM;