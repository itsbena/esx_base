INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
	('society_mechanic', 'Mechanic', 1);
INSERT INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
	(7, 'society_mechanic', 0, NULL);
INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
	('society_mechanic', 'Mechanic', 1);
INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
	('society_mechanic', 'Mechanic', 1);
INSERT INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
	(7, 'society_mechanic', NULL, '{}');
INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
	('mechanic', 'Mechanic', 0);
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(32, 'mechanic', 0, 'recrue', 'Recruit', 12, '{}', '{}'),
	(33, 'mechanic', 1, 'novice', 'beginner', 24, '{}', '{}'),
	(34, 'mechanic', 2, 'experimente', 'experienced', 36, '{}', '{}'),
	(35, 'mechanic', 3, 'chief', 'Leader', 48, '{}', '{}'),
	(36, 'mechanic', 4, 'boss', 'Boss', 0, '{}', '{}');