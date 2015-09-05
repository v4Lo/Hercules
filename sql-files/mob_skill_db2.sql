--
-- Table structure for table `mob_skill_db2`
--

DROP TABLE IF EXISTS `mob_skill_db2`;
CREATE TABLE `mob_skill_db2` (
  `MOB_ID` SMALLINT(6) NOT NULL,
  `INFO` TEXT NOT NULL,
  `STATE` TEXT NOT NULL,
  `SKILL_ID` SMALLINT(6) NOT NULL,
  `SKILL_LV` TINYINT(4) NOT NULL,
  `RATE` SMALLINT(4) NOT NULL,
  `CASTTIME` MEDIUMINT(9) NOT NULL,
  `DELAY` INT(9) NOT NULL,
  `CANCELABLE` TEXT NOT NULL,
  `TARGET` TEXT NOT NULL,
  `CONDITION` TEXT NOT NULL,
  `CONDITION_VALUE` TEXT,
  `VAL1` MEDIUMINT(9) DEFAULT NULL,
  `VAL2` MEDIUMINT(9) DEFAULT NULL,
  `VAL3` MEDIUMINT(9) DEFAULT NULL,
  `VAL4` MEDIUMINT(9) DEFAULT NULL,
  `VAL5` MEDIUMINT(9) DEFAULT NULL,
  `EMOTION` TEXT,
  `CHAT` TEXT
) ENGINE=MyISAM;

