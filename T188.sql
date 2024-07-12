/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb3 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP DATABASE IF EXISTS `t188`;
CREATE DATABASE IF NOT EXISTS `t188` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `t188`;

DROP TABLE IF EXISTS `config`;
CREATE TABLE IF NOT EXISTS `config` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='配置文件';

DELETE FROM `config`;

DROP TABLE IF EXISTS `dictionary`;
CREATE TABLE IF NOT EXISTS `dictionary` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dic_code` varchar(200) DEFAULT NULL COMMENT '字段',
  `dic_name` varchar(200) DEFAULT NULL COMMENT '字段名',
  `code_index` int DEFAULT NULL COMMENT '编码',
  `index_name` varchar(200) DEFAULT NULL COMMENT '编码名字  Search111 ',
  `super_id` int DEFAULT NULL COMMENT '父字段id',
  `beizhu` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COMMENT='字典';

DELETE FROM `dictionary`;
INSERT INTO `dictionary` (`id`, `dic_code`, `dic_name`, `code_index`, `index_name`, `super_id`, `beizhu`, `create_time`) VALUES
	(1, 'sex_types', '性别类型', 1, '男', NULL, NULL, '2022-03-12 06:05:29'),
	(2, 'sex_types', '性别类型', 2, '女', NULL, NULL, '2022-03-12 06:05:29'),
	(3, 'jinyong_types', '是否禁用', 1, '启用', NULL, NULL, '2022-03-12 06:05:29'),
	(4, 'jinyong_types', '是否禁用', 2, '禁用', NULL, NULL, '2022-03-12 06:05:29'),
	(5, 'kehuxiansuo_types', '线索类型', 1, '线索类型1', NULL, NULL, '2022-03-12 06:05:29'),
	(6, 'kehuxiansuo_types', '线索类型', 2, '线索类型2', NULL, NULL, '2022-03-12 06:05:29'),
	(7, 'goutong_types', '沟通类型', 1, '沟通类型1', NULL, NULL, '2022-03-12 06:05:29'),
	(8, 'goutong_types', '沟通类型', 2, '沟通类型2', NULL, NULL, '2022-03-12 06:05:29'),
	(9, 'kehujifen_types', '增加类型', 1, '年度反馈', NULL, NULL, '2022-03-12 06:05:29'),
	(10, 'kehujifen_types', '增加类型', 2, '购买商品增加', NULL, NULL, '2022-03-12 06:05:29'),
	(11, 'kehujifen_types', '增加类型', 3, '人头奖励', NULL, NULL, '2022-03-12 06:05:29'),
	(12, 'kehuxiansuo_types', '线索类型', 3, '线索类型3', NULL, '', '2022-03-12 06:36:19');

DROP TABLE IF EXISTS `goutong`;
CREATE TABLE IF NOT EXISTS `goutong` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `yuangong_id` int DEFAULT NULL COMMENT '员工',
  `kehu_id` int DEFAULT NULL COMMENT '客户',
  `goutong_name` varchar(200) DEFAULT NULL COMMENT '沟通标题 Search111 ',
  `goutong_types` int DEFAULT NULL COMMENT '沟通类型 Search111 ',
  `goutong_time` timestamp NULL DEFAULT NULL COMMENT '沟通时间',
  `goutong_content` text COMMENT '沟通详情',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '添加时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COMMENT='沟通记录';

DELETE FROM `goutong`;
INSERT INTO `goutong` (`id`, `yuangong_id`, `kehu_id`, `goutong_name`, `goutong_types`, `goutong_time`, `goutong_content`, `insert_time`, `create_time`) VALUES
	(1, 1, 1, '沟通标题1', 2, '2022-03-12 06:07:38', '沟通详情1', '2022-03-12 06:07:38', '2022-03-12 06:07:38'),
	(2, 2, 2, '沟通标题2', 2, '2022-03-12 06:07:38', '沟通详情2', '2022-03-12 06:07:38', '2022-03-12 06:07:38'),
	(3, 3, 3, '沟通标题3', 1, '2022-03-12 06:07:38', '沟通详情3', '2022-03-12 06:07:38', '2022-03-12 06:07:38'),
	(4, 1, 4, '沟通标题4', 2, '2022-03-12 06:07:38', '沟通详情4', '2022-03-12 06:07:38', '2022-03-12 06:07:38'),
	(5, 2, 5, '沟通标题5', 1, '2022-03-12 06:07:38', '沟通详情5', '2022-03-12 06:07:38', '2022-03-12 06:07:38');

DROP TABLE IF EXISTS `kehu`;
CREATE TABLE IF NOT EXISTS `kehu` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `yuangong_id` int DEFAULT NULL COMMENT '员工',
  `kehu_name` varchar(200) DEFAULT NULL COMMENT '客户姓名 Search111 ',
  `kehu_phone` varchar(200) DEFAULT NULL COMMENT '客户手机号',
  `kehu_id_number` varchar(200) DEFAULT NULL COMMENT '客户身份证号',
  `kehu_photo` varchar(200) DEFAULT NULL COMMENT '客户照片',
  `sex_types` int DEFAULT NULL COMMENT '性别',
  `kehu_email` varchar(200) DEFAULT NULL COMMENT '电子邮箱',
  `kehu_jifen_number` decimal(10,2) DEFAULT NULL COMMENT '积分',
  `kehu_content` text COMMENT '客户详细介绍 ',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '添加时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COMMENT='客户';

DELETE FROM `kehu`;
INSERT INTO `kehu` (`id`, `yuangong_id`, `kehu_name`, `kehu_phone`, `kehu_id_number`, `kehu_photo`, `sex_types`, `kehu_email`, `kehu_jifen_number`, `kehu_content`, `insert_time`, `create_time`) VALUES
	(1, 1, '客户姓名1', '17703786901', '410224199610232001', 'http://localhost:8080/kehuguanxiguanli/upload/yuangong1.jpg', 2, '1@qq.com', 274.26, '客户详细介绍1', '2022-03-12 06:07:38', '2022-03-12 06:07:38'),
	(2, 2, '客户姓名2', '17703786902', '410224199610232002', 'http://localhost:8080/kehuguanxiguanli/upload/yuangong2.jpg', 1, '2@qq.com', 496.09, '客户详细介绍2', '2022-03-12 06:07:38', '2022-03-12 06:07:38'),
	(3, 3, '客户姓名3', '17703786903', '410224199610232003', 'http://localhost:8080/kehuguanxiguanli/upload/yuangong3.jpg', 1, '3@qq.com', 434.26, '客户详细介绍3', '2022-03-12 06:07:38', '2022-03-12 06:07:38'),
	(4, 1, '客户姓名4', '17703786904', '410224199610232004', 'http://localhost:8080/kehuguanxiguanli/upload/yuangong1.jpg', 2, '4@qq.com', 381.71, '客户详细介绍4', '2022-03-12 06:07:38', '2022-03-12 06:07:38'),
	(5, 2, '客户姓名5', '17703786905', '410224199610232005', 'http://localhost:8080/kehuguanxiguanli/upload/yuangong2.jpg', 2, '5@qq.com', 129.42, '客户详细介绍5', '2022-03-12 06:07:38', '2022-03-12 06:07:38');

DROP TABLE IF EXISTS `kehujifen`;
CREATE TABLE IF NOT EXISTS `kehujifen` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `yuangong_id` int DEFAULT NULL COMMENT '员工',
  `kehu_id` int DEFAULT NULL COMMENT '客户',
  `kehujifen_types` int DEFAULT NULL COMMENT '增加类型 Search111 ',
  `kehujifen_content` text COMMENT '备注',
  `kehujifen_number` decimal(10,2) DEFAULT NULL COMMENT '增加积分数量',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '增加时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COMMENT='客户积分';

DELETE FROM `kehujifen`;
INSERT INTO `kehujifen` (`id`, `yuangong_id`, `kehu_id`, `kehujifen_types`, `kehujifen_content`, `kehujifen_number`, `insert_time`, `create_time`) VALUES
	(1, 1, 1, 3, '备注1', 333.69, '2022-03-12 06:07:38', '2022-03-12 06:07:38'),
	(2, 2, 2, 1, '备注2', 623.50, '2022-03-12 06:07:38', '2022-03-12 06:07:38'),
	(3, 3, 3, 2, '备注3', 418.69, '2022-03-12 06:07:38', '2022-03-12 06:07:38'),
	(4, 1, 4, 3, '备注4', 154.89, '2022-03-12 06:07:38', '2022-03-12 06:07:38'),
	(5, 2, 5, 1, '备注5', 989.20, '2022-03-12 06:07:38', '2022-03-12 06:07:38'),
	(6, 1, 1, 3, '<p>10sda</p>', 10.00, '2022-03-12 06:35:30', '2022-03-12 06:35:30'),
	(7, 1, 1, 3, '<p>10sda</p>', 10.00, '2022-03-12 06:39:34', '2022-03-12 06:39:34');

DROP TABLE IF EXISTS `kehuxiansuo`;
CREATE TABLE IF NOT EXISTS `kehuxiansuo` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `yuangong_id` int DEFAULT NULL COMMENT '员工',
  `kehuxiansuo_name` varchar(200) DEFAULT NULL COMMENT '姓名 Search111 ',
  `kehuxiansuo_phone` varchar(200) DEFAULT NULL COMMENT '手机号',
  `kehuxiansuo_id_number` varchar(200) DEFAULT NULL COMMENT '身份证号',
  `kehuxiansuo_photo` varchar(200) DEFAULT NULL COMMENT '照片',
  `sex_types` int DEFAULT NULL COMMENT '性别',
  `kehuxiansuo_email` varchar(200) DEFAULT NULL COMMENT '电子邮箱',
  `kehuxiansuo_types` int DEFAULT NULL COMMENT '线索类型 Search111 ',
  `kehuxiansuo_content` text COMMENT '线索详情',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '添加时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COMMENT='客户线索';

DELETE FROM `kehuxiansuo`;
INSERT INTO `kehuxiansuo` (`id`, `yuangong_id`, `kehuxiansuo_name`, `kehuxiansuo_phone`, `kehuxiansuo_id_number`, `kehuxiansuo_photo`, `sex_types`, `kehuxiansuo_email`, `kehuxiansuo_types`, `kehuxiansuo_content`, `insert_time`, `create_time`) VALUES
	(1, 1, '姓名1', '17703786901', '410224199610232001', 'http://localhost:8080/kehuguanxiguanli/upload/yuangong1.jpg', 1, '1@qq.com', 2, '线索详情1', '2022-03-12 06:07:38', '2022-03-12 06:07:38'),
	(2, 2, '姓名2', '17703786902', '410224199610232002', 'http://localhost:8080/kehuguanxiguanli/upload/yuangong2.jpg', 2, '2@qq.com', 2, '线索详情2', '2022-03-12 06:07:38', '2022-03-12 06:07:38'),
	(3, 3, '姓名3', '17703786903', '410224199610232003', 'http://localhost:8080/kehuguanxiguanli/upload/yuangong3.jpg', 1, '3@qq.com', 1, '线索详情3', '2022-03-12 06:07:38', '2022-03-12 06:07:38'),
	(4, 1, '姓名4', '17703786904', '410224199610232004', 'http://localhost:8080/kehuguanxiguanli/upload/yuangong1.jpg', 2, '4@qq.com', 2, '<p>线索详情46565</p>', '2022-03-12 06:07:38', '2022-03-12 06:07:38'),
	(5, 2, '姓名5', '17703786905', '410224199610232005', 'http://localhost:8080/kehuguanxiguanli/upload/yuangong2.jpg', 1, '5@qq.com', 2, '线索详情5', '2022-03-12 06:07:38', '2022-03-12 06:07:38');

DROP TABLE IF EXISTS `token`;
CREATE TABLE IF NOT EXISTS `token` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='token表';

DELETE FROM `token`;
INSERT INTO `token` (`id`, `userid`, `username`, `tablename`, `role`, `token`, `addtime`, `expiratedtime`) VALUES
	(1, 6, 'admin', 'users', '管理员', 'sfmuibzlnbmlo1yiu9inl4ezuxbv1ct9', '2022-03-12 06:11:10', '2024-05-14 09:11:56'),
	(2, 1, 'a1', 'yuangong', '员工', 'zsp66l5hu26ozpw7j9frtsktdq0t48bx', '2022-03-12 06:32:16', '2024-05-14 09:12:40');

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='管理员';

DELETE FROM `users`;
INSERT INTO `users` (`id`, `username`, `password`, `role`, `addtime`) VALUES
	(6, 'admin', '123456', '管理员', '2022-05-02 06:51:13');

DROP TABLE IF EXISTS `yuangong`;
CREATE TABLE IF NOT EXISTS `yuangong` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) DEFAULT NULL COMMENT '账户',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `yuangong_name` varchar(200) DEFAULT NULL COMMENT '员工姓名 Search111 ',
  `yuangong_phone` varchar(200) DEFAULT NULL COMMENT '员工手机号',
  `yuangong_id_number` varchar(200) DEFAULT NULL COMMENT '员工身份证号',
  `yuangong_photo` varchar(200) DEFAULT NULL COMMENT '员工头像',
  `sex_types` int DEFAULT NULL COMMENT '性别',
  `yuangong_email` varchar(200) DEFAULT NULL COMMENT '电子邮箱',
  `jinyong_types` int DEFAULT NULL COMMENT '是否禁用',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='员工';

DELETE FROM `yuangong`;
INSERT INTO `yuangong` (`id`, `username`, `password`, `yuangong_name`, `yuangong_phone`, `yuangong_id_number`, `yuangong_photo`, `sex_types`, `yuangong_email`, `jinyong_types`, `create_time`) VALUES
	(1, '员工1', '123456', '员工姓名1', '17703786901', '410224199610232001', 'http://localhost:8080/kehuguanxiguanli/upload/yuangong1.jpg', 2, '1@qq.com', 1, '2022-03-12 06:07:38'),
	(2, '员工2', '123456', '员工姓名2', '17703786902', '410224199610232002', 'http://localhost:8080/kehuguanxiguanli/upload/yuangong2.jpg', 1, '2@qq.com', 2, '2022-03-12 06:07:38'),
	(3, '员工3', '123456', '员工姓名3', '17703786903', '410224199610232003', 'http://localhost:8080/kehuguanxiguanli/upload/yuangong3.jpg', 2, '3@qq.com', 1, '2022-03-12 06:07:38');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
