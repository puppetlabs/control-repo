DROP TABLE IF EXISTS `test_data`;
CREATE TABLE `test_data` (
  `id` int(11) NOT NULL  PRIMARY KEY AUTO_INCREMENT,
  `first_name` text NOT NULL,
  `last_name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `test_data` (`id`, `first_name`, `last_name`) VALUES
(1, 'David', 'Bowie');