--  Custom Mob Skill Database
-- 
--  Structure of Database:
-- INSERT INTO `mob_skill_db2` (`MOB_ID`, `INFO`, `STATE`, `SKILL_ID`, `SKILL_LV`, `RATE`, `CASTTIME`, `DELAY`, `CANCELABLE`, `TARGET`, `CONDITION`, `CONDITION_VALUE`, `VAL1`, `VAL2`, `VAL3`, `VAL4`, `VAL5`, `EMOTION`, `CHAT`);
-- 
--  RATE: the chance of the skill being casted when the condition is fulfilled (10000 = 100%).
--  DELAY: the time (in milliseconds) before attempting to recast the same skill.
-- 
--  STATE:
-- 	any (except dead) / idle (in standby) / walk (in movement) / dead (on killed) /
-- 	loot /attack / angry (like attack, except player has not attacked mob yet) /
-- 	chase (following target, after being attacked) / follow (following target,
-- 	without being attacked) / anytarget (attack+angry+chase+follow)
-- 
--  TARGET:
-- 	target (current target) / self / friend / master / randomtarget (any enemy within skill's range)
-- 
-- 	The following are for ground-skills, a random target tile is selected from the specified area:
-- 	    around1 (3x3 area around self) / around2 (5x5 area around self) /
-- 	    around3 (7x7 area around self) / around4 (9x9 area around self) /
-- 	    around5 (3x3 area around target) / around6 (5x5 area around target) /
-- 	    around7 (7x7 area around target) / around8 (9x9 area around target) /
-- 	    around = around4
-- 
--  CONDITION:
-- 	always			Unconditional (no condition value).
-- 	onspawn			When mob spawns/respawns (no condition value).
-- 	myhpltmaxrate		When mob's HP drops to the specified %.
-- 	myhpinrate		When mob's HP is in a certain % range (condition value = lower bound, val1 = upper bound).
-- 	mystatuson		If mob has the specified abnormality in status.
-- 	mystatusoff		If mob has ended the specified abnormality in status.
-- 	friendhpltmaxrate	When mob's friend's HP drops to the specified %.
-- 	friendhpinrate		When mob's friend's HP is in a certain % range (condition value = lower bound, val1 = upper bound).
-- 	friendstatuson		If friend has the specified abnormality in status.
-- 	friendstatusoff		If friend has ended the specified abnormality in status.
-- 	attackpcgt		When attack PCs become greater than specified number.
-- 	attackpcge		When attack PCs become greater than or equal to the specified number.
-- 	slavelt			When number of slaves is less than the original specified number.
-- 	slavele			When number of slaves is less than or equal to the original specified number.
-- 	closedattacked		When close range melee attacked (no condition value).
-- 	longrangeattacked	When long range attacked, ex. bows, guns, ranged skills (no condition value).
-- 	skillused		When the specified skill is used on the mob.
-- 	afterskill		After mob casts the specified skill.
-- 	casttargeted		When a target is in cast range (no condition value).
-- 	rudeattacked		When mob is rude attacked (no condition value).
-- 
-- 	Status abnormalities specified through the statuson/statusoff system:
-- 	    anybad (any type of state change) / stone / freeze / stun / sleep /
-- 	    poison / curse / silence / confusion / blind / hiding / sight (unhidden)
-- 
--  Note: if a negative MobID is provided, the skill will be treated as 'global':
-- 	-1: added for all boss types.
-- 	-2: added for all normal types.
-- 	-4: added for all mobs.
--  rAthena Dev Team
-- REPLACE INTO `mob_skill_db2` VALUES (1900,'Valaris@AL_TELEPORT','idle',26,1,10000,0,0,'yes','self','rudeattacked',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (1900,'Valaris@AL_TELEPORT','walk',26,1,500,0,5000,'yes','self','rudeattacked',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (1900,'Valaris@KN_BRANDISHSPEAR','attack',57,10,2000,500,5000,'no','target','always',0,NULL,NULL,NULL,NULL,NULL,29,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (1900,'Valaris@MO_BODYRELOCATION','chase',264,1,200,200,1000,'yes','target','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (1900,'Valaris@NPC_ARMORBRAKE','attack',344,10,2000,0,5000,'no','target','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (1900,'Valaris@NPC_CALLSLAVE','attack',352,1,10000,0,30000,'yes','target','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (1900,'Valaris@NPC_CALLSLAVE','idle',352,1,10000,0,30000,'yes','self','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (1900,'Valaris@NPC_DARKBREATH','attack',202,5,2000,800,5000,'no','target','always',0,NULL,NULL,NULL,NULL,NULL,29,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (1900,'Valaris@NPC_DARKSTRIKE','chase',340,10,200,0,1000,'yes','target','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (1900,'Valaris@NPC_GUIDEDATTACK','attack',172,5,500,0,20000,'no','target','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (1900,'Valaris@NPC_POWERUP','attack',349,5,10000,0,30000,'yes','self','myhpltmaxrate',30,NULL,NULL,NULL,NULL,NULL,6,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (1900,'Valaris@NPC_SUMMONSLAVE','attack',196,6,10000,700,10000,'no','self','slavele',3,1902,NULL,NULL,NULL,NULL,NULL,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (1900,'Valaris@NPC_SUMMONSLAVE','idle',196,6,10000,700,10000,'no','self','slavele',3,1902,NULL,NULL,NULL,NULL,NULL,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (1900,'Valaris@WZ_VERMILION','attack',85,10,2000,500,2000,'no','target','always',0,NULL,NULL,NULL,NULL,NULL,29,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (1900,'Valaris@WZ_VERMILION','chase',85,10,200,500,2000,'no','target','always',0,NULL,NULL,NULL,NULL,NULL,29,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (1900,'Valaris@WZ_VERMILION','chase',85,10,500,500,2000,'no','target','skillused',18,NULL,NULL,NULL,NULL,NULL,29,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (1901,'Valaris\'s Worshipper@AL_TELEPORT','idle',26,1,10000,0,0,'yes','self','rudeattacked',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (1901,'Valaris\'s Worshipper@NPC_CURSEATTACK','attack',181,3,500,800,5000,'no','target','always',0,NULL,NULL,NULL,NULL,NULL,29,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (1901,'Valaris\'s Worshipper@NPC_DARKNESSATTACK','attack',190,2,500,500,5000,'no','target','always',0,NULL,NULL,NULL,NULL,NULL,6,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (1901,'Valaris\'s Worshipper@NPC_EMOTION','chase',197,1,20,0,5000,'yes','self','always',0,19,129,NULL,NULL,NULL,NULL,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (1901,'Valaris\'s Worshipper@NPC_EMOTION','idle',197,1,200,0,5000,'yes','self','always',0,6,1173,NULL,NULL,NULL,NULL,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (1901,'Valaris\'s Worshipper@NPC_EMOTION','walk',197,1,200,0,5000,'yes','self','always',0,2,NULL,NULL,NULL,NULL,NULL,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (1901,'Valaris\'s Worshipper@NPC_HALLUCINATION','attack',207,1,500,500,5000,'yes','target','always',0,NULL,NULL,NULL,NULL,NULL,29,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (1901,'Valaris\'s Worshipper@NPC_HALLUCINATION','chase',207,1,50,500,5000,'yes','target','always',0,NULL,NULL,NULL,NULL,NULL,29,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (1901,'Valaris\'s Worshipper@SA_DISPELL','attack',289,1,0,0,30000,'yes','target','always',0,NULL,NULL,NULL,NULL,NULL,29,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (1902,'MC Cameri@AL_TELEPORT','idle',26,1,10000,0,0,'yes','self','rudeattacked',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (1902,'MC Cameri@AL_TELEPORT','walk',26,1,500,0,5000,'yes','self','rudeattacked',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (1902,'MC Cameri@KN_BRANDISHSPEAR','attack',57,10,2000,500,5000,'no','target','always',0,NULL,NULL,NULL,NULL,NULL,29,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (1902,'MC Cameri@MO_BODYRELOCATION','chase',264,1,200,200,1000,'yes','target','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (1902,'MC Cameri@NPC_ARMORBRAKE','attack',344,10,2000,0,5000,'no','target','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (1902,'MC Cameri@NPC_DARKBREATH','attack',202,5,2000,800,5000,'no','target','always',0,NULL,NULL,NULL,NULL,NULL,29,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (1902,'MC Cameri@NPC_DARKSTRIKE','chase',340,10,200,0,1000,'yes','target','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (1902,'MC Cameri@NPC_GUIDEDATTACK','attack',172,5,500,0,20000,'no','target','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (1902,'MC Cameri@NPC_POWERUP','attack',349,5,10000,0,30000,'yes','self','myhpltmaxrate',30,NULL,NULL,NULL,NULL,NULL,6,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (1902,'MC Cameri@WZ_VERMILION','attack',85,10,2000,500,2000,'no','target','always',0,NULL,NULL,NULL,NULL,NULL,29,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (1902,'MC Cameri@WZ_VERMILION','chase',85,10,200,500,2000,'no','target','always',0,NULL,NULL,NULL,NULL,NULL,29,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (1902,'MC Cameri@WZ_VERMILION','chase',85,10,500,500,2000,'no','target','skillused',18,NULL,NULL,NULL,NULL,NULL,29,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (1903,'Poki#3@AC_DOUBLE','attack',46,10,500,1000,5000,'no','target','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (1903,'Poki#3@AC_SHOWER','attack',47,8,2000,1000,5000,'no','target','attackpcgt',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (1903,'Poki#3@BS_MAXIMIZE','chase',114,5,500,1000,5000,'no','self','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (1903,'Poki#3@BS_MAXIMIZE','attack',114,5,500,1000,5000,'no','self','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (1903,'Poki#3@NPC_AGIUP','chase',350,5,2500,0,5000,'no','self','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (1903,'Poki#3@NPC_POWERUP','attack',349,5,500,0,30000,'yes','self','myhpltmaxrate',30,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (1903,'Poki#3@SN_SHARPSHOOTING','attack',382,5,500,1000,5000,'no','target','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (1903,'Poki#3@HT_SKIDTRAP','idle',115,5,50,0,5000,'yes','self','always',0,NULL,NULL,NULL,NULL,NULL,29,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (1903,'Poki#3@HT_FREEZINGTRAP','idle',120,5,50,0,300000,'yes','self','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (1903,'Poki#3@HT_FREEZINGTRAP','idle',121,5,50,0,300000,'yes','self','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (1903,'Poki#3@AC_CHARGEARROW','attack',148,1,500,0,5000,'yes','target','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (1903,'Poki#3@HT_FLASHER','idle',120,5,50,0,300000,'yes','self','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (1903,'Poki#3@NPC_SUMMONSLAVE','idle',196,5,10000,2000,120000,'no','self','slavele',1,1659,1660,1661,1662,1663,0,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (1903,'Poki#3@NPC_CALLSLAVE','attack',352,1,2000,0,10000,'yes','target','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (1903,'Poki#3@NPC_CALLSLAVE','idle',352,1,2000,0,10000,'yes','self','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (1903,'Poki#3@NPC_CHANGEWATER','attack',162,1,10000,2000,600000,'no','self','myhpltmaxrate',30,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (1903,'Poki#3@NPC_CHANGETELEKINESIS','attack',169,1,500,2000,5000,'no','self','myhpltmaxrate',10,NULL,NULL,NULL,NULL,NULL,7,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (1903,'Poki#3@AL_TELEPORT','idle',26,1,10000,0,0,'yes','self','rudeattacked',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
--  Easter Bunny (not in the db?? it's in db2!)
-- REPLACE INTO `mob_skill_db2` VALUES (1921,'Easter Bunny@NPC_SUMMONSLAVE','attack',196,5,10000,3000,10000,'no','self','slavele',2,1063,NULL,NULL,NULL,NULL,NULL,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (1921,'Easter Bunny@NPC_SUMMONSLAVE','idle',196,5,5000,2000,40000,'no','self','always',2,1920,NULL,NULL,NULL,NULL,NULL,NULL);
-- Custom Fire Poring. Warning, Colides with META_DENIRO
-- REPLACE INTO `mob_skill_db2` VALUES (1239,'Fire Poring@AL_HEAL','idle',28,10,10000,0,2000,'yes','self','always',0,NULL,NULL,NULL,NULL,NULL,4,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (1239,'Fire Poring@AL_HEAL','walk',28,10,10000,0,2000,'yes','self','always',0,NULL,NULL,NULL,NULL,NULL,4,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (1239,'Fire Poring@AL_TELEPORT','attack',26,1,1000,5000,60000,'no','self','myhpltmaxrate',30,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (1239,'Fire Poring@AL_TELEPORT','idle',26,1,10000,0,0,'yes','self','rudeattacked',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (1239,'Fire Poring@NPC_DARKBLESSING','attack',203,1,1000,2000,5000,'no','target','always',0,NULL,NULL,NULL,NULL,NULL,18,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (1239,'Fire Poring@NPC_SUMMONSLAVE','attack',196,16,10000,2000,10000,'no','self','slavele',3,1491,1431,1433,NULL,NULL,18,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (1239,'Fire Poring@NPC_SUMMONSLAVE','idle',196,16,10000,2000,10000,'no','self','slavele',3,1491,1431,1433,NULL,NULL,18,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (1239,'Fire Poring@RG_INTIMIDATE','attack',219,5,1000,0,3000,'yes','target','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (1239,'Fire Poring@RG_STRIPARMOR','attack',217,5,2000,0,3000,'yes','target','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (1239,'Fire Poring@RG_STRIPHELM','attack',218,5,2000,0,3000,'yes','target','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (1239,'Fire Poring@RG_STRIPSHIELD','attack',216,5,2000,0,3000,'yes','target','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (1239,'Fire Poring@RG_STRIPWEAPON','attack',215,5,2000,0,3000,'yes','target','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
-- iRO Halloween Event 2009
-- REPLACE INTO `mob_skill_db2` VALUES (3014,'Halloween Whisper@AS_CLOAKING','idle',135,1,2000,200,5000,'yes','self','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (3014,'Halloween Whisper@AS_CLOAKING','chase',135,1,2000,200,5000,'yes','self','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (3014,'Halloween Whisper@NPC_EMOTION','idle',197,1,2000,0,5000,'yes','self','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (3014,'Halloween Whisper@NPC_EMOTION','chase',197,1,200,0,5000,'yes','self','always',0,19,0x81,NULL,NULL,NULL,NULL,NULL);
--  Here you can place your custom mob skills
REPLACE INTO `mob_skill_db2` VALUES (2150,'Lord Knight Seyren@NPC_SELFDESTRUCTION','attack',173,1,2000,2000,0,'no','self','myhpltmaxrate',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (2150,'Lord Knight Seyren@RG_INTIMIDATE','attack',219,10,100,0,5000,'yes','target','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2150,'Lord Knight Seyren@WZ_STORMGUST','idle',89,1,10000,0,0,'yes','target','rudeattacked',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2150,'Lord Knight Seyren@WZ_STORMGUST','walk',89,1,5000,0,5000,'yes','target','rudeattacked',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2150,'Lord Knight Seyren@KN_SPEARBOOMERANG','idle',59,5,10000,0,0,'yes','randomtarget','always',0,NULL,NULL,NULL,NULL,NULL,6,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2150,'Lord Knight Seyren@LK_SPIRALPIERCE','chase',397,5,2000,0,5000,'yes','target','myhpltmaxrate',60,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2150,'Lord Knight Seyren@LK_SPIRALPIERCE','attack',397,5,2000,0,5000,'yes','target','myhpltmaxrate',60,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2150,'Lord Knight Seyren@KN_SPEARBOOMERANG','chase',59,5,10000,0,0,'yes','target','skillused',18,NULL,NULL,NULL,NULL,NULL,6,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2150,'Lord Knight Seyren@KN_TWOHANDQUICKEN','attack',60,20,10000,0,300000,'yes','self','always',0,NULL,NULL,NULL,NULL,NULL,2,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (2150,'Lord Knight Seyren@KN_BOWLINGBASH','attack',62,10,1000,0,10000,'yes','target','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (2150,'Lord Knight Seyren@KN_BOWLINGBASH','attack',62,10,2000,0,0,'yes','target','myhpltmaxrate',30,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2150,'Lord Knight Seyren@SM_BASH','attack',5,10,1000,0,5000,'yes','target','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2150,'Lord Knight Seyren@SM_BASH','attack',5,10,2000,0,0,'yes','target','myhpltmaxrate',30,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2150,'Lord Knight Seyren@SM_MAGNUM','attack',7,20,1000,0,0,'yes','self','attackpcge',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2150,'Lord Knight Seyren@NPC_POWERUP','attack',349,5,2000,0,100000,'yes','self','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2150,'Lord Knight Seyren@NPC_POWERUP','attack',349,5,2000,0,25000,'yes','self','myhpltmaxrate',30,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2150,'Lord Knight Seyren@SM_PROVOKE','attack',6,10,1000,0,300000,'yes','target','always',0,NULL,NULL,NULL,NULL,NULL,29,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2150,'Lord Knight Seyren@SM_PROVOKE','chase',6,10,1000,0,5000,'yes','target','always',0,NULL,NULL,NULL,NULL,NULL,29,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2150,'Lord Knight Seyren@SM_ENDURE','chase',8,10,2000,0,30000,'yes','self','longrangeattacked',NULL,NULL,NULL,NULL,NULL,NULL,6,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2150,'Lord Knight Seyren@NPC_CRITICALSLASH','attack',170,1,1000,0,5000,'yes','target','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2150,'Lord Knight Seyren@NPC_STUNATTACK','attack',179,5,1000,0,5000,'yes','target','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2150,'Lord Knight Seyren@NPC_FIREATTACK','attack',186,10,1000,0,5000,'yes','target','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2151,'Assassin Cross Eremes@NPC_SELFDESTRUCTION','attack',173,1,2000,2000,0,'no','self','myhpltmaxrate',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (2151,'Assassin Cross Eremes@RG_INTIMIDATE','attack',219,10,100,0,5000,'yes','target','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2151,'Assassin Cross Eremes@WZ_METEOR','idle',83,1,10000,0,0,'yes','target','rudeattacked',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2151,'Assassin Cross Eremes@WZ_METEOR','walk',83,1,5000,0,5000,'yes','target','rudeattacked',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2151,'Assassin Cross Eremes@AS_GRIMTOOTH','idle',137,5,10000,0,0,'yes','randomtarget','always',0,NULL,NULL,NULL,NULL,NULL,6,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2151,'Assassin Cross Eremes@AS_GRIMTOOTH','chase',137,5,10000,0,0,'yes','target','skillused',18,NULL,NULL,NULL,NULL,NULL,6,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2151,'Assassin Cross Eremes@ASC_BREAKER','chase',379,10,2000,0,5000,'yes','target','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2151,'Assassin Cross Eremes@ASC_METEORASSAULT','attack',406,10,2000,0,10000,'yes','self','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2151,'Assassin Cross Eremes@NPC_INVISIBLE','idle',353,1,2000,0,30000,'yes','self','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2151,'Assassin Cross Eremes@NPC_INVISIBLE','attack',353,1,2000,0,30000,'yes','self','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2151,'Assassin Cross Eremes@NPC_GUIDEDATTACK','attack',172,10,2000,0,15000,'yes','target','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2151,'Assassin Cross Eremes@TF_POISON','attack',52,10,1000,0,10000,'yes','target','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2151,'Assassin Cross Eremes@NPC_AGIUP','attack',350,5,2000,0,100000,'yes','self','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2151,'Assassin Cross Eremes@NPC_AGIUP','attack',350,5,2000,0,25000,'yes','self','myhpltmaxrate',30,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2151,'Assassin Cross Eremes@AS_SONICBLOW','attack',136,10,2000,0,5000,'yes','target','always',0,NULL,NULL,NULL,NULL,NULL,6,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2151,'Assassin Cross Eremes@AS_SONICBLOW','attack',136,10,3000,0,0,'yes','target','myhpltmaxrate',30,NULL,NULL,NULL,NULL,NULL,6,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2151,'Assassin Cross Eremes@AS_GRIMTOOTH','chase',137,5,2000,0,0,'yes','target','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2151,'Assassin Cross Eremes@AS_VENOMDUST','idle',140,1,2000,0,10000,'yes','randomtarget','always',0,NULL,NULL,NULL,NULL,NULL,29,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2151,'Assassin Cross Eremes@AS_VENOMDUST','attack',140,1,2000,0,10000,'yes','target','always',0,NULL,NULL,NULL,NULL,NULL,29,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2151,'Assassin Cross Eremes@NPC_CRITICALSLASH','attack',170,1,1000,0,5000,'yes','target','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2151,'Assassin Cross Eremes@NPC_STUNATTACK','attack',179,5,1000,0,5000,'yes','target','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2151,'Assassin Cross Eremes@NPC_POISONATTACK','attack',188,10,1000,0,5000,'yes','target','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2152,'Whitesmith Howard@NPC_SELFDESTRUCTION','attack',173,1,2000,2000,0,'no','self','myhpltmaxrate',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (2152,'Whitesmith Howard@RG_INTIMIDATE','attack',219,10,100,0,5000,'yes','target','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2152,'Whitesmith Howard@WZ_METEOR','idle',83,1,10000,0,0,'yes','target','rudeattacked',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2152,'Whitesmith Howard@WZ_METEOR','walk',83,1,5000,0,5000,'yes','target','rudeattacked',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2152,'Whitesmith Howard@BS_ADRENALINE','attack',111,10,2000,0,150000,'yes','self','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2152,'Whitesmith Howard@BS_MAXIMIZE','attack',114,1,1000,0,60000,'yes','self','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2152,'Whitesmith Howard@MC_MAMMONITE','attack',42,20,2000,0,5000,'yes','target','always',0,NULL,NULL,NULL,NULL,NULL,23,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2152,'Whitesmith Howard@MC_MAMMONITE','attack',42,20,2000,0,0,'yes','target','myhpltmaxrate',30,NULL,NULL,NULL,NULL,NULL,23,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2152,'Whitesmith Howard@BS_HAMMERFALL','chase',110,11,2000,0,5000,'yes','target','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2152,'Whitesmith Howard@BS_HAMMERFALL','attack',110,11,2000,0,5000,'yes','target','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2152,'Whitesmith Howard@NPC_POWERUP','attack',349,5,2000,0,100000,'yes','self','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2152,'Whitesmith Howard@NPC_POWERUP','attack',349,5,2000,0,25000,'yes','self','myhpltmaxrate',30,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2152,'Whitesmith Howard@NPC_SPLASHATTACK','attack',174,1,1000,0,0,'yes','target','attackpcge',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2152,'Whitesmith Howard@NPC_ARMORBRAKE','attack',344,10,1000,0,5000,'yes','target','always',0,NULL,NULL,NULL,NULL,NULL,19,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2152,'Whitesmith Howard@NPC_HELMBRAKE','attack',345,10,1000,0,5000,'yes','target','always',0,NULL,NULL,NULL,NULL,NULL,19,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2152,'Whitesmith Howard@NPC_SHIELDBRAKE','attack',346,10,1000,0,5000,'yes','target','always',0,NULL,NULL,NULL,NULL,NULL,19,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2152,'Whitesmith Howard@NPC_CRITICALSLASH','attack',170,1,1000,0,5000,'yes','target','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2152,'Whitesmith Howard@NPC_WATERATTACK','attack',184,10,1000,0,5000,'yes','target','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2153,'High Priest Margaretha@HP_ASSUMPTIO','idle',361,5,10000,1000,10000,'no','self','myhpltmaxrate',90,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2153,'High Priest Margaretha@HP_ASSUMPTIO','chase',361,5,10000,1000,10000,'no','self','myhpltmaxrate',90,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2153,'High Priest Margaretha@HP_ASSUMPTIO','idle',361,5,10000,1000,10000,'no','friend','friendhpltmaxrate',100,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2153,'High Priest Margaretha@HP_ASSUMPTIO','chase',361,5,10000,1000,10000,'no','friend','friendhpltmaxrate',100,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2153,'High Priest Margaretha@NPC_SELFDESTRUCTION','attack',173,1,2000,2000,0,'no','self','myhpltmaxrate',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (2153,'High Priest Margaretha@RG_INTIMIDATE','attack',219,10,100,0,5000,'yes','target','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2153,'High Priest Margaretha@WZ_METEOR','idle',83,1,10000,0,0,'yes','target','rudeattacked',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2153,'High Priest Margaretha@WZ_METEOR','walk',83,1,5000,0,5000,'yes','target','rudeattacked',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2153,'High Priest Margaretha@AL_PNEUMA','idle',25,1,10000,0,0,'yes','self','longrangeattacked',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2153,'High Priest Margaretha@AL_INCAGI','attack',29,10,2000,0,240000,'yes','self','always',0,NULL,NULL,NULL,NULL,NULL,2,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2153,'High Priest Margaretha@AL_INCAGI','chase',29,10,2000,0,240000,'yes','self','always',0,NULL,NULL,NULL,NULL,NULL,2,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2153,'High Priest Margaretha@AL_DECAGI','chase',30,48,2000,0,10000,'yes','target','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2153,'High Priest Margaretha@MG_SAFETYWALL','attack',12,10,1000,0,5000,'yes','self','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2153,'High Priest Margaretha@AL_PNEUMA','attack',25,1,5000,0,10000,'yes','self','longrangeattacked',NULL,NULL,NULL,NULL,NULL,NULL,19,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2153,'High Priest Margaretha@AL_PNEUMA','chase',25,1,5000,0,10000,'yes','self','longrangeattacked',NULL,NULL,NULL,NULL,NULL,NULL,19,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2153,'High Priest Margaretha@PR_LEXDIVINA','attack',76,10,2000,0,5000,'yes','target','always',0,NULL,NULL,NULL,NULL,NULL,18,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2153,'High Priest Margaretha@PR_LEXDIVINA','chase',76,10,2000,0,5000,'yes','target','always',0,NULL,NULL,NULL,NULL,NULL,18,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2153,'High Priest Margaretha@PR_LEXDIVINA','idle',76,10,10000,0,5000,'yes','target','casttargeted',NULL,NULL,NULL,NULL,NULL,NULL,18,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2153,'High Priest Margaretha@PR_LEXDIVINA','attack',76,10,5000,0,5000,'yes','target','casttargeted',NULL,NULL,NULL,NULL,NULL,NULL,18,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2153,'High Priest Margaretha@PR_LEXDIVINA','chase',76,10,5000,0,5000,'yes','target','casttargeted',NULL,NULL,NULL,NULL,NULL,NULL,18,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2153,'High Priest Margaretha@PR_LEXAETERNA','attack',78,1,1000,0,5000,'yes','target','always',0,NULL,NULL,NULL,NULL,NULL,29,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2153,'High Priest Margaretha@PR_LEXAETERNA','chase',78,1,1000,0,5000,'yes','target','always',0,NULL,NULL,NULL,NULL,NULL,29,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2153,'High Priest Margaretha@NPC_CRITICALSLASH','attack',170,1,1000,0,5000,'yes','target','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2153,'High Priest Margaretha@NPC_STUNATTACK','attack',179,5,1000,0,5000,'yes','target','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2153,'High Priest Margaretha@NPC_HOLYATTACK','attack',189,10,1000,0,5000,'yes','target','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2153,'High Priest Margaretha@AL_HEAL','attack',28,11,3000,0,1500,'yes','friend','friendhpltmaxrate',99,NULL,NULL,NULL,NULL,NULL,3,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2153,'High Priest Margaretha@AL_HEAL','attack',28,11,3000,0,1500,'yes','self','myhpltmaxrate',99,NULL,NULL,NULL,NULL,NULL,3,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2153,'High Priest Margaretha@AL_HEAL','idle',28,11,3000,0,1500,'yes','friend','friendhpltmaxrate',99,NULL,NULL,NULL,NULL,NULL,3,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2153,'High Priest Margaretha@AL_HEAL','idle',28,11,3000,0,1500,'yes','self','myhpltmaxrate',99,NULL,NULL,NULL,NULL,NULL,3,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2153,'High Priest Margaretha@AL_HEAL','chase',28,11,3000,0,1500,'yes','friend','friendhpltmaxrate',99,NULL,NULL,NULL,NULL,NULL,3,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2153,'High Priest Margaretha@AL_HEAL','chase',28,11,3000,0,1500,'yes','self','myhpltmaxrate',99,NULL,NULL,NULL,NULL,NULL,3,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2154,'Sniper Cecil@NPC_SELFDESTRUCTION','attack',173,1,2000,2000,0,'no','self','myhpltmaxrate',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (2154,'Sniper Cecil@RG_INTIMIDATE','attack',219,10,100,0,5000,'yes','target','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2154,'Sniper Cecil@WZ_METEOR','idle',83,1,10000,0,0,'yes','target','rudeattacked',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2154,'Sniper Cecil@WZ_METEOR','walk',83,1,5000,0,5000,'yes','target','rudeattacked',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2154,'Sniper Cecil@AC_DOUBLE','attack',46,10,2000,0,3000,'yes','target','always',0,NULL,NULL,NULL,NULL,NULL,6,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2154,'Sniper Cecil@AC_SHOWER','attack',47,10,2000,0,3000,'yes','target','always',0,NULL,NULL,NULL,NULL,NULL,6,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2154,'Sniper Cecil@AC_CHARGEARROW','attack',148,1,2000,0,3000,'yes','target','always',0,NULL,NULL,NULL,NULL,NULL,6,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2154,'Sniper Cecil@NPC_POWERUP','attack',349,5,2000,0,100000,'yes','self','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2154,'Sniper Cecil@NPC_POWERUP','attack',349,5,2000,0,25000,'yes','self','myhpltmaxrate',30,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2154,'Sniper Cecil@NPC_AGIUP','attack',350,5,2000,0,100000,'yes','self','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2154,'Sniper Cecil@NPC_AGIUP','attack',350,5,2000,0,25000,'yes','self','myhpltmaxrate',30,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2154,'Sniper Cecil@SN_SHARPSHOOTING','attack',382,5,2000,500,1500,'no','target','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2154,'Sniper Cecil@HT_LANDMINE','idle',116,5,2000,0,60000,'yes','around3','always',0,NULL,NULL,NULL,NULL,NULL,5,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2154,'Sniper Cecil@HT_LANDMINE','attack',116,5,500,0,5000,'yes','around3','always',0,NULL,NULL,NULL,NULL,NULL,5,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2154,'Sniper Cecil@HT_ANKLESNARE','idle',117,5,2000,0,60000,'yes','around3','always',0,NULL,NULL,NULL,NULL,NULL,5,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2154,'Sniper Cecil@HT_ANKLESNARE','attack',117,5,500,0,5000,'yes','around3','always',0,NULL,NULL,NULL,NULL,NULL,5,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2154,'Sniper Cecil@HT_BLASTMINE','idle',122,5,2000,0,60000,'yes','around3','always',0,NULL,NULL,NULL,NULL,NULL,5,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2154,'Sniper Cecil@HT_BLASTMINE','attack',122,5,500,0,5000,'yes','around3','always',0,NULL,NULL,NULL,NULL,NULL,5,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2154,'Sniper Cecil@NPC_CRITICALSLASH','attack',170,1,1000,0,5000,'yes','target','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2154,'Sniper Cecil@NPC_STUNATTACK','attack',179,5,1000,0,5000,'yes','target','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2154,'Sniper Cecil@NPC_WINDATTACK','attack',187,10,1000,0,5000,'yes','target','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2155,'High Wizard Kathryne@NPC_SELFDESTRUCTION','attack',173,1,2000,2000,0,'no','self','myhpltmaxrate',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (2155,'High Wizard Kathryne@RG_INTIMIDATE','attack',219,10,100,0,5000,'yes','target','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2155,'High Wizard Kathryne@WZ_METEOR','idle',83,1,10000,0,0,'yes','target','rudeattacked',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2155,'High Wizard Kathryne@WZ_METEOR','walk',83,1,5000,0,5000,'yes','target','rudeattacked',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (2155,'High Wizard Kathryne@NPC_SUMMONSLAVE','attack',196,1,10000,700,30000,'no','self','slavele',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
-- REPLACE INTO `mob_skill_db2` VALUES (2155,'High Wizard Kathryne@NPC_SUMMONSLAVE','idle',196,1,10000,700,30000,'no','self','slavele',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2155,'High Wizard Kathryne@WZ_STORMGUST','idle',89,10,10000,1000,10000,'no','randomtarget','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2155,'High Wizard Kathryne@WZ_VERMILION','idle',85,20,10000,1000,10000,'no','randomtarget','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2155,'High Wizard Kathryne@WZ_METEOR','idle',83,11,10000,1000,10000,'no','randomtarget','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2155,'High Wizard Kathryne@HW_GANBANTEIN','attack',483,5,10000,500,7000,'no','target','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2155,'High Wizard Kathryne@HW_NAPALMVULCAN','chase',400,5,2000,1000,2000,'no','target','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2155,'High Wizard Kathryne@WZ_STORMGUST','chase',89,10,10000,1000,10000,'no','target','skillused',18,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2155,'High Wizard Kathryne@WZ_VERMILION','chase',85,20,10000,1000,10000,'no','target','skillused',18,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2155,'High Wizard Kathryne@WZ_METEOR','chase',83,11,10000,1000,10000,'no','target','skillused',18,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2155,'High Wizard Kathryne@MG_SIGHT','idle',10,1,500,0,5000,'yes','self','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2155,'High Wizard Kathryne@MG_SIGHT','idle',10,1,10000,0,5000,'yes','self','skillused',137,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2155,'High Wizard Kathryne@WZ_STORMGUST','chase',89,10,10000,1000,20000,'no','target','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2155,'High Wizard Kathryne@WZ_VERMILION','chase',85,20,10000,1000,20000,'no','target','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2155,'High Wizard Kathryne@WZ_STORMGUST','attack',89,10,10000,1000,20000,'no','target','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2155,'High Wizard Kathryne@WZ_VERMILION','attack',85,20,10000,1000,20000,'no','target','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2155,'High Wizard Kathryne@WZ_FIREPILLAR','idle',80,11,5000,200,2000,'yes','around2','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2155,'High Wizard Kathryne@WZ_FIREPILLAR','attack',80,11,2000,200,0,'yes','target','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2155,'High Wizard Kathryne@WZ_METEOR','chase',83,11,10000,1000,20000,'no','target','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2155,'High Wizard Kathryne@WZ_METEOR','attack',83,11,10000,1000,20000,'no','target','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2155,'High Wizard Kathryne@WZ_HEAVENDRIVE','attack',91,5,2000,0,20000,'yes','target','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2155,'High Wizard Kathryne@WZ_WATERBALL','chase',86,5,5000,0,3000,'yes','target','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2155,'High Wizard Kathryne@WZ_WATERBALL','attack',86,5,5000,0,3000,'yes','target','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

REPLACE INTO `mob_skill_db2` VALUES (2160,'Errende Ebecee@AL_HEAL','attack',28,1,10000,0,3000,'yes','friend','friendhpltmaxrate',99,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2160,'Errende Ebecee@AL_HEAL','attack',28,1,10000,0,3000,'yes','self','myhpltmaxrate',99,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2160,'Errende Ebecee@AL_HEAL','idle',28,1,10000,0,3000,'yes','friend','friendhpltmaxrate',99,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2160,'Errende Ebecee@AL_HEAL','idle',28,1,10000,0,3000,'yes','self','myhpltmaxrate',99,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2160,'Errende Ebecee@AL_HEAL','chase',28,1,10000,0,3000,'yes','friend','friendhpltmaxrate',99,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2160,'Errende Ebecee@AL_HEAL','chase',28,1,10000,0,3000,'yes','self','myhpltmaxrate',99,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

REPLACE INTO `mob_skill_db2` VALUES (2161,'Egnigem Cenia@SM_MAGNUM','attack',7,2,10000,500,15000,'no','self','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

REPLACE INTO `mob_skill_db2` VALUES (2162,'Wickebine Tres@NPC_POISONATTACK','attack',188,1,10000,0,15000,'yes','target','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2162,'Wickebine Tres@TF_POISON','attack',52,5,10000,1000,1000,'no','target','skillused',52,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2162,'Wickebine Tres@TF_THROWSTONE','attack',152,1,3000,0,3000,'yes','randomtarget','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

REPLACE INTO `mob_skill_db2` VALUES (2163,'Laurell Weinder@MG_THUNDERSTORM','attack',21,5,10000,5000,0,'no','randomtarget','always',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

REPLACE INTO `mob_skill_db2` VALUES (2164,'Zumm@AL_HEAL','attack',28,2,10000,0,500,'yes','friend','friendhpltmaxrate',99,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2164,'Zumm@AL_HEAL','attack',28,2,10000,0,500,'yes','self','myhpltmaxrate',99,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2164,'Zumm@PR_LEXAETERNA','attack',78,1,10000,0,5000,'yes','randomtarget','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2164,'Zumm@PR_LEXDIVINA','attack',76,1,10000,0,5000,'yes','randomtarget','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2164,'Zumm@AL_AGIDOWN','chase',30,10,5000,0,3000,'yes','target','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2164,'Zumm@NPC_ALLHEAL','idle',687,1,10000,0,0,'yes','self','rudeattacked',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2164,'Zumm@NPC_ALLHEAL','walk',687,1,10000,0,0,'yes','self','rudeattacked',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2164,'Zumm@AL_HEAL','idle',28,10,10000,0,0,'yes','friend','friendhpltmaxrate',99,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2164,'Zumm@AL_HEAL','idle',28,10,10000,0,0,'yes','self','myhpltmaxrate',99,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

REPLACE INTO `mob_skill_db2` VALUES (2165,'Honey@SM_MAGNUM','attack',7,3,10000,0,3000,'no','target','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2165,'Honey@ML_DEFENDER','attack',8219,5,10000,0,180000,'no','self','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2165,'Honey@NPC_EARTHQUAKE','attack',653,1,10000,0,10000,'no','self','myhpltmaxrate',30,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2165,'Honey@NPC_EARTHQUAKE','chase',653,1,10000,0,10000,'no','self','myhpltmaxrate',30,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2165,'Honey@NPC_ALLHEAL','idle',687,1,10000,0,0,'yes','self','rudeattacked',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2165,'Honey@NPC_ALLHEAL','walk',687,1,10000,0,0,'yes','self','rudeattacked',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

REPLACE INTO `mob_skill_db2` VALUES (2166,'Nenya@NPC_WIDEBLEEDING','attack',665,1,10000,0,60000,'no','self','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2166,'Nenya@NPC_ALLHEAL','idle',687,1,10000,0,0,'yes','self','rudeattacked',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2166,'Nenya@NPC_ALLHEAL','walk',687,1,10000,0,0,'yes','self','rudeattacked',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

REPLACE INTO `mob_skill_db2` VALUES (2167,'Secure@MG_THUNDERSTORM','attack',21,5,10000,1500,5000,'no','randomtarget','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2167,'Secure@MG_FROSTDIVER','attack',15,10,10000,2000,5000,'no','randomtarget','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2167,'Secure@MG_FROSTDIVER','chase',15,10,10000,2000,5000,'no','randomtarget','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2167,'Secure@MG_STONECURSE','attack',16,10,10000,2000,5000,'no','randomtarget','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2167,'Secure@MG_STONECURSE','chase',16,10,10000,2000,5000,'no','randomtarget','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2167,'Secure@NPC_ALLHEAL','idle',687,1,10000,0,0,'yes','self','rudeattacked',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2167,'Secure@NPC_ALLHEAL','walk',687,1,10000,0,0,'yes','self','rudeattacked',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

REPLACE INTO `mob_skill_db2` VALUES (2168,'Levon@AC_DOUBLE','attack',46,1,10000,0,2000,'no','target','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2168,'Levon@HW_GANBANTEIN','attack',483,1,10000,1000,5000,'no','target','always',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2168,'Levon@NPC_ALLHEAL','idle',687,1,10000,0,0,'yes','self','rudeattacked',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `mob_skill_db2` VALUES (2168,'Levon@NPC_ALLHEAL','walk',687,1,10000,0,0,'yes','self','rudeattacked',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

REPLACE INTO `mob_skill_db` VALUES (2110,'Easter Egg@NPC_METAMORPHOSIS','idle',193,1,3000,2000,2000,'no','self','always',0,2111,NULL,NULL,NULL,NULL,NULL,NULL);
-- INSERT INTO `mob_skill_db2` (`MOB_ID`, `INFO`, `STATE`, `SKILL_ID`, `SKILL_LV`, `RATE`, `CASTTIME`, `DELAY`, `CANCELABLE`, `TARGET`, `CONDITION`, `CONDITION_VALUE`, `VAL1`, `VAL2`, `VAL3`, `VAL4`, `VAL5`, `EMOTION`, `CHAT`);