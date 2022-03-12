CREATE DATABASE IF NOT EXISTS `esx`;
USE `esx`;

ALTER DATABASE `esx`
	DEFAULT CHARACTER SET UTF8MB4;

CREATE TABLE `users` (
	`identifier` VARCHAR(60) NOT NULL,
	`accounts` LONGTEXT NULL DEFAULT NULL,
	`group` VARCHAR(50) NULL DEFAULT 'user',
	`inventory` LONGTEXT NULL DEFAULT NULL,
	`job` VARCHAR(20) NULL DEFAULT 'unemployed',
	`job_grade` INT NULL DEFAULT 0,
	`loadout` LONGTEXT NULL DEFAULT NULL,
	`position` VARCHAR(255) NULL DEFAULT '{"x":-269.4,"y":-955.3,"z":31.2,"heading":205.8}',

	PRIMARY KEY (`identifier`)
) ENGINE=InnoDB;


CREATE TABLE `items` (
	`name` VARCHAR(50) NOT NULL,
	`label` VARCHAR(50) NOT NULL,
	`weight` INT NOT NULL DEFAULT 1,
	`rare` TINYINT NOT NULL DEFAULT 0,
	`can_remove` TINYINT NOT NULL DEFAULT 1,

	PRIMARY KEY (`name`)
) ENGINE=InnoDB;


CREATE TABLE `job_grades` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`job_name` VARCHAR(50) DEFAULT NULL,
	`grade` INT NOT NULL,
	`name` VARCHAR(50) NOT NULL,
	`label` VARCHAR(50) NOT NULL,
	`salary` INT NOT NULL,
	`skin_male` LONGTEXT NOT NULL,
	`skin_female` LONGTEXT NOT NULL,

	PRIMARY KEY (`id`)
) ENGINE=InnoDB;


INSERT INTO `job_grades` VALUES (1,'unemployed',0,'unemployed','Unemployed',200,'{}','{}');

CREATE TABLE `jobs` (
	`name` VARCHAR(50) NOT NULL,
	`label` VARCHAR(50) DEFAULT NULL,

	PRIMARY KEY (`name`)
) ENGINE=InnoDB;


INSERT INTO `jobs` VALUES ('unemployed','Unemployed');

ALTER TABLE `users`
	ADD COLUMN `firstname` VARCHAR(16) NULL DEFAULT NULL,
	ADD COLUMN `lastname` VARCHAR(16) NULL DEFAULT NULL,
	ADD COLUMN `dateofbirth` VARCHAR(10) NULL DEFAULT NULL,
	ADD COLUMN `sex` VARCHAR(1) NULL DEFAULT NULL,
	ADD COLUMN `height` INT NULL DEFAULT NULL
;

