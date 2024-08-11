SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for card
-- ----------------------------
DROP TABLE IF EXISTS `card`;
CREATE TABLE `card` (
  `card_id` varchar(50) NOT NULL,
  `seat_id` varchar(50) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_gender` varchar(1) NOT NULL,
  `user_addr` varchar(50) NOT NULL,
  `car_num` varchar(50) NOT NULL,
  PRIMARY KEY (`card_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of card
-- ----------------------------
INSERT INTO `card` VALUES ('20220320181122', '20200321182306', '测试001', '男', '测试', '1111111');
INSERT INTO `card` VALUES ('20220320181246', '20200321182303', '测试002', '男', '测试2', 'A12345');
INSERT INTO `card` VALUES ('20220320181308', '20200321182304', '测试003', '男', '测试3', 'A12346');
INSERT INTO `card` VALUES ('20220321105717', '20220321105641', '测试004', '男', '00000004', 'A12340');

-- ----------------------------
-- Table structure for fixed
-- ----------------------------
DROP TABLE IF EXISTS `fixed`;
CREATE TABLE `fixed` (
  `fixed_id` varchar(50) NOT NULL,
  `card_id` varchar(50) NOT NULL,
  `entry_date` date NOT NULL,
  `entry_time` time NOT NULL,
  `out_date` date DEFAULT NULL,
  `out_time` time DEFAULT NULL,
  PRIMARY KEY (`fixed_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of fixed
-- ----------------------------
INSERT INTO `fixed` VALUES ('20220320141658', '000001', '2022-03-20', '14:16:58', '2022-03-20', '14:17:06');
INSERT INTO `fixed` VALUES ('20220320141716', '000002', '2022-03-20', '14:17:16', '1111-11-11', '11:11:11');
INSERT INTO `fixed` VALUES ('20220320175300', '000003', '2022-03-20', '17:53:00', '2022-03-20', '17:53:07');
INSERT INTO `fixed` VALUES ('20220320175339', '000004', '2022-03-20', '17:53:39', '2022-03-20', '17:53:46');
INSERT INTO `fixed` VALUES ('20220320175343', '000005', '2022-03-20', '17:53:43', '2022-03-20', '17:53:50');
INSERT INTO `fixed` VALUES ('20220320181318', '20220320181122', '2022-03-20', '18:13:18', '2022-03-20', '18:13:24');
INSERT INTO `fixed` VALUES ('20220320181321', '20220320181308', '2022-03-20', '18:13:21', '2022-03-20', '18:13:26');
INSERT INTO `fixed` VALUES ('20220321105737', '20220321105717', '2022-03-21', '10:57:37', '2022-03-21', '10:58:11');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` varchar(50) NOT NULL,
  `role_name` varchar(50) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('r001', '管理员');
INSERT INTO `role` VALUES ('r003', '测试');

-- ----------------------------
-- Table structure for seat
-- ----------------------------
DROP TABLE IF EXISTS `seat`;
CREATE TABLE `seat` (
  `seat_id` varchar(50) NOT NULL,
  `seat_num` varchar(50) NOT NULL,
  `seat_section` varchar(50) NOT NULL,
  `seat_state` int NOT NULL,
  `seat_tag` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`seat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of seat
-- ----------------------------
INSERT INTO `seat` VALUES ('20220320181617', '000001', 'A区', '0', '固定车位');
INSERT INTO `seat` VALUES ('20220320181630', '000002', 'B区', '0', '固定车位');
INSERT INTO `seat` VALUES ('20220320181640', '000003', 'c区', '0', '固定车位');
INSERT INTO `seat` VALUES ('20220321105641', '000004', 'A区', '0', '固定车位');

-- ----------------------------
-- Table structure for temp
-- ----------------------------
DROP TABLE IF EXISTS `temp`;
CREATE TABLE `temp` (
  `temp_id` varchar(50) NOT NULL,
  `card_id` varchar(50) NOT NULL,
  `car_num` varchar(50) NOT NULL,
  `entry_date` date NOT NULL,
  `entry_time` time NOT NULL,
  `out_date` date DEFAULT NULL,
  `out_time` time DEFAULT NULL,
  `temp_money` float DEFAULT NULL,
  PRIMARY KEY (`temp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of temp
-- ----------------------------
INSERT INTO `temp` VALUES ('20220320175419', '0001', 'A10000', '2022-03-20', '17:54:19', '2022-03-20', '17:55:23', '4');
INSERT INTO `temp` VALUES ('20220320175506', '0002', 'A10001', '2022-03-20', '17:55:06', '2022-03-20', '17:55:39', '3');
INSERT INTO `temp` VALUES ('20220320175519', '0003', 'A10002', '2022-03-20', '17:55:19', '2022-03-21', '10:58:31', '18');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` varchar(50) NOT NULL,
  `role_id` varchar(50) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `real_name` varchar(50) NOT NULL,
  `user_pwd` varchar(20) NOT NULL,
  `user_phone` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('admin_01', 'r002', 'Test01', '测试01', '123123', '15100000000');
INSERT INTO `user` VALUES ('admin_02', 'r003', 'Test02', '测试02', '123123', '13900000000');
INSERT INTO `user` VALUES ('SAdmin', 'r001', 'Tes03', '测试03', '123123', '13900000001');

-- ----------------------------
-- View structure for v_card
-- ----------------------------
DROP VIEW IF EXISTS `v_card`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_card` AS select `card`.`card_id` AS `card_id`,`card`.`seat_id` AS `seat_id`,`card`.`user_name` AS `user_name`,`card`.`user_gender` AS `user_gender`,`card`.`user_addr` AS `user_addr`,`card`.`car_num` AS `car_num`,`seat`.`seat_num` AS `seat_num` from (`card` join `seat` on((`card`.`seat_id` = `seat`.`seat_id`))) ;

-- ----------------------------
-- View structure for v_fixed
-- ----------------------------
DROP VIEW IF EXISTS `v_fixed`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_fixed` AS select `fixed`.`fixed_id` AS `fixed_id`,`fixed`.`card_id` AS `card_id`,`fixed`.`entry_date` AS `entry_date`,`fixed`.`entry_time` AS `entry_time`,`fixed`.`out_date` AS `out_date`,`fixed`.`out_time` AS `out_time`,`card`.`car_num` AS `car_num`,`card`.`user_name` AS `user_name` from (`fixed` join `card` on((`fixed`.`card_id` = `card`.`card_id`))) ;

-- ----------------------------
-- View structure for v_user
-- ----------------------------
DROP VIEW IF EXISTS `v_user`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_user` AS select `user`.`user_id` AS `user_id`,`user`.`role_id` AS `role_id`,`user`.`user_name` AS `user_name`,`user`.`real_name` AS `real_name`,`user`.`user_pwd` AS `user_pwd`,`user`.`user_phone` AS `user_phone`,`role`.`role_name` AS `role_name` from (`user` join `role` on((`user`.`role_id` = `role`.`role_id`))) ;