CREATE TABLE `addon_account` (
	`name` VARCHAR(60) NOT NULL,
	`label` VARCHAR(100) NOT NULL,
	`shared` INT NOT NULL,

	PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `addon_inventory` (
	`name` VARCHAR(60) NOT NULL,
	`label` VARCHAR(100) NOT NULL,
	`shared` INT NOT NULL,

	PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `multicharacter_slots` (
	`identifier` VARCHAR(60) NOT NULL,
	`slots` INT(11) NOT NULL,
	PRIMARY KEY (`identifier`) USING BTREE,
	INDEX `slots` (`slots`) USING BTREE
) ENGINE=InnoDB;

ALTER TABLE `users` ADD COLUMN
	`disabled` TINYINT(1) NULL DEFAULT '0';
	
CREATE TABLE `billing` (
	`id` int NOT NULL AUTO_INCREMENT,
	`identifier` varchar(60) NOT NULL,
	`sender` varchar(60) NOT NULL,
	`target_type` varchar(50) NOT NULL,
	`target` varchar(60) NOT NULL,
	`label` varchar(255) NOT NULL,
	`amount` int NOT NULL,

	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_cardealer','Concessionnaire',1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_cardealer','Concesionnaire',1)
;

INSERT INTO `jobs` (name, label) VALUES
	('cardealer','Concessionnaire')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('cardealer',0,'recruit','Recrue',10,'{}','{}'),
	('cardealer',1,'novice','Novice',25,'{}','{}'),
	('cardealer',2,'experienced','Experimente',40,'{}','{}'),
	('cardealer',3,'boss','Patron',0,'{}','{}')
;

CREATE TABLE `cardealer_vehicles` (
	`id` int NOT NULL AUTO_INCREMENT,
	`vehicle` varchar(255) NOT NULL,
	`price` int NOT NULL,

	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `vehicle_sold` (
	`client` VARCHAR(50) NOT NULL,
	`model` VARCHAR(50) NOT NULL,
	`plate` VARCHAR(50) NOT NULL,
	`soldby` VARCHAR(50) NOT NULL,
	`date` VARCHAR(50) NOT NULL,

	PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `owned_vehicles` (
	`owner` VARCHAR(60) NOT NULL,
	`plate` varchar(12) NOT NULL,
	`vehicle` longtext,
	`type` VARCHAR(20) NOT NULL DEFAULT 'car',
	`job` VARCHAR(20) NULL DEFAULT NULL,
	`stored` TINYINT(1) NOT NULL DEFAULT '0',

	PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `rented_vehicles` (
	`vehicle` varchar(60) NOT NULL,
	`plate` varchar(12) NOT NULL,
	`player_name` varchar(255) NOT NULL,
	`base_price` int NOT NULL,
	`rent_price` int NOT NULL,
	`owner` VARCHAR(60) NOT NULL,

	PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `vehicle_categories` (
	`name` varchar(60) NOT NULL,
	`label` varchar(60) NOT NULL,

	PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO `vehicle_categories` (name, label) VALUES
	('compacts','Compacts'),
	('coupes','Coupés'),
	('sedans','Sedans'),
	('sports','Sports'),
	('sportsclassics','Sports Classics'),
	('super','Super'),
	('muscle','Muscle'),
	('offroad','Off Road'),
	('suvs','SUVs'),
	('vans','Vans'),
	('motorcycles','Motos')
;

CREATE TABLE `vehicles` (
	`name` varchar(60) NOT NULL,
	`model` varchar(60) NOT NULL,
	`price` int NOT NULL,
	`category` varchar(60) DEFAULT NULL,

	PRIMARY KEY (`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO `vehicles` (name, model, price, category) VALUES
	('Blade','blade',15000,'muscle'),
	('Buccaneer','buccaneer',18000,'muscle'),
	('Buccaneer Rider','buccaneer2',24000,'muscle'),
	('Chino','chino',15000,'muscle'),
	('Chino Luxe','chino2',19000,'muscle'),
	('Coquette BlackFin','coquette3',55000,'muscle'),
	('Dominator','dominator',35000,'muscle'),
	('Dukes','dukes',28000,'muscle'),
	('Gauntlet','gauntlet',30000,'muscle'),
	('Hotknife','hotknife',125000,'muscle'),
	('Faction','faction',20000,'muscle'),
	('Faction Rider','faction2',30000,'muscle'),
	('Faction XL','faction3',40000,'muscle'),
	('Nightshade','nightshade',65000,'muscle'),
	('Phoenix','phoenix',12500,'muscle'),
	('Picador','picador',18000,'muscle'),
	('Sabre Turbo','sabregt',20000,'muscle'),
	('Sabre GT','sabregt2',25000,'muscle'),
	('Slam Van','slamvan3',11500,'muscle'),
	('Tampa','tampa',16000,'muscle'),
	('Virgo','virgo',14000,'muscle'),
	('Vigero','vigero',12500,'muscle'),
	('Voodoo','voodoo',7200,'muscle'),
	('Blista','blista',8000,'compacts'),
	('Brioso R/A','brioso',18000,'compacts'),
	('Issi','issi2',10000,'compacts'),
	('Panto','panto',10000,'compacts'),
	('Prairie','prairie',12000,'compacts'),
	('Bison','bison',45000,'vans'),
	('Bobcat XL','bobcatxl',32000,'vans'),
	('Burrito','burrito3',19000,'vans'),
	('Burrito','gburrito2',29000,'vans'),
	('Camper','camper',42000,'vans'),
	('Gang Burrito','gburrito',45000,'vans'),
	('Journey','journey',6500,'vans'),
	('Minivan','minivan',13000,'vans'),
	('Moonbeam','moonbeam',18000,'vans'),
	('Moonbeam Rider','moonbeam2',35000,'vans'),
	('Paradise','paradise',19000,'vans'),
	('Rumpo','rumpo',15000,'vans'),
	('Rumpo Trail','rumpo3',19500,'vans'),
	('Surfer','surfer',12000,'vans'),
	('Youga','youga',10800,'vans'),
	('Youga Luxuary','youga2',14500,'vans'),
	('Asea','asea',5500,'sedans'),
	('Cognoscenti','cognoscenti',55000,'sedans'),
	('Emperor','emperor',8500,'sedans'),
	('Fugitive','fugitive',12000,'sedans'),
	('Glendale','glendale',6500,'sedans'),
	('Intruder','intruder',7500,'sedans'),
	('Premier','premier',8000,'sedans'),
	('Primo Custom','primo2',14000,'sedans'),
	('Regina','regina',5000,'sedans'),
	('Schafter','schafter2',25000,'sedans'),
	('Stretch','stretch',90000,'sedans'),
	('Super Diamond','superd',130000,'sedans'),
	('Tailgater','tailgater',30000,'sedans'),
	('Warrener','warrener',4000,'sedans'),
	('Washington','washington',9000,'sedans'),
	('Baller','baller2',40000,'suvs'),
	('Baller Sport','baller3',60000,'suvs'),
	('Cavalcade','cavalcade2',55000,'suvs'),
	('Contender','contender',70000,'suvs'),
	('Dubsta','dubsta',45000,'suvs'),
	('Dubsta Luxuary','dubsta2',60000,'suvs'),
	('Fhantom','fq2',17000,'suvs'),
	('Grabger','granger',50000,'suvs'),
	('Gresley','gresley',47500,'suvs'),
	('Huntley S','huntley',40000,'suvs'),
	('Landstalker','landstalker',35000,'suvs'),
	('Mesa','mesa',16000,'suvs'),
	('Mesa Trail','mesa3',40000,'suvs'),
	('Patriot','patriot',55000,'suvs'),
	('Radius','radi',29000,'suvs'),
	('Rocoto','rocoto',45000,'suvs'),
	('Seminole','seminole',25000,'suvs'),
	('XLS','xls',32000,'suvs'),
	('Btype','btype',62000,'sportsclassics'),
	('Btype Luxe','btype3',85000,'sportsclassics'),
	('Btype Hotroad','btype2',155000,'sportsclassics'),
	('Casco','casco',30000,'sportsclassics'),
	('Coquette Classic','coquette2',40000,'sportsclassics'),
	('Manana','manana',12800,'sportsclassics'),
	('Monroe','monroe',55000,'sportsclassics'),
	('Pigalle','pigalle',20000,'sportsclassics'),
	('Stinger','stinger',80000,'sportsclassics'),
	('Stinger GT','stingergt',75000,'sportsclassics'),
	('Stirling GT','feltzer3',65000,'sportsclassics'),
	('Z-Type','ztype',220000,'sportsclassics'),
	('Bifta','bifta',12000,'offroad'),
	('Bf Injection','bfinjection',16000,'offroad'),
	('Blazer','blazer',6500,'offroad'),
	('Blazer Sport','blazer4',8500,'offroad'),
	('Brawler','brawler',45000,'offroad'),
	('Bubsta 6x6','dubsta3',120000,'offroad'),
	('Dune Buggy','dune',8000,'offroad'),
	('Guardian','guardian',45000,'offroad'),
	('Rebel','rebel2',35000,'offroad'),
	('Sandking','sandking',55000,'offroad'),
	('The Liberator','monster',210000,'offroad'),
	('Trophy Truck','trophytruck',60000,'offroad'),
	('Trophy Truck Limited','trophytruck2',80000,'offroad'),
	('Cognoscenti Cabrio','cogcabrio',55000,'coupes'),
	('Exemplar','exemplar',32000,'coupes'),
	('F620','f620',40000,'coupes'),
	('Felon','felon',42000,'coupes'),
	('Felon GT','felon2',55000,'coupes'),
	('Jackal','jackal',38000,'coupes'),
	('Oracle XS','oracle2',35000,'coupes'),
	('Sentinel','sentinel',32000,'coupes'),
	('Sentinel XS','sentinel2',40000,'coupes'),
	('Windsor','windsor',95000,'coupes'),
	('Windsor Drop','windsor2',125000,'coupes'),
	('Zion','zion',36000,'coupes'),
	('Zion Cabrio','zion2',45000,'coupes'),
	('9F','ninef',65000,'sports'),
	('9F Cabrio','ninef2',80000,'sports'),
	('Alpha','alpha',60000,'sports'),
	('Banshee','banshee',70000,'sports'),
	('Bestia GTS','bestiagts',55000,'sports'),
	('Buffalo','buffalo',12000,'sports'),
	('Buffalo S','buffalo2',20000,'sports'),
	('Carbonizzare','carbonizzare',75000,'sports'),
	('Comet','comet2',65000,'sports'),
	('Coquette','coquette',65000,'sports'),
	('Drift Tampa','tampa2',80000,'sports'),
	('Elegy','elegy2',38500,'sports'),
	('Feltzer','feltzer2',55000,'sports'),
	('Furore GT','furoregt',45000,'sports'),
	('Fusilade','fusilade',40000,'sports'),
	('Jester','jester',65000,'sports'),
	('Jester(Racecar)','jester2',135000,'sports'),
	('Khamelion','khamelion',38000,'sports'),
	('Kuruma','kuruma',30000,'sports'),
	('Lynx','lynx',40000,'sports'),
	('Mamba','mamba',70000,'sports'),
	('Massacro','massacro',65000,'sports'),
	('Massacro(Racecar)','massacro2',130000,'sports'),
	('Omnis','omnis',35000,'sports'),
	('Penumbra','penumbra',28000,'sports'),
	('Rapid GT','rapidgt',35000,'sports'),
	('Rapid GT Convertible','rapidgt2',45000,'sports'),
	('Schafter V12','schafter3',50000,'sports'),
	('Seven 70','seven70',39500,'sports'),
	('Sultan','sultan',15000,'sports'),
	('Surano','surano',50000,'sports'),
	('Tropos','tropos',40000,'sports'),
	('Verlierer','verlierer2',70000,'sports'),
	('Adder','adder',900000,'super'),
	('Banshee 900R','banshee2',255000,'super'),
	('Bullet','bullet',90000,'super'),
	('Cheetah','cheetah',375000,'super'),
	('Entity XF','entityxf',425000,'super'),
	('ETR1','sheava',220000,'super'),
	('FMJ','fmj',185000,'super'),
	('Infernus','infernus',180000,'super'),
	('Osiris','osiris',160000,'super'),
	('Pfister','pfister811',85000,'super'),
	('RE-7B','le7b',325000,'super'),
	('Reaper','reaper',150000,'super'),
	('Sultan RS','sultanrs',65000,'super'),
	('T20','t20',300000,'super'),
	('Turismo R','turismor',350000,'super'),
	('Tyrus','tyrus',600000,'super'),
	('Vacca','vacca',120000,'super'),
	('Voltic','voltic',90000,'super'),
	('X80 Proto','prototipo',2500000,'super'),
	('Zentorno','zentorno',1500000,'super'),
	('Akuma','AKUMA',7500,'motorcycles'),
	('Avarus','avarus',18000,'motorcycles'),
	('Bagger','bagger',13500,'motorcycles'),
	('Bati 801','bati',12000,'motorcycles'),
	('Bati 801RR','bati2',19000,'motorcycles'),
	('BF400','bf400',6500,'motorcycles'),
	('BMX (velo)','bmx',160,'motorcycles'),
	('Carbon RS','carbonrs',18000,'motorcycles'),
	('Chimera','chimera',38000,'motorcycles'),
	('Cliffhanger','cliffhanger',9500,'motorcycles'),
	('Cruiser (velo)','cruiser',510,'motorcycles'),
	('Daemon','daemon',11500,'motorcycles'),
	('Daemon High','daemon2',13500,'motorcycles'),
	('Defiler','defiler',9800,'motorcycles'),
	('Double T','double',28000,'motorcycles'),
	('Enduro','enduro',5500,'motorcycles'),
	('Esskey','esskey',4200,'motorcycles'),
	('Faggio','faggio',1900,'motorcycles'),
	('Vespa','faggio2',2800,'motorcycles'),
	('Fixter (velo)','fixter',225,'motorcycles'),
	('Gargoyle','gargoyle',16500,'motorcycles'),
	('Hakuchou','hakuchou',31000,'motorcycles'),
	('Hakuchou Sport','hakuchou2',55000,'motorcycles'),
	('Hexer','hexer',12000,'motorcycles'),
	('Innovation','innovation',23500,'motorcycles'),
	('Manchez','manchez',5300,'motorcycles'),
	('Nemesis','nemesis',5800,'motorcycles'),
	('Nightblade','nightblade',35000,'motorcycles'),
	('PCJ-600','pcj',6200,'motorcycles'),
	('Ruffian','ruffian',6800,'motorcycles'),
	('Sanchez','sanchez',5300,'motorcycles'),
	('Sanchez Sport','sanchez2',5300,'motorcycles'),
	('Sanctus','sanctus',25000,'motorcycles'),
	('Scorcher (velo)','scorcher',280,'motorcycles'),
	('Sovereign','sovereign',22000,'motorcycles'),
	('Shotaro Concept','shotaro',320000,'motorcycles'),
	('Thrust','thrust',24000,'motorcycles'),
	('Tri bike (velo)','tribike3',520,'motorcycles'),
	('Vader','vader',7200,'motorcycles'),
	('Vortex','vortex',9800,'motorcycles'),
	('Woflsbane','wolfsbane',9000,'motorcycles'),
	('Zombie','zombiea',9500,'motorcycles'),
	('Zombie Luxuary','zombieb',12000,'motorcycles'),
	('blazer5', 'blazer5', 1755600, 'offroad'),
	('Ruiner 2', 'ruiner2', 5745600, 'muscle'),
	('Voltic 2', 'voltic2', 3830400, 'super'),
	('Ardent', 'ardent', 1150000, 'sportsclassics'),
	('Oppressor', 'oppressor', 3524500, 'super'),
	('Visione', 'visione', 2250000, 'super'),
	('Retinue', 'retinue', 615000, 'sportsclassics'),
	('Cyclone', 'cyclone', 1890000, 'super'), 
	('Rapid GT3', 'rapidgt3', 885000, 'sportsclassics'),
	('raiden', 'raiden', 1375000, 'sports'),
	('Yosemite', 'yosemite', 485000, 'muscle'),
	('Deluxo', 'deluxo', 4721500, 'sportsclassics'),
	('Pariah', 'pariah', 1420000, 'sports'),
	('Stromberg', 'stromberg', 3185350, 'sports'),
	('SC 1', 'sc1', 1603000, 'super'),
	('riata', 'riata', 380000, 'offroad'),
	('Hermes', 'hermes', 535000, 'muscle'),
	('Savestra', 'savestra', 990000, 'sportsclassics'),
	('Streiter', 'streiter', 500000, 'sports'),
	('Kamacho', 'kamacho', 345000, 'offroad'),
	('GT 500', 'gt500', 785000, 'sportsclassics'),
	('Z190', 'z190', 900000, 'sportsclassics'),
	('Viseris', 'viseris', 875000, 'sportsclassics'),
	('Autarch', 'autarch', 1955000, 'super'),
	('Comet 5', 'comet5', 1145000, 'sports'), 
	('Neon', 'neon', 1500000, 'sports'),
	('Revolter', 'revolter', 1610000, 'sports'),
	('Sentinel3', 'sentinel3', 650000, 'sports'),
	('Hustler', 'hustler', 625000, 'muscle')
;

ALTER TABLE `users` ADD COLUMN `status` LONGTEXT NULL;

CREATE TABLE `datastore` (
	`name` VARCHAR(60) NOT NULL,
	`label` VARCHAR(100) NOT NULL,
	`shared` INT NOT NULL,

	PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `datastore_data` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(60) NOT NULL,
	`owner` VARCHAR(60),
	`data` LONGTEXT,

	PRIMARY KEY (`id`),
	UNIQUE INDEX `index_datastore_data_name_owner` (`name`, `owner`),
	INDEX `index_datastore_data_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `society_moneywash` (
	`id` int NOT NULL AUTO_INCREMENT,
	`identifier` varchar(60) NOT NULL,
	`society` varchar(60) NOT NULL,
	`amount` int NOT NULL,

	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

ALTER TABLE `users` ADD COLUMN `skin` LONGTEXT NULL DEFAULT NULL;

INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_police', 'Police', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_police', 'Police', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_police', 'Police', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('police', 'LSPD')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('police',0,'recruit','Recrue',20,'{}','{}'),
	('police',1,'officer','Officier',40,'{}','{}'),
	('police',2,'sergeant','Sergent',60,'{}','{}'),
	('police',3,'lieutenant','Lieutenant',85,'{}','{}'),
	('police',4,'boss','Commandant',100,'{}','{}')
;

CREATE TABLE `fine_types` (
	`id` int NOT NULL AUTO_INCREMENT,
	`label` varchar(255) DEFAULT NULL,
	`amount` int DEFAULT NULL,
	`category` int DEFAULT NULL,

	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO `fine_types` (label, amount, category) VALUES
	('Usage abusif du klaxon',30,0),
	('Franchir une ligne continue',40,0),
	('Circulation à contresens',250,0),
	('Demi-tour non autorisé',250,0),
	('Circulation hors-route',170,0),
	('Non-respect des distances de sécurité',30,0),
	('Arrêt dangereux / interdit',150,0),
	('Stationnement gênant / interdit',70,0),
	('Non respect  de la priorité à droite',70,0),
	('Non-respect à un véhicule prioritaire',90,0),
	('Non-respect d\'un stop',105,0),
	('Non-respect d\'un feu rouge',130,0),
	('Dépassement dangereux',100,0),
	('Véhicule non en état',100,0),
	('Conduite sans permis',1500,0),
	('Délit de fuite',800,0),
	('Excès de vitesse < 5 kmh',90,0),
	('Excès de vitesse 5-15 kmh',120,0),
	('Excès de vitesse 15-30 kmh',180,0),
	('Excès de vitesse > 30 kmh',300,0),
	('Entrave de la circulation',110,1),
	('Dégradation de la voie publique',90,1),
	('Trouble à l\'ordre publique',90,1),
	('Entrave opération de police',130,1),
	('Insulte envers / entre civils',75,1),
	('Outrage à agent de police',110,1),
	('Menace verbale ou intimidation envers civil',90,1),
	('Menace verbale ou intimidation envers policier',150,1),
	('Manifestation illégale',250,1),
	('Tentative de corruption',1500,1),
	('Arme blanche sortie en ville',120,2),
	('Arme léthale sortie en ville',300,2),
	('Port d\'arme non autorisé (défaut de license)',600,2),
	('Port d\'arme illégal',700,2),
	('Pris en flag lockpick',300,2),
	('Vol de voiture',1800,2),
	('Vente de drogue',1500,2),
	('Fabriquation de drogue',1500,2),
	('Possession de drogue',650,2),
	('Prise d\'ôtage civil',1500,2),
	('Prise d\'ôtage agent de l\'état',2000,2),
	('Braquage particulier',650,2),
	('Braquage magasin',650,2),
	('Braquage de banque',1500,2),
	('Tir sur civil',2000,3),
	('Tir sur agent de l\'état',2500,3),
	('Tentative de meurtre sur civil',3000,3),
	('Tentative de meurtre sur agent de l\'état',5000,3),
	('Meurtre sur civil',10000,3),
	('Meurte sur agent de l\'état',30000,3),
	('Meurtre involontaire',1800,3),
	('Escroquerie à l\'entreprise',2000,2)
;

CREATE TABLE `licenses` (
	`type` varchar(60) NOT NULL,
	`label` varchar(60) NOT NULL,

	PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `user_licenses` (
	`id` int NOT NULL AUTO_INCREMENT,
	`type` varchar(60) NOT NULL,
	`owner` VARCHAR(60) NOT NULL,

	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `items` (`name`, `label`, `weight`) VALUES
	('bread', 'Bread', 1),
	('water', 'Water', 1)
;


CREATE TABLE `addon_inventory_items` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`inventory_name` VARCHAR(100) NOT NULL,
	`name` VARCHAR(100) NOT NULL,
	`count` INT NOT NULL,
	`owner` VARCHAR(60) DEFAULT NULL,

	PRIMARY KEY (`id`),
	INDEX `index_addon_inventory_items_inventory_name_name` (`inventory_name`, `name`),
	INDEX `index_addon_inventory_items_inventory_name_name_owner` (`inventory_name`, `name`, `owner`),
	INDEX `index_addon_inventory_inventory_name` (`inventory_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `addon_account_data` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`account_name` VARCHAR(100) DEFAULT NULL,
	`money` INT NOT NULL,
	`owner` VARCHAR(60) DEFAULT NULL,

	PRIMARY KEY (`id`),
	UNIQUE INDEX `index_addon_account_data_account_name_owner` (`account_name`, `owner`),
	INDEX `index_addon_account_data_account_name` (`account_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_ambulance', 'Ambulance', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_ambulance', 'Ambulance', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_ambulance', 'Ambulance', 1)
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('ambulance',0,'ambulance','Ambulancier',20,'{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}','{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
	('ambulance',1,'doctor','Medecin',40,'{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}','{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
	('ambulance',2,'chief_doctor','Medecin-chef',60,'{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}','{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
	('ambulance',3,'boss','Chirurgien',80,'{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}','{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}')
;

INSERT INTO `jobs` (name, label) VALUES
	('ambulance','Ambulance')
;

INSERT INTO `items` (name, label, weight) VALUES
	('bandage','Bandage', 2),
	('medikit','Medikit', 2)
;

ALTER TABLE `users`
	ADD `is_dead` TINYINT(1) NULL DEFAULT '0'
;

CREATE TABLE `ox_inventory` (
	`owner` varchar(60) DEFAULT NULL,
	`name` varchar(100) NOT NULL,
	`data` longtext DEFAULT NULL,
	`lastupdated` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
	UNIQUE KEY `owner` (`owner`,`name`)
);

ALTER TABLE `owned_vehicles`
	ADD COLUMN `trunk` LONGTEXT NULL,
	ADD COLUMN `glovebox` LONGTEXT NULL;
	
CREATE TABLE IF NOT EXISTS `dpkeybinds` (
  `id` varchar(50) NULL DEFAULT NULL,
  `keybind1` varchar(50) NULL DEFAULT "num4",
  `emote1` varchar(255) NULL DEFAULT "",
  `keybind2` varchar(50) NULL DEFAULT "num5",
  `emote2` varchar(255) NULL DEFAULT "",
  `keybind3` varchar(50) NULL DEFAULT "num6",
  `emote3` varchar(255) NULL DEFAULT "",
  `keybind4` varchar(50) NULL DEFAULT "num7",
  `emote4` varchar(255) NULL DEFAULT "",
  `keybind5` varchar(50) NULL DEFAULT "num8",
  `emote5` varchar(255) NULL DEFAULT "",
  `keybind6` varchar(50) NULL DEFAULT "num9",
  `emote6` varchar(255) NULL DEFAULT ""
) ENGINE=InnoDB COLLATE=latin1_swedish_ci;

CREATE TABLE `user_parkings` (
  
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) DEFAULT NULL,
  `garage` varchar(60) DEFAULT NULL,
  `zone` int(11) NOT NULL,
  `vehicle` longtext,

  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_mechanic', 'Mécano', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_mechanic', 'Mécano', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_mechanic', 'Mécano', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('mechanic', 'Mécano')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('mechanic',0,'recrue','Recrue',12,'{}','{}'),
	('mechanic',1,'novice','Novice',24,'{}','{}'),
	('mechanic',2,'experimente','Experimente',36,'{}','{}'),
	('mechanic',3,'chief',"Chef d\'équipe",48,'{}','{}'),
	('mechanic',4,'boss','Patron',0,'{}','{}')
;

INSERT INTO `items` (name, label, weight) VALUES
	('gazbottle', 'bouteille de gaz', 2),
	('fixtool', 'outils réparation', 2),
	('carotool', 'outils carosserie', 2),
	('blowpipe', 'Chalumeaux', 2),
	('fixkit', 'Kit réparation', 3),
	('carokit', 'Kit carosserie', 3)
;

INSERT INTO `addon_account` (name, label, shared) VALUES
	('caution', 'Caution', 0)
;

INSERT INTO `jobs` (name, label) VALUES
	('slaughterer', 'Abatteur'),
	('fisherman', 'Pêcheur'),
	('miner', 'Mineur'),
	('lumberjack', 'Bûcheron'),
	('fueler', 'Raffineur'),
	('reporter', 'Journaliste'),
	('tailor', 'Couturier')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('lumberjack', 0, 'employee', 'Intérimaire', 0, '{}', '{}'),
	('fisherman', 0, 'employee', 'Intérimaire', 0, '{}', '{}'),
	('fueler', 0, 'employee', 'Intérimaire', 0, '{}', '{}'),
	('reporter', 0, 'employee', 'Intérimaire', 0, '{}', '{}'),
	('tailor',0,'employee','Intérimaire',0,'{\"mask_1\":0,\"arms\":1,\"glasses_1\":0,\"hair_color_2\":4,\"makeup_1\":0,\"face\":19,\"glasses\":0,\"mask_2\":0,\"makeup_3\":0,\"skin\":29,\"helmet_2\":0,\"lipstick_4\":0,\"sex\":0,\"torso_1\":24,\"makeup_2\":0,\"bags_2\":0,\"chain_2\":0,\"ears_1\":-1,\"bags_1\":0,\"bproof_1\":0,\"shoes_2\":0,\"lipstick_2\":0,\"chain_1\":0,\"tshirt_1\":0,\"eyebrows_3\":0,\"pants_2\":0,\"beard_4\":0,\"torso_2\":0,\"beard_2\":6,\"ears_2\":0,\"hair_2\":0,\"shoes_1\":36,\"tshirt_2\":0,\"beard_3\":0,\"hair_1\":2,\"hair_color_1\":0,\"pants_1\":48,\"helmet_1\":-1,\"bproof_2\":0,\"eyebrows_4\":0,\"eyebrows_2\":0,\"decals_1\":0,\"age_2\":0,\"beard_1\":5,\"shoes\":10,\"lipstick_1\":0,\"eyebrows_1\":0,\"glasses_2\":0,\"makeup_4\":0,\"decals_2\":0,\"lipstick_3\":0,\"age_1\":0}','{\"mask_1\":0,\"arms\":5,\"glasses_1\":5,\"hair_color_2\":4,\"makeup_1\":0,\"face\":19,\"glasses\":0,\"mask_2\":0,\"makeup_3\":0,\"skin\":29,\"helmet_2\":0,\"lipstick_4\":0,\"sex\":1,\"torso_1\":52,\"makeup_2\":0,\"bags_2\":0,\"chain_2\":0,\"ears_1\":-1,\"bags_1\":0,\"bproof_1\":0,\"shoes_2\":1,\"lipstick_2\":0,\"chain_1\":0,\"tshirt_1\":23,\"eyebrows_3\":0,\"pants_2\":0,\"beard_4\":0,\"torso_2\":0,\"beard_2\":6,\"ears_2\":0,\"hair_2\":0,\"shoes_1\":42,\"tshirt_2\":4,\"beard_3\":0,\"hair_1\":2,\"hair_color_1\":0,\"pants_1\":36,\"helmet_1\":-1,\"bproof_2\":0,\"eyebrows_4\":0,\"eyebrows_2\":0,\"decals_1\":0,\"age_2\":0,\"beard_1\":5,\"shoes\":10,\"lipstick_1\":0,\"eyebrows_1\":0,\"glasses_2\":0,\"makeup_4\":0,\"decals_2\":0,\"lipstick_3\":0,\"age_1\":0}'),
	('miner', 0, 'employee', 'Intérimaire', 0, '{"tshirt_2":1,"ears_1":8,"glasses_1":15,"torso_2":0,"ears_2":2,"glasses_2":3,"shoes_2":1,"pants_1":75,"shoes_1":51,"bags_1":0,"helmet_2":0,"pants_2":7,"torso_1":71,"tshirt_1":59,"arms":2,"bags_2":0,"helmet_1":0}', '{}'),
	('slaughterer',0,'employee','Intérimaire',0,'{\"age_1\":0,\"glasses_2\":0,\"beard_1\":5,\"decals_2\":0,\"beard_4\":0,\"shoes_2\":0,\"tshirt_2\":0,\"lipstick_2\":0,\"hair_2\":0,\"arms\":67,\"pants_1\":36,\"skin\":29,\"eyebrows_2\":0,\"shoes\":10,\"helmet_1\":-1,\"lipstick_1\":0,\"helmet_2\":0,\"hair_color_1\":0,\"glasses\":0,\"makeup_4\":0,\"makeup_1\":0,\"hair_1\":2,\"bproof_1\":0,\"bags_1\":0,\"mask_1\":0,\"lipstick_3\":0,\"chain_1\":0,\"eyebrows_4\":0,\"sex\":0,\"torso_1\":56,\"beard_2\":6,\"shoes_1\":12,\"decals_1\":0,\"face\":19,\"lipstick_4\":0,\"tshirt_1\":15,\"mask_2\":0,\"age_2\":0,\"eyebrows_3\":0,\"chain_2\":0,\"glasses_1\":0,\"ears_1\":-1,\"bags_2\":0,\"ears_2\":0,\"torso_2\":0,\"bproof_2\":0,\"makeup_2\":0,\"eyebrows_1\":0,\"makeup_3\":0,\"pants_2\":0,\"beard_3\":0,\"hair_color_2\":4}','{\"age_1\":0,\"glasses_2\":0,\"beard_1\":5,\"decals_2\":0,\"beard_4\":0,\"shoes_2\":0,\"tshirt_2\":0,\"lipstick_2\":0,\"hair_2\":0,\"arms\":72,\"pants_1\":45,\"skin\":29,\"eyebrows_2\":0,\"shoes\":10,\"helmet_1\":-1,\"lipstick_1\":0,\"helmet_2\":0,\"hair_color_1\":0,\"glasses\":0,\"makeup_4\":0,\"makeup_1\":0,\"hair_1\":2,\"bproof_1\":0,\"bags_1\":0,\"mask_1\":0,\"lipstick_3\":0,\"chain_1\":0,\"eyebrows_4\":0,\"sex\":1,\"torso_1\":49,\"beard_2\":6,\"shoes_1\":24,\"decals_1\":0,\"face\":19,\"lipstick_4\":0,\"tshirt_1\":9,\"mask_2\":0,\"age_2\":0,\"eyebrows_3\":0,\"chain_2\":0,\"glasses_1\":5,\"ears_1\":-1,\"bags_2\":0,\"ears_2\":0,\"torso_2\":0,\"bproof_2\":0,\"makeup_2\":0,\"eyebrows_1\":0,\"makeup_3\":0,\"pants_2\":0,\"beard_3\":0,\"hair_color_2\":4}')
;

INSERT INTO `items` (`name`, `label`, `weight`) VALUES
	('alive_chicken', 'Poulet vivant', 1),
	('slaughtered_chicken', 'Poulet abattu', 1),
	('packaged_chicken', 'Poulet en barquette', 1),
	('fish', 'Poisson', 1),
	('stone', 'Pierre', 1),
	('washed_stone', 'Pierre Lavée', 1),
	('copper', 'Cuivre', 1),
	('iron', 'Fer', 1),
	('gold', 'Or', 1),
	('diamond', 'Diamant', 1),
	('wood', 'Bois', 1),
	('cutted_wood', 'Bois coupé', 1),
	('packaged_plank', 'Paquet de planches', 1),
	('petrol', 'Pétrole', 1),
	('petrol_raffin', 'Pétrole Raffiné', 1),
	('essence', 'Essence', 1),
	('wool', 'Laine', 1),
	('fabric', 'Tissu', 1),
	('clothe', 'Vêtement', 1)
;

ALTER TABLE jobs add whitelisted BOOLEAN NOT NULL DEFAULT FALSE;