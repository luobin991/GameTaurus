/*
Navicat MySQL Data Transfer

Source Server         : mySql150
Source Server Version : 50520
Source Host           : 192.168.0.150:3306
Source Database       : demo

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2018-06-13 15:55:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `sys_authorize`
-- ----------------------------
DROP TABLE IF EXISTS `sys_authorize`;
CREATE TABLE `sys_authorize` (
  `authorizeId` varchar(50) NOT NULL COMMENT '授权功能主键',
  `objectType` int(11) DEFAULT NULL COMMENT '对象分类:1-角色2-用户',
  `objectId` varchar(50) DEFAULT NULL COMMENT '对象主键',
  `itemType` int(11) DEFAULT NULL COMMENT '项目类型:1-菜单2-按钮3-视图',
  `itemId` varchar(50) DEFAULT NULL COMMENT '项目主键',
  `createDate` timestamp NULL DEFAULT NULL,
  `createUserId` int(11) DEFAULT NULL,
  PRIMARY KEY (`authorizeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_authorize
-- ----------------------------
INSERT INTO `sys_authorize` VALUES ('02f8a574-5b12-4754-9785-738e5686f9bc', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '2', '9abcc413-3aef-46ec-88da-e73b35f68d09', '2018-06-06 15:42:03', '1');
INSERT INTO `sys_authorize` VALUES ('09a5a344-b7d7-4ee1-a349-63eacae3a729', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '1', '512a1f98-d23b-4691-9313-b3452b88f6d0', '2018-06-06 15:42:03', '1');
INSERT INTO `sys_authorize` VALUES ('09ff439b-f901-4cd3-baf9-f158dd03a87c', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '2', 'b6aee85c-111c-4ba8-b9d1-4dfeeb753e00', '2018-06-06 15:42:03', '1');
INSERT INTO `sys_authorize` VALUES ('0a5a7fd8-3021-487f-9633-28f5b9af3942', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', 'b0c98d21-86bb-48b6-abed-5778da103fd2', '2018-06-06 15:42:05', '1');
INSERT INTO `sys_authorize` VALUES ('0b81f404-ba78-4e70-b212-85eaf645af1b', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', 'ed1b3a1d-b407-4c37-9499-baa7c8a57976', '2018-06-06 15:42:06', '1');
INSERT INTO `sys_authorize` VALUES ('0dd01614-f726-486c-9506-f7ceafca00df', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', 'c12e43a0-1410-4419-b36f-ce3758c665ec', '2018-06-06 15:42:06', '1');
INSERT INTO `sys_authorize` VALUES ('0f596f08-ee00-4bc1-9e20-95ba6caa793b', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '2', '61e09ebf-8516-4688-a8d7-75e78e7a00ac', '2018-06-06 15:42:03', '1');
INSERT INTO `sys_authorize` VALUES ('0f5ba857-adba-4762-8dd3-1bacf53d0f03', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', 'e893ffab-c985-4be0-8401-553378bdb10c', '2018-06-06 15:42:05', '1');
INSERT INTO `sys_authorize` VALUES ('0fac18a2-92b1-445e-bd90-e0785a559126', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', '78f1c959-376f-4673-9b9a-fd2f774d3358', '2018-06-06 15:42:05', '1');
INSERT INTO `sys_authorize` VALUES ('117a6ee5-e50e-42ee-8aff-70101ae4ba4c', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '2', '66d3dc67-8e7e-4a3c-ae6d-04f184498dce', '2018-06-06 15:42:04', '1');
INSERT INTO `sys_authorize` VALUES ('13949af9-b121-4e8e-8141-8c8059187ffc', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '2', 'a94f0f93-da21-4b34-bef5-3851de07370e', '2018-06-06 15:42:03', '1');
INSERT INTO `sys_authorize` VALUES ('139a9d80-3aeb-47cc-ab17-2431a05ad5d6', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', '08039d5f-43e5-408b-bbde-6709df8180e7', '2018-06-06 15:42:07', '1');
INSERT INTO `sys_authorize` VALUES ('155986da-eba4-4577-b17f-e864a9f41488', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', 'bf4f05f0-46b5-4ecb-8bee-e1305582e5a9', '2018-06-06 15:42:06', '1');
INSERT INTO `sys_authorize` VALUES ('15f08eae-bc57-4331-8162-796efa6fcd39', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', '17219ee9-efea-4336-a67c-313cfa759637', '2018-06-06 15:42:06', '1');
INSERT INTO `sys_authorize` VALUES ('16357c4f-6cff-4a86-95f3-a0aef3161cae', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '1', '4b55d173-3c8d-4147-8bcc-df38d3125119', '2018-06-06 15:42:03', '1');
INSERT INTO `sys_authorize` VALUES ('18eed57d-06ee-4553-ad98-ce8ab82cc62e', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '1', '40858e35-67e2-40f3-836f-0d699b711847', '2018-06-06 15:42:02', '1');
INSERT INTO `sys_authorize` VALUES ('19af04db-2630-440e-a877-a277fbba1dd5', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', '20873d37-2378-49c6-acdd-79e811d7ef2d', '2018-06-06 15:42:07', '1');
INSERT INTO `sys_authorize` VALUES ('1ae28fcc-3b2d-4884-bf3b-1d9ab46921c0', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '1', '13', '2018-06-06 15:42:03', '1');
INSERT INTO `sys_authorize` VALUES ('1b8bacd2-125f-4f0e-bc20-88ecd21f2f46', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', '5001806f-556f-486d-b3d6-5d9a885d2655', '2018-06-06 15:42:04', '1');
INSERT INTO `sys_authorize` VALUES ('1c2889b2-70c0-485f-a61a-9cf43c06f33c', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '1', '7', '2018-06-06 15:42:03', '1');
INSERT INTO `sys_authorize` VALUES ('1c523475-04a8-466a-98fb-34aa00a101a4', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '2', '3602a672-8126-4fe9-895d-4d89f2592304', '2018-06-06 15:42:03', '1');
INSERT INTO `sys_authorize` VALUES ('1d0de1b1-1746-4f29-adfb-05e58e690705', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', 'bb9a7d3b-bea0-4304-9874-b1c2a05d5dd8', '2018-06-06 15:42:05', '1');
INSERT INTO `sys_authorize` VALUES ('1ff7fa9d-f227-4133-b812-29383c0e481b', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', 'a1e0f5a9-1cb1-4608-a023-33ec607d81da', '2018-06-06 15:42:05', '1');
INSERT INTO `sys_authorize` VALUES ('20d38c90-0ac5-4971-9a56-f97468d585fd', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', 'd119ef32-905b-434a-982d-f7d0c7032b19', '2018-06-06 15:42:06', '1');
INSERT INTO `sys_authorize` VALUES ('264a31d7-e0be-4873-a71e-405789c51b03', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', 'cd16c29c-22d6-4a7a-92e5-ef78b394805e', '2018-06-06 15:42:05', '1');
INSERT INTO `sys_authorize` VALUES ('26974c6d-2db9-4fb8-a64f-ce5eb8cc1349', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', 'af4a6678-ccb5-49ae-a50a-eb7da9552b4d', '2018-06-06 15:42:06', '1');
INSERT INTO `sys_authorize` VALUES ('26b89d1c-f1c2-4cde-b128-fc13df6566ab', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '2', '0a5e2a9d-0152-443b-9831-9c514447aef7', '2018-06-06 15:42:03', '1');
INSERT INTO `sys_authorize` VALUES ('27c10a57-eb1b-4785-907a-9fdb260d75a9', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '1', '40a688a7-5e4a-497d-94f0-0c7c09a12b10', '2018-06-06 15:42:02', '1');
INSERT INTO `sys_authorize` VALUES ('29979d4f-74b3-4e3c-98b5-ab0b8fb02774', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '2', '2d10c709-03b0-4fde-b1af-dbf4aad1f79e', '2018-06-06 15:42:03', '1');
INSERT INTO `sys_authorize` VALUES ('2f20ad87-5201-423c-af52-4a6079be6360', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '2', '82abd2f5-d5fd-4a72-8162-58cd69b7f391', '2018-06-06 15:42:03', '1');
INSERT INTO `sys_authorize` VALUES ('30bdbcb7-3141-44b7-a8e7-4eebaefa2cf9', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', '808c6092-51da-467e-9622-74bd517e9e7c', '2018-06-06 15:42:06', '1');
INSERT INTO `sys_authorize` VALUES ('34c33e5c-d21d-4332-b0cf-233a756ac58f', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '2', 'd7be5328-1af6-4f17-8cb0-76f547c58678', '2018-06-06 15:42:04', '1');
INSERT INTO `sys_authorize` VALUES ('35174aa2-caa5-42b4-a12a-5f4d84932aea', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', 'd22e2801-7020-4d8a-984e-725f44f8e3bf', '2018-06-06 15:42:05', '1');
INSERT INTO `sys_authorize` VALUES ('3574ed91-c850-479b-9bff-748bd720b7fb', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', '26b01428-bcc1-4c2d-b1b0-37a95e24f7ad', '2018-06-06 15:42:06', '1');
INSERT INTO `sys_authorize` VALUES ('35bf3306-d018-4bdb-9bfd-d9266a8d96b5', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '2', 'd1e4f9be-1df9-4d36-b1fd-ea58b6fb13d4', '2018-06-06 15:42:04', '1');
INSERT INTO `sys_authorize` VALUES ('35c28384-cd2d-4787-9b60-b9f97de4169e', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', '546ead4f-2f5c-4f55-a1f1-3fe5a07829fe', '2018-06-06 15:42:06', '1');
INSERT INTO `sys_authorize` VALUES ('3a3f95ab-36ff-4f6f-b047-83a5639abeec', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', '066eba8c-28f2-4d0e-b70e-9f6cb56fc244', '2018-06-06 15:42:07', '1');
INSERT INTO `sys_authorize` VALUES ('3b987492-7e0e-4dbd-80c8-72f2875f0771', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '1', '5', '2018-06-06 15:42:02', '1');
INSERT INTO `sys_authorize` VALUES ('3b9ec457-1e24-444d-b7b8-64d17d134561', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', 'e6c8aa6b-10c9-4620-a14a-8a2beb14f76b', '2018-06-06 15:42:07', '1');
INSERT INTO `sys_authorize` VALUES ('3d6e38aa-f25c-4439-8ca7-864b1189f372', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', '9f0714e0-3737-4e8f-8f60-d9c9d142803b', '2018-06-06 15:42:07', '1');
INSERT INTO `sys_authorize` VALUES ('3f641157-5fc3-4ca9-8fc2-f03e46abee06', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '1', '4', '2018-06-06 15:42:02', '1');
INSERT INTO `sys_authorize` VALUES ('3feec427-c0a5-48df-9851-e8da988eee3e', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', '97e2e171-ab68-45b1-a675-2f2247f991d1', '2018-06-06 15:42:05', '1');
INSERT INTO `sys_authorize` VALUES ('44d6f178-2f1f-4181-bf9c-4eed4457dfd9', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '1', '5f060855-48f2-42bb-8cc2-213f35e276c8', '2018-06-06 15:42:02', '1');
INSERT INTO `sys_authorize` VALUES ('45d206d3-1736-473f-aeab-8e565d975245', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '2', '10f5fb95-b07d-4db2-8189-b06ebacd0cf3', '2018-06-06 15:42:03', '1');
INSERT INTO `sys_authorize` VALUES ('4a7f1871-07de-4b8b-b3f4-e2b1403a8d92', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '1', 'ae7e944f-2fbd-407f-aa38-a5f3a40798b9', '2018-06-06 15:42:03', '1');
INSERT INTO `sys_authorize` VALUES ('4abeda64-bb4e-40da-a388-186215650850', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', 'edb497ed-3acb-4ac0-9bde-04664753661b', '2018-06-06 15:42:05', '1');
INSERT INTO `sys_authorize` VALUES ('4ac398b8-b2cf-4140-b2f3-e6d434f4f348', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', '0f55821c-bb59-4a23-ad05-a2933b905d6b', '2018-06-06 15:42:05', '1');
INSERT INTO `sys_authorize` VALUES ('4b8979cd-b3c6-4093-8711-568797d325f3', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', '89db0190-3400-4441-ad6b-b265141ae6ec', '2018-06-06 15:42:07', '1');
INSERT INTO `sys_authorize` VALUES ('4bc6134c-28c0-4f99-b5d5-82cbfe158a40', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', '31df621f-9cba-41fa-9ad9-3bb8067afd2b', '2018-06-06 15:42:06', '1');
INSERT INTO `sys_authorize` VALUES ('4c2ca5b0-0c50-49d5-a2a9-4899a5bd2f81', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', 'df4e1f71-059b-4d98-b79f-30a84e787902', '2018-06-06 15:42:05', '1');
INSERT INTO `sys_authorize` VALUES ('4c5e69b6-ee3f-4159-8cca-6e9531fff06c', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '2', '8dd8b80e-f7fb-405d-b3fa-61bd5f0d12d1', '2018-06-06 15:42:04', '1');
INSERT INTO `sys_authorize` VALUES ('4d11d8ab-2819-47d9-8e66-d59bd6652d99', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', '2d1fbbd6-9fd9-49cf-aedd-a5ab174ab86f', '2018-06-06 15:42:06', '1');
INSERT INTO `sys_authorize` VALUES ('4f0ec9bf-0f2d-46e9-a854-c7224f160efa', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', '8883cd0e-8911-4b85-a75c-32bfcc3d38ed', '2018-06-06 15:42:05', '1');
INSERT INTO `sys_authorize` VALUES ('4f37a453-88d4-4b99-b496-b869d7ea7b11', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', 'f51421ea-20d4-4008-a2c9-7cb11c28df52', '2018-06-06 15:42:05', '1');
INSERT INTO `sys_authorize` VALUES ('5123d803-dfb4-48bc-b3b9-c2a34b8cbce9', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '1', '2cdeb781-d715-4566-9533-755eaa32d20f', '2018-06-06 15:42:03', '1');
INSERT INTO `sys_authorize` VALUES ('51c5b509-2087-4329-af7a-b4e07c24041e', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', '6609dbba-99b7-4aa0-a5bb-ee514fe9bdd6', '2018-06-06 15:42:06', '1');
INSERT INTO `sys_authorize` VALUES ('544785b7-7955-4ea6-8996-2ba1bdb99b83', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', '9d5cc4f5-a37b-4f36-8527-308f1bc80910', '2018-06-06 15:42:07', '1');
INSERT INTO `sys_authorize` VALUES ('568b6758-deac-488e-bda8-d4c8dcaf82d8', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '2', '63ac3e88-d2de-4888-a933-9a103d263252', '2018-06-06 15:42:04', '1');
INSERT INTO `sys_authorize` VALUES ('56959ee6-2a1d-4f87-8572-ca6821190856', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', '4dc2866d-de01-497e-8df2-e8890f9145d0', '2018-06-06 15:42:04', '1');
INSERT INTO `sys_authorize` VALUES ('587a2843-7011-4a1f-ac8d-1e977b91434e', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '2', '9a4a830b-c8f2-45dd-aac7-936f78002644', '2018-06-06 15:42:04', '1');
INSERT INTO `sys_authorize` VALUES ('5ab4e76f-505a-4e95-8f09-f2afbd14883f', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', 'da916d39-0ae0-4be7-9d0a-9d8944dfa6ce', '2018-06-06 15:42:05', '1');
INSERT INTO `sys_authorize` VALUES ('5d72310e-87b4-42a8-a13e-8d506acccfef', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '2', '3596504b-c79f-49f2-a624-c05fee15a1d2', '2018-06-06 15:42:04', '1');
INSERT INTO `sys_authorize` VALUES ('5dcfcc4b-4114-4378-b0b0-983853422a7a', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '1', '10', '2018-06-06 15:42:03', '1');
INSERT INTO `sys_authorize` VALUES ('5e602b1e-22b3-4b88-b1fe-7e9de7a067b9', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', 'b436287d-1ab8-4cae-b595-d3938f9103a9', '2018-06-06 15:42:05', '1');
INSERT INTO `sys_authorize` VALUES ('5f78627d-df9f-4a7e-a5b6-e076cfaaeaf1', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '1', '0e4fb492-a8a2-495a-bad1-8f3a03ab0112', '2018-06-06 15:42:03', '1');
INSERT INTO `sys_authorize` VALUES ('60596be5-9023-427a-ae63-0505ef7df6b6', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', '9e0bd36e-5723-403a-b65c-f6370c75eccb', '2018-06-06 15:42:06', '1');
INSERT INTO `sys_authorize` VALUES ('60f986b8-2cfa-4d3d-8e24-00f01600bdd1', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '2', '0d4f174d-a2e2-466b-b660-f481d2972752', '2018-06-06 15:42:04', '1');
INSERT INTO `sys_authorize` VALUES ('613b9816-5ef6-44c4-8264-3b84fc052e7f', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', '5de95520-883c-46d1-b4ce-fdd0b483e14d', '2018-06-06 15:42:05', '1');
INSERT INTO `sys_authorize` VALUES ('616276b0-907b-47c2-98df-803001bf87a0', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '2', 'a7d4ed32-469c-4ae4-9cf1-19caf28683bc', '2018-06-06 15:42:04', '1');
INSERT INTO `sys_authorize` VALUES ('637d57ae-b913-440c-9856-407b5725e4b6', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', '68baadb0-f065-4282-a7bc-835458a4a3ee', '2018-06-06 15:42:05', '1');
INSERT INTO `sys_authorize` VALUES ('64c121e8-e90f-4784-81d2-df7859402ca6', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '2', '04442294-3e1b-4312-be91-e15251c47f19', '2018-06-06 15:42:03', '1');
INSERT INTO `sys_authorize` VALUES ('64da029a-c2f1-4fa8-84fb-504cbe8403f7', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', '22823660-93ec-4678-8d50-f3a42279b0eb', '2018-06-06 15:42:05', '1');
INSERT INTO `sys_authorize` VALUES ('6604c76a-8fe0-4227-9716-e034716db222', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', '0fe14d98-e73b-4c36-860c-b4e2946387c3', '2018-06-06 15:42:05', '1');
INSERT INTO `sys_authorize` VALUES ('66d2f13b-fa87-4240-8deb-d19b522f5ea0', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', 'bfaa8324-8f58-497c-94ff-ee38ea311ab4', '2018-06-06 15:42:06', '1');
INSERT INTO `sys_authorize` VALUES ('6a88ad27-829f-46fe-b81b-18c665f9a5cb', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', '1d14b529-ad80-466c-baf3-173854ff0452', '2018-06-06 15:42:04', '1');
INSERT INTO `sys_authorize` VALUES ('6b708869-0a87-49da-853d-800779f82677', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', 'bdd5720e-1df6-4567-bfef-3446694c48ac', '2018-06-06 15:42:05', '1');
INSERT INTO `sys_authorize` VALUES ('6d54dba6-4165-4693-93a1-921311736b1e', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', 'f1c56fc9-2965-4fb5-8346-6bca437c3e18', '2018-06-06 15:42:05', '1');
INSERT INTO `sys_authorize` VALUES ('6eff9f10-d3a8-489e-b13f-b5e30f3c5cba', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', 'e2e6a2b9-106a-49d8-9009-27241b4de74e', '2018-06-06 15:42:04', '1');
INSERT INTO `sys_authorize` VALUES ('70863ab1-1357-444b-a51c-42b67bb42ae1', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', '7adb20ba-7451-4e80-b7ef-b822406ebd78', '2018-06-06 15:42:06', '1');
INSERT INTO `sys_authorize` VALUES ('7109ece3-9adb-4f90-97cf-ffa4f1cc854c', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', '3093ac78-9445-480d-adfa-5b49314c41f3', '2018-06-06 15:42:07', '1');
INSERT INTO `sys_authorize` VALUES ('74df494f-3fd5-490e-97b8-268507d84c20', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', '0633a215-92f3-4463-9e19-bcad41f304b7', '2018-06-06 15:42:06', '1');
INSERT INTO `sys_authorize` VALUES ('76202769-f686-4d3e-ad6a-579c254608d5', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', '1a85c975-a49d-4fc4-8606-e20e358c40ca', '2018-06-06 15:42:05', '1');
INSERT INTO `sys_authorize` VALUES ('7981e3a8-2c22-4375-afee-c35e0a6440eb', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '2', 'e88f94fc-a17f-4c88-9b7d-5d0f565e9cb5', '2018-06-06 15:42:04', '1');
INSERT INTO `sys_authorize` VALUES ('79ac306c-7c8c-4999-9eb5-618b3721051b', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '1', '3', '2018-06-06 15:42:02', '1');
INSERT INTO `sys_authorize` VALUES ('7ca53e73-bbef-4c6d-8753-6c47e992d10a', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', 'd1723b34-8c2b-4e5b-9cda-096c2f37bbfd', '2018-06-06 15:42:05', '1');
INSERT INTO `sys_authorize` VALUES ('7e4556dd-e3c9-4aa4-9860-50bdd5a0d403', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '1', '12', '2018-06-06 15:42:03', '1');
INSERT INTO `sys_authorize` VALUES ('7e8fa293-37ce-49e3-bc41-d774da6438be', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '1', '6', '2018-06-06 15:42:02', '1');
INSERT INTO `sys_authorize` VALUES ('7ea8d2f9-3e61-4c72-a79f-04c1166e69a6', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', '0502e7c3-7f92-4005-8289-f03293974bc5', '2018-06-06 15:42:07', '1');
INSERT INTO `sys_authorize` VALUES ('7eee0150-b1c0-4a87-b16a-fee7bc37026f', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', 'e9d4e16c-9b9b-4c4d-a492-e94fd0bdc9b9', '2018-06-06 15:42:07', '1');
INSERT INTO `sys_authorize` VALUES ('7eefa344-abfa-45a8-a101-fcf90eddf57e', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '2', '1ce54d69-6fa8-4b30-9c64-528d8f8012a6', '2018-06-06 15:42:03', '1');
INSERT INTO `sys_authorize` VALUES ('7fe4aa16-8794-4f31-9267-4958f53894e2', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '2', '4ce90bc7-3219-42d9-a85a-8148e8c858d7', '2018-06-06 15:42:04', '1');
INSERT INTO `sys_authorize` VALUES ('8457ddea-23b7-4cda-8165-371ccdf4b899', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '2', 'f2f968bd-ed84-4288-b48a-532a3f629966', '2018-06-06 15:42:04', '1');
INSERT INTO `sys_authorize` VALUES ('84756ec3-cefb-412b-bfc4-75b03175520f', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', '9beb3b18-722b-4d74-ac73-800743c882bc', '2018-06-06 15:42:05', '1');
INSERT INTO `sys_authorize` VALUES ('8602ce7b-dc6f-49a9-ae1c-ef34a9d11cb7', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '1', '1', '2018-06-06 15:42:02', '1');
INSERT INTO `sys_authorize` VALUES ('86212195-f328-4895-98e3-97604684a954', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', 'd726598d-b90b-4ba4-952b-e7b9172c82cb', '2018-06-06 15:42:04', '1');
INSERT INTO `sys_authorize` VALUES ('884506c3-94d8-4215-82e5-9b0d9c73aefd', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', 'ae54371f-4d8f-4957-8505-73b3fab3590a', '2018-06-06 15:42:07', '1');
INSERT INTO `sys_authorize` VALUES ('8dc6e22e-8a75-4919-b651-1accb059cf10', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', 'a20364ba-8aad-45dc-ad95-09a8ba52ded9', '2018-06-06 15:42:07', '1');
INSERT INTO `sys_authorize` VALUES ('919e5804-4563-47b5-8cba-8ce72aed555b', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', '58ce030d-cec1-4b45-bff0-d599381e5040', '2018-06-06 15:42:05', '1');
INSERT INTO `sys_authorize` VALUES ('926a5938-a583-4a15-a8ae-5d4fc301e0bf', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '1', '2', '2018-06-06 15:42:02', '1');
INSERT INTO `sys_authorize` VALUES ('935e1d9a-9b8c-429a-be2c-b5e6d18c261b', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '2', 'c126315a-39e7-44e0-aa22-58e79e0242ff', '2018-06-06 15:42:04', '1');
INSERT INTO `sys_authorize` VALUES ('958e9981-d4a5-47ae-bf78-99f86e80f722', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '1', '11', '2018-06-06 15:42:03', '1');
INSERT INTO `sys_authorize` VALUES ('95c74808-c52c-4ad5-b01c-9f629b3b1845', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', '845cef33-3bf4-4121-b276-04d9b28a8861', '2018-06-06 15:42:06', '1');
INSERT INTO `sys_authorize` VALUES ('965566c5-46e6-4b0f-82f4-74e4c3516567', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '1', '9', '2018-06-06 15:42:02', '1');
INSERT INTO `sys_authorize` VALUES ('969889af-b5d6-42b9-b8d5-db8a42100d11', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '2', '2a50c5f5-5210-479e-9ba5-c97c221b4a59', '2018-06-06 15:42:03', '1');
INSERT INTO `sys_authorize` VALUES ('96d23540-dd14-445c-b0e0-f0016000cd58', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', 'f9c541be-0a37-422b-801d-cee86b5b3903', '2018-06-06 15:42:06', '1');
INSERT INTO `sys_authorize` VALUES ('96eb506a-8f80-43b5-be74-5046c145f524', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', '58963e11-9928-44e5-a6f4-682aaa030754', '2018-06-06 15:42:05', '1');
INSERT INTO `sys_authorize` VALUES ('988189a3-0bab-4925-81a5-7c8fd9b6596f', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', 'c916ce99-d7ad-4b7c-94ac-1e275c9e592e', '2018-06-06 15:42:05', '1');
INSERT INTO `sys_authorize` VALUES ('9a5ed8e1-0427-485a-8a38-148950c5176e', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', '644e08af-3f08-47f1-a198-45962351f851', '2018-06-06 15:42:07', '1');
INSERT INTO `sys_authorize` VALUES ('9a90bfd6-cc47-43e6-a896-7687955f9925', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', '4ca190f2-c4bc-45a0-960a-0eb8e11440b4', '2018-06-06 15:42:07', '1');
INSERT INTO `sys_authorize` VALUES ('9c89c83e-f61c-47f9-8ae1-bbb4324bd0b2', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', 'e71f5b7a-5d3e-4231-8cc7-48230bfda6ea', '2018-06-06 15:42:06', '1');
INSERT INTO `sys_authorize` VALUES ('9e343565-dcf2-431c-bff7-39cba1c45b36', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '2', '6d18b63a-6067-41ed-bf0b-78e4534dfb45', '2018-06-06 15:42:03', '1');
INSERT INTO `sys_authorize` VALUES ('a3252670-bc81-4248-9571-d84ba1bd557d', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', 'f74e586d-84b5-4309-9cd3-4fbd556c2c6d', '2018-06-06 15:42:06', '1');
INSERT INTO `sys_authorize` VALUES ('a412dc74-70ca-4d1d-9da4-1e994cf0fc31', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', 'c309df45-141d-429a-89a0-d50ef1e067ff', '2018-06-06 15:42:04', '1');
INSERT INTO `sys_authorize` VALUES ('a66a7485-2313-4468-b611-fd8808e934bc', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '2', '46688b17-c465-40c7-967e-21f95be7211c', '2018-06-06 15:42:04', '1');
INSERT INTO `sys_authorize` VALUES ('a8f5bac0-6b9f-4140-8e41-8006d493b1ad', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', '3f3b7d43-88a8-4eda-a6d4-f38aa3cf8178', '2018-06-06 15:42:06', '1');
INSERT INTO `sys_authorize` VALUES ('aa2b776c-3b48-43e7-bc75-2024dd095e5c', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '2', '59efb3ec-4794-44dd-acd0-3e48531cc65d', '2018-06-06 15:42:04', '1');
INSERT INTO `sys_authorize` VALUES ('ab4becbf-44c0-4ad3-affb-a42a3fec0dfe', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', '930cb5ff-8d32-4935-b6ab-bed66d958726', '2018-06-06 15:42:07', '1');
INSERT INTO `sys_authorize` VALUES ('ac3a92e0-7f4f-40f4-8850-27a38bca95dc', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', 'cfeee3d7-aaad-4fc3-a36e-778a52ddc098', '2018-06-06 15:42:06', '1');
INSERT INTO `sys_authorize` VALUES ('ac9f1e8f-2191-4ad8-9cd2-fc41bfb5a5e8', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', '208f9f5d-3dd0-4bd0-8cd2-04c407305eea', '2018-06-06 15:42:04', '1');
INSERT INTO `sys_authorize` VALUES ('b0dee7d3-2628-41a6-8c12-8cfc99c98667', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '2', '9f44ed9b-3260-4324-aa89-343f9f9bf47b', '2018-06-06 15:42:04', '1');
INSERT INTO `sys_authorize` VALUES ('b4f86f4c-1e1d-4d81-9ccb-316a190fe84f', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', '59923007-6bcc-4d9a-b491-a67eb3c3cc43', '2018-06-06 15:42:06', '1');
INSERT INTO `sys_authorize` VALUES ('b6c97288-9e1d-4df2-bf2b-be7cd6f21f1d', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '1', '8', '2018-06-06 15:42:03', '1');
INSERT INTO `sys_authorize` VALUES ('b773efe9-3fd2-48a5-84d7-e88e8b3b6fe9', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '2', '22a9404e-e44c-4af8-aee7-53fbbf00adc2', '2018-06-06 15:42:04', '1');
INSERT INTO `sys_authorize` VALUES ('b837c5f3-1bf5-4459-8889-32eb82a4fa1b', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', '754fef69-aefc-43b8-a526-50bab5daa7f3', '2018-06-06 15:42:06', '1');
INSERT INTO `sys_authorize` VALUES ('bc987b2f-47a4-4b05-80f0-ce62a5072d6e', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', '7b995852-7b21-417b-87ff-7a485ab70722', '2018-06-06 15:42:05', '1');
INSERT INTO `sys_authorize` VALUES ('c1602eb6-f751-4b13-b148-fc02e072ef27', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', '7842e3cc-f6b3-4067-b70a-46059a670a6e', '2018-06-06 15:42:06', '1');
INSERT INTO `sys_authorize` VALUES ('c1f826b1-637f-466f-9052-5f12faf31355', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', '48db9617-6973-4c29-a1e3-e30d28427a5d', '2018-06-06 15:42:06', '1');
INSERT INTO `sys_authorize` VALUES ('c431671a-1223-45d3-b85a-1f90f24c42aa', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', 'e6374a79-b71b-45b3-8d68-3b62bd16f1f1', '2018-06-06 15:42:06', '1');
INSERT INTO `sys_authorize` VALUES ('c569a271-2156-44b0-a468-6ca154875747', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', 'd4886c38-ef4a-492e-b3f3-8d4a501822da', '2018-06-06 15:42:05', '1');
INSERT INTO `sys_authorize` VALUES ('c6bc64c6-e928-40aa-b4f3-88db5f61dc45', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', '5fb96cfb-3e8c-4109-b3ad-3d38491cdc28', '2018-06-06 15:42:05', '1');
INSERT INTO `sys_authorize` VALUES ('c72fcdc2-bc1c-4427-abb2-4d29ee8963f8', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', '0b46f80d-a32d-4073-89fe-ef00928bc220', '2018-06-06 15:42:04', '1');
INSERT INTO `sys_authorize` VALUES ('c749dd59-cb41-4405-8823-124859d09424', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', '0428f3d5-a999-4863-aaaf-3fcf956d0d4b', '2018-06-06 15:42:05', '1');
INSERT INTO `sys_authorize` VALUES ('c76a5585-83de-4b79-a43f-7e9a0fd8c9a6', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', '53b0ed07-2aca-44cd-a450-8cf2ac18001a', '2018-06-06 15:42:05', '1');
INSERT INTO `sys_authorize` VALUES ('ca0d62a7-d55f-4d15-8eab-2d1965179e8b', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '2', 'c857cdae-f757-405b-9421-9eb5b8402b61', '2018-06-06 15:42:03', '1');
INSERT INTO `sys_authorize` VALUES ('cca475ad-3d69-440d-bd07-fa6462cac148', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '2', '11ef4bb4-83fc-4edc-900d-38cc299ce177', '2018-06-06 15:42:03', '1');
INSERT INTO `sys_authorize` VALUES ('ccb155b7-c093-4c5b-b4fd-2bcc42d22b33', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '2', '83473164-da08-4b05-bad0-e9a746729313', '2018-06-06 15:42:03', '1');
INSERT INTO `sys_authorize` VALUES ('ccc87e5d-7c98-4866-aebb-9f85afd4da19', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', '87608e05-a61d-44bc-a26f-a787f08eaf4c', '2018-06-06 15:42:06', '1');
INSERT INTO `sys_authorize` VALUES ('cd14a979-682b-4c5a-9d52-ad17ddec3c22', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', '0da3a005-37a1-4a74-b8e1-a0d0cbaea3bb', '2018-06-06 15:42:04', '1');
INSERT INTO `sys_authorize` VALUES ('d11c745c-f089-47da-8ee8-1c1dd1d86cfb', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', '2d0b9ad3-a079-46ab-a006-cf6c42136597', '2018-06-06 15:42:06', '1');
INSERT INTO `sys_authorize` VALUES ('d142b33a-5384-49bc-bc80-8a37848b3b91', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '1', '7710c52a-81f8-4a34-868e-9d9323cc2eb7', '2018-06-06 15:42:02', '1');
INSERT INTO `sys_authorize` VALUES ('d15f55a5-a55f-4d60-be08-c42ae5c074e8', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '1', '78403f1a-26bd-470e-b6e7-bbe6e1c0f541', '2018-06-06 15:42:03', '1');
INSERT INTO `sys_authorize` VALUES ('d470d13b-b82e-4495-bc1d-42a3ce19867c', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', '6eaa8d33-8351-4b5a-8617-e2906bab7c21', '2018-06-06 15:42:07', '1');
INSERT INTO `sys_authorize` VALUES ('d6afbab3-2ecd-487d-888e-cf2e2ec7f107', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '2', '3660c0b5-d807-4ba1-804b-f82c47455323', '2018-06-06 15:42:03', '1');
INSERT INTO `sys_authorize` VALUES ('d6dd1996-bc3e-4bad-827e-ae0c7d440961', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '1', 'f282bfe8-0eb9-4276-a57f-c290ec3cd775', '2018-06-06 15:42:03', '1');
INSERT INTO `sys_authorize` VALUES ('d71fe055-e048-49d1-b5c6-71998565811a', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '2', '850ee3ea-8bae-48bc-8cdb-5d175f83f094', '2018-06-06 15:42:03', '1');
INSERT INTO `sys_authorize` VALUES ('d7ebeda1-9ba3-4ab1-bda4-131970cf2935', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '2', '9b531a6f-567a-4ccb-8924-e8225113f913', '2018-06-06 15:42:03', '1');
INSERT INTO `sys_authorize` VALUES ('df200b68-9dfb-4ffb-86d0-a3beb88f1329', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '2', '314f53ee-4bda-4123-bd6c-55a7d149ff4f', '2018-06-06 15:42:03', '1');
INSERT INTO `sys_authorize` VALUES ('e111ceff-975c-412e-8014-9c2c9e9fa8a5', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', 'e6ad9827-5bb6-42b8-8974-12d8336013a1', '2018-06-06 15:42:06', '1');
INSERT INTO `sys_authorize` VALUES ('e25a686d-3e0c-480b-9356-687f56cb1798', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '2', 'e393d44f-6cd8-4f59-a173-0a05e0bee12d', '2018-06-06 15:42:04', '1');
INSERT INTO `sys_authorize` VALUES ('e2672786-cb07-49c1-81c0-4c00153deac7', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', 'a8977fe0-247f-4164-9157-740fb2e70fb0', '2018-06-06 15:42:06', '1');
INSERT INTO `sys_authorize` VALUES ('e4619394-10a2-408f-8779-ceb44aae17a6', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', '74fc6b03-5377-4a9f-b37b-f96965ee031d', '2018-06-06 15:42:05', '1');
INSERT INTO `sys_authorize` VALUES ('e4e1e680-d47e-45fc-ab6f-7b92db13dc13', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '2', 'd66c76d4-bd8c-4c97-a3ff-76ee586a8b88', '2018-06-06 15:42:04', '1');
INSERT INTO `sys_authorize` VALUES ('e6f0dc07-0234-4572-a7a6-1b452ff94513', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', '2d025db9-87f1-4108-9a48-2f1405b66172', '2018-06-06 15:42:05', '1');
INSERT INTO `sys_authorize` VALUES ('e923995c-d085-46b4-9fdd-76ec67fd4027', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', '71d8fc6e-2eac-42ce-9c34-34f4c98f59dc', '2018-06-06 15:42:06', '1');
INSERT INTO `sys_authorize` VALUES ('e997caa4-6d71-4bcd-86dd-f74df5f56f46', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '1', '12df9436-ce43-4920-9509-9b0b8e92ee9b', '2018-06-06 15:42:03', '1');
INSERT INTO `sys_authorize` VALUES ('ea63bb98-a6b3-4355-90ea-a91c1fd31e5f', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', 'bc84dbae-886b-4557-906e-cb59a8417090', '2018-06-06 15:42:06', '1');
INSERT INTO `sys_authorize` VALUES ('eaded87d-39b4-4d2e-8ee1-feac38573326', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', '0c895e09-7960-49b7-aa16-ec26262e61f9', '2018-06-06 15:42:07', '1');
INSERT INTO `sys_authorize` VALUES ('ede47f4b-c809-4cb5-836f-4677547dc8e8', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', 'd2c6600c-3067-4c1d-99e8-c53a5f5b21d1', '2018-06-06 15:42:06', '1');
INSERT INTO `sys_authorize` VALUES ('ee359db6-fa4f-4e9d-aeba-508537c50f57', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', '40228f8c-b6f4-4b89-b328-ab1729948df2', '2018-06-06 15:42:04', '1');
INSERT INTO `sys_authorize` VALUES ('eece3bff-32d1-40b6-8633-3d0897ca278b', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', '96c550c6-ffd6-4484-888d-0e16ce5a97b6', '2018-06-06 15:42:04', '1');
INSERT INTO `sys_authorize` VALUES ('f03bfad9-5ed0-47cb-b332-006fdf7af16b', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', '92d68406-9575-4e69-b977-693d722d4dba', '2018-06-06 15:42:05', '1');
INSERT INTO `sys_authorize` VALUES ('f509babd-242e-4660-843c-2c9aa60e916d', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '2', '4a9091b5-7edb-469d-a986-03802c30ee9a', '2018-06-06 15:42:04', '1');
INSERT INTO `sys_authorize` VALUES ('f7d35dbb-fed1-4c8a-b826-576ac575c1a4', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', '6b40a7bb-a9b1-4a36-8f40-c5bb358c6a55', '2018-06-06 15:42:05', '1');
INSERT INTO `sys_authorize` VALUES ('f8220968-2994-447f-83d8-8e857e2f11a6', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '2', '04221a9b-3e68-480a-b519-a0359239a16f', '2018-06-06 15:42:04', '1');
INSERT INTO `sys_authorize` VALUES ('f8282603-d32d-4d5c-8048-4fd9ae01fae5', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', 'dd8f1d55-ec78-4a25-9c82-8c16e3086911', '2018-06-06 15:42:07', '1');
INSERT INTO `sys_authorize` VALUES ('f95394e9-8647-4624-a053-1278ccf7deee', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '2', '98587953-afc8-43b7-94aa-e1694ffd90ba', '2018-06-06 15:42:04', '1');
INSERT INTO `sys_authorize` VALUES ('fc0194ad-d1ca-4db2-8b95-af1d4f2b49a5', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '2', 'dcf1948c-a7d0-4ab7-9603-efd1ffd1ce58', '2018-06-06 15:42:03', '1');
INSERT INTO `sys_authorize` VALUES ('fc1091bd-4a29-447c-9056-e3904bb95c6d', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', 'e6f2dbe9-af54-4df0-9186-363de1832837', '2018-06-06 15:42:05', '1');
INSERT INTO `sys_authorize` VALUES ('fc3c845c-e976-4e14-b843-5f519415a44e', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', '27fce9d6-0ee6-4c7d-85d1-0f8e010f6dd6', '2018-06-06 15:42:07', '1');
INSERT INTO `sys_authorize` VALUES ('fe064826-7cc6-4938-87c0-848b0600623f', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', 'fdfea16c-63d4-4428-8f62-6f858a34e9d5', '2018-06-06 15:42:07', '1');
INSERT INTO `sys_authorize` VALUES ('fe22dc4e-d32f-4ac6-8400-7b02a5918d99', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '2', 'fb657869-78ee-4e4d-b3ef-ac97596dfca5', '2018-06-06 15:42:03', '1');
INSERT INTO `sys_authorize` VALUES ('fe330fd0-12be-41d0-b5e2-e33723309f35', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '3', '077ebacb-c1c9-41ca-9373-de7e32389d46', '2018-06-06 15:42:06', '1');
INSERT INTO `sys_authorize` VALUES ('fe491308-fccb-4324-ab04-429d4c0d0310', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '2', 'f0234d76-208a-4d1c-81a1-0f22de8f41a4', '2018-06-06 15:42:04', '1');

-- ----------------------------
-- Table structure for `sys_daysum_diamond`
-- ----------------------------
DROP TABLE IF EXISTS `sys_daysum_diamond`;
CREATE TABLE `sys_daysum_diamond` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT '0' COMMENT '类别：1个人，2俱乐部',
  `typeId` int(11) DEFAULT '0' COMMENT '对象Id',
  `diamond` int(11) DEFAULT '0' COMMENT '钻石数量',
  `diamondType` int(11) DEFAULT '0' COMMENT '钻石类型:1消耗',
  `createTime` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `playSZ` int(11) DEFAULT NULL COMMENT '上庄消耗钻石数',
  `playGD` int(11) DEFAULT NULL COMMENT '固定消耗钻石数',
  `playZY` int(11) DEFAULT NULL COMMENT '自由消耗钻石数',
  `playMP` int(11) DEFAULT NULL COMMENT '明牌消耗钻石数',
  `playTB` int(11) DEFAULT NULL COMMENT '通比消耗钻石数',
  `playLZ` int(11) DEFAULT NULL COMMENT '轮庄消耗钻石数',
  `play10` int(11) DEFAULT NULL COMMENT '10局消耗钻石数',
  `play20` int(11) DEFAULT NULL COMMENT '20局消耗钻石数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_daysum_diamond
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `F_LogId` varchar(50) NOT NULL,
  `F_CategoryId` int(4) DEFAULT NULL COMMENT '分类Id 1-登陆2-访问3-操作4-异常',
  `F_OperateUserId` varchar(50) DEFAULT NULL COMMENT '操作用户Id',
  `F_OperateTime` datetime DEFAULT NULL COMMENT '操作时间',
  `F_OperateAccount` varchar(50) DEFAULT NULL COMMENT '操作用户',
  `F_OperateTypeId` varchar(50) DEFAULT NULL COMMENT '操作类型Id',
  `F_OperateType` varchar(50) DEFAULT NULL COMMENT '操作类型',
  `F_Module` varchar(50) DEFAULT NULL COMMENT '系统功能',
  `F_IPAddress` varchar(50) DEFAULT NULL COMMENT 'IP地址',
  `F_Host` varchar(50) DEFAULT NULL COMMENT '主机',
  `F_Browser` varchar(50) DEFAULT NULL COMMENT '浏览器',
  `F_ExecuteResult` int(4) DEFAULT NULL COMMENT '执行结果状态',
  `F_ExecuteResultJson` varchar(2000) DEFAULT NULL COMMENT '执行结果信息',
  `F_DeleteMark` bigint(2) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`F_LogId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('39680b57-04c7-4ef5-9fc4-99c866f128ca', '2', '1', '2018-06-06 15:46:05', 'admin(超级管理员)', '3', '访问', '功能管理', '192.168.0.157', '192.168.0.157', 'Chrome_65.0', '1', '访问地址：/SystemModule/Module/Index', '0');
INSERT INTO `sys_log` VALUES ('d798f691-c25d-4919-9422-b907cf7a8d19', '2', '1', '2018-06-06 15:41:30', 'admin(超级管理员)', '3', '访问', '角色管理', '::1', 'localhost', 'Chrome_65.0', '1', '访问地址：/SystemModule/Role/Index', '0');
INSERT INTO `sys_log` VALUES ('f2d1775e-442b-46b6-acc3-7f7618744cad', '2', '1', '2018-06-06 15:46:05', 'admin(超级管理员)', '3', '访问', '功能管理', '192.168.0.157', '192.168.0.157', 'Chrome_65.0', '1', '访问地址：/SystemModule/Module/Index', '0');

-- ----------------------------
-- Table structure for `sys_loginlog`
-- ----------------------------
DROP TABLE IF EXISTS `sys_loginlog`;
CREATE TABLE `sys_loginlog` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键Id，自增',
  `UserId` int(11) NOT NULL COMMENT '系统用户Id',
  `IPAddress` varchar(20) DEFAULT '' COMMENT 'IP地址',
  `LoginGuid` varchar(100) DEFAULT '' COMMENT '登录唯一标识',
  `BrowserType` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `CreateDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `ModifyDate` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='登录日志表';

-- ----------------------------
-- Records of sys_loginlog
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `F_ModuleId` varchar(50) NOT NULL COMMENT '功能主键',
  `F_ParentId` varchar(50) NOT NULL DEFAULT '' COMMENT '父级主键',
  `F_EnCode` varchar(50) DEFAULT NULL COMMENT '编码',
  `F_FullName` varchar(50) DEFAULT NULL COMMENT '名称',
  `F_Icon` varchar(50) DEFAULT NULL COMMENT '图标',
  `F_UrlAddress` varchar(200) DEFAULT NULL COMMENT '导航地址',
  `F_Target` varchar(20) DEFAULT NULL COMMENT '导航目标',
  `F_IsMenu` int(11) NOT NULL DEFAULT '1' COMMENT '菜单选项',
  `F_AllowExpand` int(11) DEFAULT '1' COMMENT '允许展开',
  `F_IsPublic` int(11) DEFAULT '1' COMMENT '是否公开',
  `F_AllowEdit` int(11) DEFAULT '1' COMMENT '允许编辑',
  `F_AllowDelete` int(11) DEFAULT '1' COMMENT '允许删除',
  `F_SortCode` int(11) DEFAULT NULL COMMENT '排序码',
  `F_DeleteMark` int(11) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `F_EnabledMark` int(11) NOT NULL DEFAULT '1' COMMENT '有效标志',
  `F_Description` varchar(200) DEFAULT NULL COMMENT '备注',
  `F_CreateDate` timestamp NULL DEFAULT NULL COMMENT '创建日期',
  `F_CreateUserId` varchar(50) DEFAULT NULL COMMENT '创建用户主键',
  `F_CreateUserName` varchar(50) DEFAULT NULL COMMENT '创建用户',
  `F_ModifyDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改日期',
  `F_ModifyUserId` varchar(50) DEFAULT NULL COMMENT '修改用户主键',
  `F_ModifyUserName` varchar(50) DEFAULT NULL COMMENT '修改用户',
  PRIMARY KEY (`F_ModuleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统功能表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('0e4fb492-a8a2-495a-bad1-8f3a03ab0112', '7', 'SectionConfig', '折扣区间配置', 'fa fa-database', '/GameConfig/SectionConfig/Index', 'iframe', '1', '1', '0', null, null, '5', '0', '1', '钻石换人民币 的  折扣区间配置', '2018-05-29 14:43:22', '1', 'admin', '2018-06-06 12:57:48', '1', 'admin');
INSERT INTO `sys_menu` VALUES ('1', '0', 'SysManage', '用户管理', 'fa fa-vcard', '', 'expand', '1', '1', '1', null, null, '1', '0', '1', '', null, null, null, '2017-12-01 11:07:54', '1', 'admin');
INSERT INTO `sys_menu` VALUES ('10', '0', 'SystemManage', '系统管理', 'fa fa-cogs', '', 'expand', '1', '1', '1', null, null, '5', '0', '1', '', null, null, null, '2018-03-27 17:48:07', '1', 'admin');
INSERT INTO `sys_menu` VALUES ('11', '10', 'SystemUser', '系统用户', 'fa fa-user-o', '/SystemModule/SysUser/Index', 'iframe', '1', '1', '1', null, null, '1', '0', '1', '', null, null, null, '2018-06-06 14:44:16', '1', 'admin');
INSERT INTO `sys_menu` VALUES ('12', '10', 'RoleManage', '角色管理', 'fa fa-users', '/SystemModule/Role/Index', 'iframe', '1', '1', '1', null, null, '2', '0', '1', '', null, null, null, '2018-06-06 14:50:02', '1', 'admin');
INSERT INTO `sys_menu` VALUES ('12df9436-ce43-4920-9509-9b0b8e92ee9b', '7', 'Placardset', '大厅公告', 'fa fa-bullhorn', '/GameConfig/Placardset/Index', 'iframe', '1', '0', '0', null, null, '0', '0', '1', '', '2018-01-29 15:13:22', '1', 'admin', '2018-01-29 15:13:42', '1', 'admin');
INSERT INTO `sys_menu` VALUES ('13', '10', 'MenuManage', '功能管理', 'fa fa-th-large', '/SystemModule/Module/Index', 'iframe', '1', '1', '1', null, null, '3', '0', '1', '', null, null, null, '2018-06-06 14:53:55', '1', 'admin');
INSERT INTO `sys_menu` VALUES ('2', '1', 'UserManage', '玩家信息', 'fa fa-user', '/User/User/Index', 'iframe', '1', '1', '1', null, null, '1', '0', '1', '', null, null, null, '2018-06-06 11:59:54', '1', 'admin');
INSERT INTO `sys_menu` VALUES ('2cdeb781-d715-4566-9533-755eaa32d20f', '10', 'LogManage', '日志记录', 'fa fa-file-text-o', '/Log/Index', 'iframe', '1', '1', '1', null, null, '4', '0', '1', '', '2017-12-04 15:25:14', '1', 'admin', '2018-06-06 15:00:01', '1', 'admin');
INSERT INTO `sys_menu` VALUES ('3', '0', 'ReportManage', '数据统计', 'fa fa-area-chart', '', 'expand', '1', '1', '1', null, null, '3', '0', '1', '', null, null, null, '2018-01-31 17:43:57', '1', 'admin');
INSERT INTO `sys_menu` VALUES ('4', '3', 'NewUserStatistics', '新增统计', 'fa fa-list-alt', '/DataStatistics/NewUser/Index', 'iframe', '1', '1', '1', null, null, '1', '0', '1', '', null, null, null, '2018-06-06 12:40:12', '1', 'admin');
INSERT INTO `sys_menu` VALUES ('40858e35-67e2-40f3-836f-0d699b711847', '40a688a7-5e4a-497d-94f0-0c7c09a12b10', 'Club_List', '俱乐部列表', 'fa fa-vcard-o', '/ClubModule/Club/Index', 'iframe', '1', '0', '1', null, null, '1', '0', '1', '', '2018-01-24 17:46:39', '1', 'admin', '2018-06-06 12:26:45', '1', 'admin');
INSERT INTO `sys_menu` VALUES ('40a688a7-5e4a-497d-94f0-0c7c09a12b10', '0', 'Club_manager', '俱乐部管理', 'fa fa-users', '', 'expand', '1', '1', '1', null, null, '2', '0', '1', '', '2018-01-24 17:38:26', '1', 'admin', '2018-01-31 17:43:10', '1', 'admin');
INSERT INTO `sys_menu` VALUES ('4b55d173-3c8d-4147-8bcc-df38d3125119', 'f282bfe8-0eb9-4276-a57f-c290ec3cd775', 'DiamondLog', '钻石记录', '', '/DataLog/Diamond/DiamondLog', 'iframe', '1', '0', '0', null, null, '1', '0', '1', '', '2018-05-23 11:31:13', '1', 'admin', '2018-06-06 12:50:52', '1', 'admin');
INSERT INTO `sys_menu` VALUES ('5', '3', 'OnlineNumber', '在线人数', 'fa fa-user', '/DataStatistics/NiuN/Index', 'iframe', '1', '1', '1', null, null, '2', '0', '1', '', null, null, null, '2018-06-06 12:46:40', '1', 'admin');
INSERT INTO `sys_menu` VALUES ('512a1f98-d23b-4691-9313-b3452b88f6d0', '7', 'platformdomain', '平台域名', 'fa fa-bookmark-o', '/GameConfig/PlatFormDomain/Index', 'iframe', '1', '0', '0', null, null, '3', '0', '1', '', '2018-05-11 14:30:21', '1', 'admin', '2018-06-06 12:54:58', '1', 'admin');
INSERT INTO `sys_menu` VALUES ('5f060855-48f2-42bb-8cc2-213f35e276c8', '40a688a7-5e4a-497d-94f0-0c7c09a12b10', 'ClubConfig', '俱乐部设置', 'fa fa-file-excel-o', '/ClubModule/Club/SetConfig', 'iframe', '1', '0', '1', null, null, '3', '0', '1', '', '2018-03-19 10:25:04', '1', 'admin', '2018-03-19 10:31:48', '1', 'admin');
INSERT INTO `sys_menu` VALUES ('6', '3', 'DayStatistics', '每天统计', 'fa fa-list-alt', '/DataStatistics/NiuN/DayIndex', 'iframe', '1', '1', '1', null, null, '2', '0', '1', '', null, null, null, '2018-06-06 12:48:16', '1', 'admin');
INSERT INTO `sys_menu` VALUES ('7', '0', 'GameConfigManage', '游戏配置', 'fa fa-send-o', '', 'expand', '1', '1', '1', null, null, '5', '0', '1', '', null, null, null, '2018-05-23 10:12:21', '1', 'admin');
INSERT INTO `sys_menu` VALUES ('7710c52a-81f8-4a34-868e-9d9323cc2eb7', '40a688a7-5e4a-497d-94f0-0c7c09a12b10', 'AgentManage', '代理管理', 'fa fa-free-code-camp', '/ClubModule/Agent/Index', 'iframe', '1', '0', '1', null, null, '2', '0', '1', '', '2018-03-16 09:57:21', '1', 'admin', '2018-06-06 15:21:45', '1', 'admin');
INSERT INTO `sys_menu` VALUES ('78403f1a-26bd-470e-b6e7-bbe6e1c0f541', '7', 'FieldConfig', '公共俱乐部配置', 'fa fa-cog', '/GameConfig/ClubConfig/index', 'iframe', '1', '1', '0', null, null, '4', '0', '1', '公共俱乐部配置 ：场次 最低带入 低分 倍率 状态', '2018-05-23 15:32:23', '1', 'admin', '2018-06-06 12:56:59', '1', 'admin');
INSERT INTO `sys_menu` VALUES ('8', '7', 'ActivityConfig', '活动配置', 'fa fa-cogs', '/GameConfig/Activiset/Index', 'iframe', '1', '1', '1', null, null, '1', '0', '1', '', null, null, null, '2018-06-06 12:53:10', '1', 'admin');
INSERT INTO `sys_menu` VALUES ('9', '3', 'DiamondStatistics', '钻石统计', 'fa fa-diamond', '/DataStatistics/Diamond/Index', 'iframe', '1', '1', '1', null, null, '3', '0', '1', '', null, null, null, '2018-06-06 12:45:12', '1', 'admin');
INSERT INTO `sys_menu` VALUES ('ae7e944f-2fbd-407f-aa38-a5f3a40798b9', '7', 'payConfig', '支付配置', 'fa fa-cny', '/GameConfig/PayConfig/Index', 'iframe', '1', '0', '0', null, null, '6', '0', '1', '', '2018-06-01 15:42:43', '1', 'admin', '2018-06-06 12:59:58', '1', 'admin');
INSERT INTO `sys_menu` VALUES ('f282bfe8-0eb9-4276-a57f-c290ec3cd775', '0', 'DataLog', '数据记录', 'fa fa-file-text-o', '', 'expand', '1', '1', '0', null, null, '4', '0', '1', '', '2018-05-23 10:11:27', '1', 'admin', '2018-05-23 10:12:16', '1', 'admin');

-- ----------------------------
-- Table structure for `sys_modulebutton`
-- ----------------------------
DROP TABLE IF EXISTS `sys_modulebutton`;
CREATE TABLE `sys_modulebutton` (
  `ModuleButtonId` varchar(50) NOT NULL,
  `ModuleId` varchar(50) DEFAULT NULL,
  `ParentId` varchar(50) DEFAULT NULL,
  `Icon` varchar(50) DEFAULT NULL,
  `EnCode` varchar(50) DEFAULT NULL,
  `FullName` varchar(50) DEFAULT NULL COMMENT '名称',
  `ActionAddress` varchar(200) DEFAULT NULL COMMENT 'Action地址',
  `SortCode` int(11) DEFAULT NULL,
  PRIMARY KEY (`ModuleButtonId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_modulebutton
-- ----------------------------
INSERT INTO `sys_modulebutton` VALUES ('04221a9b-3e68-480a-b519-a0359239a16f', '12', '0', null, 'll_appfilter', '访问过滤', '', '5');
INSERT INTO `sys_modulebutton` VALUES ('04442294-3e1b-4312-be91-e15251c47f19', '2', '0', null, 'll_playlog', '查询ID/战绩', '', '1');
INSERT INTO `sys_modulebutton` VALUES ('0a5e2a9d-0152-443b-9831-9c514447aef7', '7710c52a-81f8-4a34-868e-9d9323cc2eb7', '0', null, 'll_more', '更多', '', '2');
INSERT INTO `sys_modulebutton` VALUES ('0d4f174d-a2e2-466b-b660-f481d2972752', '11', '0', null, 'll_disabled', '禁用账户', '', '1');
INSERT INTO `sys_modulebutton` VALUES ('10f5fb95-b07d-4db2-8189-b06ebacd0cf3', '0e4fb492-a8a2-495a-bad1-8f3a03ab0112', '0', null, 'll_Edit', '编辑', '', '1');
INSERT INTO `sys_modulebutton` VALUES ('11ef4bb4-83fc-4edc-900d-38cc299ce177', '40858e35-67e2-40f3-836f-0d699b711847', '0', null, 'll_more', '更多', '', '2');
INSERT INTO `sys_modulebutton` VALUES ('1ce54d69-6fa8-4b30-9c64-528d8f8012a6', '7710c52a-81f8-4a34-868e-9d9323cc2eb7', '0', null, 'll_higherDetails', '上级代理', '', '3');
INSERT INTO `sys_modulebutton` VALUES ('22a9404e-e44c-4af8-aee7-53fbbf00adc2', '2cdeb781-d715-4566-9533-755eaa32d20f', '0', null, 'lr_removelog', '清空', '', '2');
INSERT INTO `sys_modulebutton` VALUES ('2a50c5f5-5210-479e-9ba5-c97c221b4a59', '40858e35-67e2-40f3-836f-0d699b711847', '0', null, 'll_rmCoin', '减少金币', '', '5');
INSERT INTO `sys_modulebutton` VALUES ('2d10c709-03b0-4fde-b1af-dbf4aad1f79e', '40858e35-67e2-40f3-836f-0d699b711847', '0', null, 'll_addCoin', '增加金币', '', '4');
INSERT INTO `sys_modulebutton` VALUES ('314f53ee-4bda-4123-bd6c-55a7d149ff4f', '78403f1a-26bd-470e-b6e7-bbe6e1c0f541', '0', null, 'll_Edit', '修改', '', '1');
INSERT INTO `sys_modulebutton` VALUES ('3596504b-c79f-49f2-a624-c05fee15a1d2', '12', '0', null, 'll_authorize', '功能授权', '', '4');
INSERT INTO `sys_modulebutton` VALUES ('3602a672-8126-4fe9-895d-4d89f2592304', '40858e35-67e2-40f3-836f-0d699b711847', '0', null, 'll_details', '成员详情', '', '1');
INSERT INTO `sys_modulebutton` VALUES ('3660c0b5-d807-4ba1-804b-f82c47455323', '2', '0', null, 'll_disabled', '禁用账户', '', '2');
INSERT INTO `sys_modulebutton` VALUES ('46688b17-c465-40c7-967e-21f95be7211c', '13', '0', null, 'll_delete', '删除', '', '3');
INSERT INTO `sys_modulebutton` VALUES ('4a9091b5-7edb-469d-a986-03802c30ee9a', '2cdeb781-d715-4566-9533-755eaa32d20f', '0', null, 'lr_detail', '详细', '', '1');
INSERT INTO `sys_modulebutton` VALUES ('4ce90bc7-3219-42d9-a85a-8148e8c858d7', '11', '0', null, 'll_more', '更多', '', '2');
INSERT INTO `sys_modulebutton` VALUES ('59efb3ec-4794-44dd-acd0-3e48531cc65d', '12', '0', null, 'll_memberadd', '添加成员', '', '1');
INSERT INTO `sys_modulebutton` VALUES ('61e09ebf-8516-4688-a8d7-75e78e7a00ac', '7710c52a-81f8-4a34-868e-9d9323cc2eb7', '0', null, 'll_enabled', '启用账户', '', '1');
INSERT INTO `sys_modulebutton` VALUES ('63ac3e88-d2de-4888-a933-9a103d263252', '12', '0', null, 'll_delete', '删除', '', '3');
INSERT INTO `sys_modulebutton` VALUES ('66d3dc67-8e7e-4a3c-ae6d-04f184498dce', '12', '0', null, 'll_timefilter', '时段过滤', '', '2');
INSERT INTO `sys_modulebutton` VALUES ('6d18b63a-6067-41ed-bf0b-78e4534dfb45', '2', '0', null, 'll_more', '更多', '', '3');
INSERT INTO `sys_modulebutton` VALUES ('82abd2f5-d5fd-4a72-8162-58cd69b7f391', '512a1f98-d23b-4691-9313-b3452b88f6d0', '0', null, 'll_delete', '删除', '', '2');
INSERT INTO `sys_modulebutton` VALUES ('83473164-da08-4b05-bad0-e9a746729313', '7710c52a-81f8-4a34-868e-9d9323cc2eb7', '0', null, 'll_loweragent', '下级代理', '', '1');
INSERT INTO `sys_modulebutton` VALUES ('850ee3ea-8bae-48bc-8cdb-5d175f83f094', '40858e35-67e2-40f3-836f-0d699b711847', '0', null, 'll_clubgamelist', '战绩列表', '', '1');
INSERT INTO `sys_modulebutton` VALUES ('8dd8b80e-f7fb-405d-b3fa-61bd5f0d12d1', 'ae7e944f-2fbd-407f-aa38-a5f3a40798b9', '0', null, 'll_Edit', '修改', '', '1');
INSERT INTO `sys_modulebutton` VALUES ('98587953-afc8-43b7-94aa-e1694ffd90ba', '0e4fb492-a8a2-495a-bad1-8f3a03ab0112', '0', null, 'll_save', '保存', '', '2');
INSERT INTO `sys_modulebutton` VALUES ('9a4a830b-c8f2-45dd-aac7-936f78002644', '12', '0', null, 'll_memberlook', '查看成员', '', '2');
INSERT INTO `sys_modulebutton` VALUES ('9abcc413-3aef-46ec-88da-e73b35f68d09', '7710c52a-81f8-4a34-868e-9d9323cc2eb7', '0', null, 'll_cancel', '取消代理', '', '4');
INSERT INTO `sys_modulebutton` VALUES ('9b531a6f-567a-4ccb-8924-e8225113f913', '2', '0', null, 'll_chargebuckle', '充/扣钻石', '', '2');
INSERT INTO `sys_modulebutton` VALUES ('9f44ed9b-3260-4324-aa89-343f9f9bf47b', '12', '0', null, 'll_ipfilter', 'IP过滤', '', '1');
INSERT INTO `sys_modulebutton` VALUES ('a7d4ed32-469c-4ae4-9cf1-19caf28683bc', '12', '0', null, 'll_add', '新增', '', '1');
INSERT INTO `sys_modulebutton` VALUES ('a94f0f93-da21-4b34-bef5-3851de07370e', '40858e35-67e2-40f3-836f-0d699b711847', '0', null, 'll_editdiamond', '更新扣钻比', '', '3');
INSERT INTO `sys_modulebutton` VALUES ('b6aee85c-111c-4ba8-b9d1-4dfeeb753e00', '2', '0', null, 'll_enabled', '启用账户', '', '1');
INSERT INTO `sys_modulebutton` VALUES ('c126315a-39e7-44e0-aa22-58e79e0242ff', '11', '0', null, 'll_add', '新增', '', '1');
INSERT INTO `sys_modulebutton` VALUES ('c857cdae-f757-405b-9421-9eb5b8402b61', '512a1f98-d23b-4691-9313-b3452b88f6d0', '0', null, 'll_Edit', '新增', '', '1');
INSERT INTO `sys_modulebutton` VALUES ('d1e4f9be-1df9-4d36-b1fd-ea58b6fb13d4', '11', '0', null, 'll_resetpassword', '重置密码', '', '3');
INSERT INTO `sys_modulebutton` VALUES ('d66c76d4-bd8c-4c97-a3ff-76ee586a8b88', '12', '0', null, 'll_edit', '编辑', '', '2');
INSERT INTO `sys_modulebutton` VALUES ('d7be5328-1af6-4f17-8cb0-76f547c58678', '12', '0', null, 'll_more', '更多', '', '4');
INSERT INTO `sys_modulebutton` VALUES ('dcf1948c-a7d0-4ab7-9603-efd1ffd1ce58', '7710c52a-81f8-4a34-868e-9d9323cc2eb7', '0', null, 'll_disabled', '禁用账户', '', '2');
INSERT INTO `sys_modulebutton` VALUES ('e393d44f-6cd8-4f59-a173-0a05e0bee12d', '11', '0', null, 'll_authorize', '功能授权', '', '4');
INSERT INTO `sys_modulebutton` VALUES ('e88f94fc-a17f-4c88-9b7d-5d0f565e9cb5', '13', '0', null, 'll_add', '新增', '', '1');
INSERT INTO `sys_modulebutton` VALUES ('f0234d76-208a-4d1c-81a1-0f22de8f41a4', '13', '0', null, 'll_edit', '编辑', '', '2');
INSERT INTO `sys_modulebutton` VALUES ('f2f968bd-ed84-4288-b48a-532a3f629966', '11', '0', null, 'll_enabled', '启用账户', '', '2');
INSERT INTO `sys_modulebutton` VALUES ('fb657869-78ee-4e4d-b3ef-ac97596dfca5', '40858e35-67e2-40f3-836f-0d699b711847', '0', null, 'll_consumption', '消耗详情', '', '3');

-- ----------------------------
-- Table structure for `sys_modulecolumn`
-- ----------------------------
DROP TABLE IF EXISTS `sys_modulecolumn`;
CREATE TABLE `sys_modulecolumn` (
  `ModuleColumnId` varchar(50) NOT NULL,
  `ModuleId` varchar(50) DEFAULT NULL COMMENT '功能主键',
  `ParentId` varchar(50) DEFAULT NULL COMMENT '父级主键',
  `EnCode` varchar(50) DEFAULT NULL COMMENT '编码',
  `FullName` varchar(50) DEFAULT NULL COMMENT '名称',
  `SortCode` int(11) DEFAULT NULL COMMENT '排序码',
  `Description` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ModuleColumnId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_modulecolumn
-- ----------------------------
INSERT INTO `sys_modulecolumn` VALUES ('0428f3d5-a999-4863-aaaf-3fcf956d0d4b', '7710c52a-81f8-4a34-868e-9d9323cc2eb7', null, 'TodayUserDiamond', '今日用户充值金额', '11', '');
INSERT INTO `sys_modulecolumn` VALUES ('0502e7c3-7f92-4005-8289-f03293974bc5', '2cdeb781-d715-4566-9533-755eaa32d20f', null, 'F_ExecuteResult', '执行结果', '6', '');
INSERT INTO `sys_modulecolumn` VALUES ('0633a215-92f3-4463-9e19-bcad41f304b7', 'ae7e944f-2fbd-407f-aa38-a5f3a40798b9', null, 'payName', '支付方式', '1', '');
INSERT INTO `sys_modulecolumn` VALUES ('066eba8c-28f2-4d0e-b70e-9f6cb56fc244', '13', null, 'F_Description', '描述', '9', '');
INSERT INTO `sys_modulecolumn` VALUES ('077ebacb-c1c9-41ca-9373-de7e32389d46', '4b55d173-3c8d-4147-8bcc-df38d3125119', null, 'nickName', '用户', '1', '');
INSERT INTO `sys_modulecolumn` VALUES ('08039d5f-43e5-408b-bbde-6709df8180e7', '13', null, 'F_AllowExpand', '展开', '6', '');
INSERT INTO `sys_modulecolumn` VALUES ('0b46f80d-a32d-4073-89fe-ef00928bc220', '2', null, 'isFrozen', '是否冻结', '6', '');
INSERT INTO `sys_modulecolumn` VALUES ('0c895e09-7960-49b7-aa16-ec26262e61f9', '2cdeb781-d715-4566-9533-755eaa32d20f', null, 'F_Module', '系统功能', '4', '');
INSERT INTO `sys_modulecolumn` VALUES ('0da3a005-37a1-4a74-b8e1-a0d0cbaea3bb', '2', null, 'registerTime', '注册时间', '10', '');
INSERT INTO `sys_modulecolumn` VALUES ('0f55821c-bb59-4a23-ad05-a2933b905d6b', '40858e35-67e2-40f3-836f-0d699b711847', null, 'city', '所属城市', '3', '');
INSERT INTO `sys_modulecolumn` VALUES ('0fe14d98-e73b-4c36-860c-b4e2946387c3', '7710c52a-81f8-4a34-868e-9d9323cc2eb7', null, 'TodayCos', '今日消耗钻石-个人', '9', '');
INSERT INTO `sys_modulecolumn` VALUES ('17219ee9-efea-4336-a67c-313cfa759637', '12', null, 'F_FullName', '角色名称', '2', '');
INSERT INTO `sys_modulecolumn` VALUES ('1a85c975-a49d-4fc4-8606-e20e358c40ca', '5', null, 'onlineCount', '在线人数', '2', '');
INSERT INTO `sys_modulecolumn` VALUES ('1d14b529-ad80-466c-baf3-173854ff0452', '2', null, 'nickName', '玩家称呼', '1', '');
INSERT INTO `sys_modulecolumn` VALUES ('20873d37-2378-49c6-acdd-79e811d7ef2d', '13', null, 'F_EnabledMark', '有效', '8', '');
INSERT INTO `sys_modulecolumn` VALUES ('208f9f5d-3dd0-4bd0-8cd2-04c407305eea', '2', null, 'isProxy', '是否代理', '7', '');
INSERT INTO `sys_modulecolumn` VALUES ('22823660-93ec-4678-8d50-f3a42279b0eb', '40858e35-67e2-40f3-836f-0d699b711847', null, 'coinPoolStr', '金币池', '7', '');
INSERT INTO `sys_modulecolumn` VALUES ('26b01428-bcc1-4c2d-b1b0-37a95e24f7ad', '78403f1a-26bd-470e-b6e7-bbe6e1c0f541', null, 'rate', '倍率', '4', '');
INSERT INTO `sys_modulecolumn` VALUES ('27fce9d6-0ee6-4c7d-85d1-0f8e010f6dd6', '13', null, 'F_IsMenu', '菜单', '5', '');
INSERT INTO `sys_modulecolumn` VALUES ('2d025db9-87f1-4108-9a48-2f1405b66172', '2', null, 'loginAddress', '登录的地理位置', '12', '');
INSERT INTO `sys_modulecolumn` VALUES ('2d0b9ad3-a079-46ab-a006-cf6c42136597', '512a1f98-d23b-4691-9313-b3452b88f6d0', null, 'createtime', '创建时间', '3', '');
INSERT INTO `sys_modulecolumn` VALUES ('2d1fbbd6-9fd9-49cf-aedd-a5ab174ab86f', 'ae7e944f-2fbd-407f-aa38-a5f3a40798b9', null, 'createtime', '初始时间', '8', '');
INSERT INTO `sys_modulecolumn` VALUES ('3093ac78-9445-480d-adfa-5b49314c41f3', '12', null, 'F_CreateUserName', '创建人', '4', '');
INSERT INTO `sys_modulecolumn` VALUES ('31df621f-9cba-41fa-9ad9-3bb8067afd2b', '11', null, 'UserType', '管理类型', '3', '');
INSERT INTO `sys_modulecolumn` VALUES ('3f3b7d43-88a8-4eda-a6d4-f38aa3cf8178', 'ae7e944f-2fbd-407f-aa38-a5f3a40798b9', null, 'status', '状态', '5', '');
INSERT INTO `sys_modulecolumn` VALUES ('40228f8c-b6f4-4b89-b328-ab1729948df2', '2', null, 'phoneNum', '玩家账号', '2', '');
INSERT INTO `sys_modulecolumn` VALUES ('48db9617-6973-4c29-a1e3-e30d28427a5d', '11', null, 'RegistIP', '注册IP', '4', '');
INSERT INTO `sys_modulecolumn` VALUES ('4ca190f2-c4bc-45a0-960a-0eb8e11440b4', '12', null, 'F_CreateDate', '创建时间', '3', '');
INSERT INTO `sys_modulecolumn` VALUES ('4dc2866d-de01-497e-8df2-e8890f9145d0', '2', null, 'registerIp', '注册IP', '11', '');
INSERT INTO `sys_modulecolumn` VALUES ('5001806f-556f-486d-b3d6-5d9a885d2655', '2', null, 'diamond', '钻石数量', '4', '');
INSERT INTO `sys_modulecolumn` VALUES ('53b0ed07-2aca-44cd-a450-8cf2ac18001a', '7710c52a-81f8-4a34-868e-9d9323cc2eb7', null, 'userId', '游戏ID', '1', '');
INSERT INTO `sys_modulecolumn` VALUES ('546ead4f-2f5c-4f55-a1f1-3fe5a07829fe', '78403f1a-26bd-470e-b6e7-bbe6e1c0f541', null, 'min_bet', '底分值', '3', '');
INSERT INTO `sys_modulecolumn` VALUES ('58963e11-9928-44e5-a6f4-682aaa030754', '7710c52a-81f8-4a34-868e-9d9323cc2eb7', null, 'TodayClubCos', '今日消耗钻石-俱乐部', '8', '');
INSERT INTO `sys_modulecolumn` VALUES ('58ce030d-cec1-4b45-bff0-d599381e5040', '40858e35-67e2-40f3-836f-0d699b711847', null, 'diamondPercent', '扣钻百分比', '5', '');
INSERT INTO `sys_modulecolumn` VALUES ('59923007-6bcc-4d9a-b491-a67eb3c3cc43', 'ae7e944f-2fbd-407f-aa38-a5f3a40798b9', null, 'payType', '支付类型', '2', '');
INSERT INTO `sys_modulecolumn` VALUES ('5de95520-883c-46d1-b4ce-fdd0b483e14d', '5', null, 'updateTime', '时间', '1', '');
INSERT INTO `sys_modulecolumn` VALUES ('5fb96cfb-3e8c-4109-b3ad-3d38491cdc28', '7710c52a-81f8-4a34-868e-9d9323cc2eb7', null, 'UserDiamond', '用户充值', '12', '');
INSERT INTO `sys_modulecolumn` VALUES ('644e08af-3f08-47f1-a198-45962351f851', '13', null, 'F_IsPublic', '公共', '7', '');
INSERT INTO `sys_modulecolumn` VALUES ('6609dbba-99b7-4aa0-a5bb-ee514fe9bdd6', '11', null, 'CreateDate', '注册时间', '5', '');
INSERT INTO `sys_modulecolumn` VALUES ('68baadb0-f065-4282-a7bc-835458a4a3ee', '40858e35-67e2-40f3-836f-0d699b711847', null, 'createTime', '创建时间', '8', '');
INSERT INTO `sys_modulecolumn` VALUES ('6b40a7bb-a9b1-4a36-8f40-c5bb358c6a55', '40858e35-67e2-40f3-836f-0d699b711847', null, 'scorePoolStr', '积分池', '6', '');
INSERT INTO `sys_modulecolumn` VALUES ('6eaa8d33-8351-4b5a-8617-e2906bab7c21', '2cdeb781-d715-4566-9533-755eaa32d20f', null, 'F_OperateType', '操作类型', '5', '');
INSERT INTO `sys_modulecolumn` VALUES ('71d8fc6e-2eac-42ce-9c34-34f4c98f59dc', '9', null, 'time', '日期', '1', '');
INSERT INTO `sys_modulecolumn` VALUES ('74fc6b03-5377-4a9f-b37b-f96965ee031d', '6', null, 'userNumber', '有效人数', '2', '');
INSERT INTO `sys_modulecolumn` VALUES ('754fef69-aefc-43b8-a526-50bab5daa7f3', 'ae7e944f-2fbd-407f-aa38-a5f3a40798b9', null, 'maxMoney', '最大金额', '4', '');
INSERT INTO `sys_modulecolumn` VALUES ('7842e3cc-f6b3-4067-b70a-46059a670a6e', '4b55d173-3c8d-4147-8bcc-df38d3125119', null, 'changedTypeStr', '类型', '2', '');
INSERT INTO `sys_modulecolumn` VALUES ('78f1c959-376f-4673-9b9a-fd2f774d3358', '6', null, 'diamondNumber', '钻石消耗总数', '5', '');
INSERT INTO `sys_modulecolumn` VALUES ('7adb20ba-7451-4e80-b7ef-b822406ebd78', '4b55d173-3c8d-4147-8bcc-df38d3125119', null, 'changedDiamond', '钻石数', '3', '');
INSERT INTO `sys_modulecolumn` VALUES ('7b995852-7b21-417b-87ff-7a485ab70722', '6', null, 'time', '时间', '1', '');
INSERT INTO `sys_modulecolumn` VALUES ('808c6092-51da-467e-9622-74bd517e9e7c', 'ae7e944f-2fbd-407f-aa38-a5f3a40798b9', null, 'sort', '顺序', '6', '');
INSERT INTO `sys_modulecolumn` VALUES ('845cef33-3bf4-4121-b276-04d9b28a8861', '78403f1a-26bd-470e-b6e7-bbe6e1c0f541', null, 'isOpen', '状态', '5', '');
INSERT INTO `sys_modulecolumn` VALUES ('87608e05-a61d-44bc-a26f-a787f08eaf4c', '8', null, 'typeName', '活动名称', '1', '');
INSERT INTO `sys_modulecolumn` VALUES ('8883cd0e-8911-4b85-a75c-32bfcc3d38ed', '7710c52a-81f8-4a34-868e-9d9323cc2eb7', null, 'createTime', '代理时间', '14', '');
INSERT INTO `sys_modulecolumn` VALUES ('89db0190-3400-4441-ad6b-b265141ae6ec', '2cdeb781-d715-4566-9533-755eaa32d20f', null, 'F_OperateTime', '操作时间', '1', '');
INSERT INTO `sys_modulecolumn` VALUES ('92d68406-9575-4e69-b977-693d722d4dba', '7710c52a-81f8-4a34-868e-9d9323cc2eb7', null, 'phoneNum', '手机', '4', '');
INSERT INTO `sys_modulecolumn` VALUES ('930cb5ff-8d32-4935-b6ab-bed66d958726', '12', null, 'F_Description', '角色描述', '6', '');
INSERT INTO `sys_modulecolumn` VALUES ('96c550c6-ffd6-4484-888d-0e16ce5a97b6', '2', null, 'loginIp', '登录IP', '9', '');
INSERT INTO `sys_modulecolumn` VALUES ('97e2e171-ab68-45b1-a675-2f2247f991d1', '7710c52a-81f8-4a34-868e-9d9323cc2eb7', null, 'LowerUserCount', '下级代理会员总数', '13', '');
INSERT INTO `sys_modulecolumn` VALUES ('9beb3b18-722b-4d74-ac73-800743c882bc', '7710c52a-81f8-4a34-868e-9d9323cc2eb7', null, 'wxId', '微信ID', '2', '');
INSERT INTO `sys_modulecolumn` VALUES ('9d5cc4f5-a37b-4f36-8527-308f1bc80910', '2cdeb781-d715-4566-9533-755eaa32d20f', null, 'F_ExecuteResultJson', '执行结果描述', '7', '');
INSERT INTO `sys_modulecolumn` VALUES ('9e0bd36e-5723-403a-b65c-f6370c75eccb', '4b55d173-3c8d-4147-8bcc-df38d3125119', null, 'updateTime', '时间', '4', '');
INSERT INTO `sys_modulecolumn` VALUES ('9f0714e0-3737-4e8f-8f60-d9c9d142803b', '2cdeb781-d715-4566-9533-755eaa32d20f', null, 'F_OperateAccount', '操作用户', '2', '');
INSERT INTO `sys_modulecolumn` VALUES ('a1e0f5a9-1cb1-4608-a023-33ec607d81da', '40858e35-67e2-40f3-836f-0d699b711847', null, 'clubIntroduce', '介绍', '9', '');
INSERT INTO `sys_modulecolumn` VALUES ('a20364ba-8aad-45dc-ad95-09a8ba52ded9', '13', null, 'F_EnCode', '编号', '1', '');
INSERT INTO `sys_modulecolumn` VALUES ('a8977fe0-247f-4164-9157-740fb2e70fb0', '11', null, 'LoginIP', '最近登录IP', '6', '');
INSERT INTO `sys_modulecolumn` VALUES ('ae54371f-4d8f-4957-8505-73b3fab3590a', '13', null, 'F_Target', '目标', '4', '');
INSERT INTO `sys_modulecolumn` VALUES ('af4a6678-ccb5-49ae-a50a-eb7da9552b4d', '78403f1a-26bd-470e-b6e7-bbe6e1c0f541', null, 'entryLimit', '最底带入值', '2', '');
INSERT INTO `sys_modulecolumn` VALUES ('b0c98d21-86bb-48b6-abed-5778da103fd2', '40858e35-67e2-40f3-836f-0d699b711847', null, 'creatName', '创建者', '2', '');
INSERT INTO `sys_modulecolumn` VALUES ('b436287d-1ab8-4cae-b595-d3938f9103a9', '7710c52a-81f8-4a34-868e-9d9323cc2eb7', null, 'nickName', '代理玩家', '3', '');
INSERT INTO `sys_modulecolumn` VALUES ('bb9a7d3b-bea0-4304-9874-b1c2a05d5dd8', '4', null, 'roundNumber', '游戏局数', '3', '');
INSERT INTO `sys_modulecolumn` VALUES ('bc84dbae-886b-4557-906e-cb59a8417090', '11', null, 'LoginDate', '最近登录时间', '7', '');
INSERT INTO `sys_modulecolumn` VALUES ('bdd5720e-1df6-4567-bfef-3446694c48ac', '6', null, 'roundNumber', '游戏局数', '4', '');
INSERT INTO `sys_modulecolumn` VALUES ('bf4f05f0-46b5-4ecb-8bee-e1305582e5a9', '11', null, 'UserNickName', '真实名字', '2', '');
INSERT INTO `sys_modulecolumn` VALUES ('bfaa8324-8f58-497c-94ff-ee38ea311ab4', '512a1f98-d23b-4691-9313-b3452b88f6d0', null, 'platformid', '平台ID', '1', '');
INSERT INTO `sys_modulecolumn` VALUES ('c12e43a0-1410-4419-b36f-ce3758c665ec', 'ae7e944f-2fbd-407f-aa38-a5f3a40798b9', null, 'updateTime', '修改时间', '7', '');
INSERT INTO `sys_modulecolumn` VALUES ('c309df45-141d-429a-89a0-d50ef1e067ff', '2', null, 'loginTime', '登录时间', '8', '');
INSERT INTO `sys_modulecolumn` VALUES ('c916ce99-d7ad-4b7c-94ac-1e275c9e592e', '6', null, 'roomNumber', '开房数量', '3', '');
INSERT INTO `sys_modulecolumn` VALUES ('cd16c29c-22d6-4a7a-92e5-ef78b394805e', '7710c52a-81f8-4a34-868e-9d9323cc2eb7', null, 'userIdCode', '推荐码', '5', '');
INSERT INTO `sys_modulecolumn` VALUES ('cfeee3d7-aaad-4fc3-a36e-778a52ddc098', '8', null, 'addDiamond', '钻石数量', '2', '');
INSERT INTO `sys_modulecolumn` VALUES ('d119ef32-905b-434a-982d-f7d0c7032b19', '9', null, 'topup', '总充值', '3', '');
INSERT INTO `sys_modulecolumn` VALUES ('d1723b34-8c2b-4e5b-9cda-096c2f37bbfd', '7710c52a-81f8-4a34-868e-9d9323cc2eb7', null, 'TodayAddUser', '今日新增用户数', '10', '');
INSERT INTO `sys_modulecolumn` VALUES ('d22e2801-7020-4d8a-984e-725f44f8e3bf', '4', null, 'time', '日期', '1', '');
INSERT INTO `sys_modulecolumn` VALUES ('d2c6600c-3067-4c1d-99e8-c53a5f5b21d1', '78403f1a-26bd-470e-b6e7-bbe6e1c0f541', null, 'fieldName', '类别', '1', '');
INSERT INTO `sys_modulecolumn` VALUES ('d4886c38-ef4a-492e-b3f3-8d4a501822da', '40858e35-67e2-40f3-836f-0d699b711847', null, 'clubName', '俱乐部名称', '1', '');
INSERT INTO `sys_modulecolumn` VALUES ('d726598d-b90b-4ba4-952b-e7b9172c82cb', '2', null, 'inviteCode', '绑定的推荐码', '3', '');
INSERT INTO `sys_modulecolumn` VALUES ('da916d39-0ae0-4be7-9d0a-9d8944dfa6ce', '7710c52a-81f8-4a34-868e-9d9323cc2eb7', null, 'higherUName', '代理的上级代理', '16', '');
INSERT INTO `sys_modulecolumn` VALUES ('dd8f1d55-ec78-4a25-9c82-8c16e3086911', '2cdeb781-d715-4566-9533-755eaa32d20f', null, 'F_IPAddress', 'IP地址', '3', '');
INSERT INTO `sys_modulecolumn` VALUES ('df4e1f71-059b-4d98-b79f-30a84e787902', '4', null, 'roomNumber', '开房数量', '2', '');
INSERT INTO `sys_modulecolumn` VALUES ('e2e6a2b9-106a-49d8-9009-27241b4de74e', '2', null, 'roundNum', '已玩局数', '5', '');
INSERT INTO `sys_modulecolumn` VALUES ('e6374a79-b71b-45b3-8d68-3b62bd16f1f1', 'ae7e944f-2fbd-407f-aa38-a5f3a40798b9', null, 'minMoney', '最小金额', '3', '');
INSERT INTO `sys_modulecolumn` VALUES ('e6ad9827-5bb6-42b8-8974-12d8336013a1', '9', null, 'consumption', '总消耗', '2', '');
INSERT INTO `sys_modulecolumn` VALUES ('e6c8aa6b-10c9-4620-a14a-8a2beb14f76b', '13', null, 'F_UrlAddress', '地址', '3', '');
INSERT INTO `sys_modulecolumn` VALUES ('e6f2dbe9-af54-4df0-9186-363de1832837', '7710c52a-81f8-4a34-868e-9d9323cc2eb7', null, 'inviteUserName', '代理的邀请人', '15', '');
INSERT INTO `sys_modulecolumn` VALUES ('e71f5b7a-5d3e-4231-8cc7-48230bfda6ea', '512a1f98-d23b-4691-9313-b3452b88f6d0', null, 'domainname', '域名', '2', '');
INSERT INTO `sys_modulecolumn` VALUES ('e893ffab-c985-4be0-8401-553378bdb10c', '7710c52a-81f8-4a34-868e-9d9323cc2eb7', null, 'status', '状态', '17', '');
INSERT INTO `sys_modulecolumn` VALUES ('e9d4e16c-9b9b-4c4d-a492-e94fd0bdc9b9', '12', null, 'F_EnabledMark', '有效', '5', '');
INSERT INTO `sys_modulecolumn` VALUES ('ed1b3a1d-b407-4c37-9499-baa7c8a57976', '11', null, 'Valid', '状态', '8', '');
INSERT INTO `sys_modulecolumn` VALUES ('edb497ed-3acb-4ac0-9bde-04664753661b', '40858e35-67e2-40f3-836f-0d699b711847', null, 'peopleCount', '总人数', '4', '');
INSERT INTO `sys_modulecolumn` VALUES ('f1c56fc9-2965-4fb5-8346-6bca437c3e18', '7710c52a-81f8-4a34-868e-9d9323cc2eb7', null, 'loginTime', '最后登录时间', '7', '');
INSERT INTO `sys_modulecolumn` VALUES ('f51421ea-20d4-4008-a2c9-7cb11c28df52', '7710c52a-81f8-4a34-868e-9d9323cc2eb7', null, 'diamond', '剩余钻石', '6', '');
INSERT INTO `sys_modulecolumn` VALUES ('f74e586d-84b5-4309-9cd3-4fbd556c2c6d', '11', null, 'UserName', '用户名', '1', '');
INSERT INTO `sys_modulecolumn` VALUES ('f9c541be-0a37-422b-801d-cee86b5b3903', '12', null, 'F_EnCode', '角色编号', '1', '');
INSERT INTO `sys_modulecolumn` VALUES ('fdfea16c-63d4-4428-8f62-6f858a34e9d5', '13', null, 'F_FullName', '名称', '2', '');

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `F_RoleId` varchar(50) NOT NULL,
  `F_Category` varchar(50) DEFAULT NULL COMMENT '分类',
  `F_EnCode` varchar(50) DEFAULT NULL COMMENT '角色编码',
  `F_FullName` varchar(50) DEFAULT NULL,
  `F_SortCode` int(4) DEFAULT NULL COMMENT '排序码',
  `F_DeleteMark` int(2) DEFAULT NULL COMMENT '删除标记',
  `F_EnabledMark` int(2) DEFAULT NULL COMMENT '有效标志',
  `F_Description` varchar(200) DEFAULT NULL,
  `F_CreateDate` datetime DEFAULT NULL COMMENT '创建日期',
  `F_CreateUserId` varchar(50) DEFAULT NULL,
  `F_CreateUserName` varchar(50) DEFAULT NULL,
  `F_ModifyDate` datetime DEFAULT NULL,
  `F_ModifyUserId` varchar(50) DEFAULT NULL,
  `F_ModifyUserName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`F_RoleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('4a2c0ca4-0ea2-4f34-929d-5091141f08d6', null, 'superUser', '超级用户', '1', '0', '1', '超级用户，管理人员', '2018-06-06 11:40:59', '1', '超级管理员', null, null, null);

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模块名称',
  `UserName` varchar(50) NOT NULL COMMENT '用户名称',
  `UserPassWord` varchar(200) NOT NULL COMMENT '用户密码',
  `UserNickName` varchar(50) DEFAULT '' COMMENT '用户昵称',
  `UserType` int(11) NOT NULL DEFAULT '1007001' COMMENT '用户类型(1007001:超级管理员；1007002:普通管理员)',
  `RegistIP` varchar(20) DEFAULT '' COMMENT '注册IP地址',
  `Valid` int(11) NOT NULL DEFAULT '1008001' COMMENT '是否有效(1008002:注销; 1008001:正常)',
  `LoginDate` timestamp NULL DEFAULT NULL COMMENT '登录时间',
  `LoginIP` varchar(20) DEFAULT '' COMMENT '登录IP地址',
  `CreateDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `ModifyDate` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '4297f44b13955235245b2497399d7a93', '超级管理员', '1007001', '192.168.0.220', '1008001', '2018-06-06 15:41:09', '::1', '2017-06-06 18:36:30', '2018-03-26 12:09:28');

-- ----------------------------
-- Table structure for `sys_userrelation`
-- ----------------------------
DROP TABLE IF EXISTS `sys_userrelation`;
CREATE TABLE `sys_userrelation` (
  `F_UserRelationId` varchar(50) NOT NULL,
  `F_UserId` varchar(50) DEFAULT NULL COMMENT '用户主键',
  `F_Category` int(4) DEFAULT NULL COMMENT '分类:1-角色2-岗位',
  `F_ObjectId` varchar(50) DEFAULT NULL COMMENT '对象主键',
  `F_CreateDate` datetime DEFAULT NULL,
  `F_CreateUserId` varchar(50) DEFAULT NULL,
  `F_CreateUserName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`F_UserRelationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_userrelation
-- ----------------------------
INSERT INTO `sys_userrelation` VALUES ('4012517e-adc2-4687-9a66-8a5bb5da2285', '3', '1', 'f8284ed8-666e-4df5-9eb0-7ed8c3a4d333', '2017-11-29 18:32:05', '1', '超级管理员');
INSERT INTO `sys_userrelation` VALUES ('4c754dad-d2d1-4a20-89fb-f09fb78a7c03', '7', '1', 'f8284ed8-666e-4df5-9eb0-7ed8c3a4d333', '2017-11-29 18:32:05', '1', '超级管理员');
INSERT INTO `sys_userrelation` VALUES ('e85d1ace-0090-4c59-b5a3-355d2b43e69e', '1', '1', '4a2c0ca4-0ea2-4f34-929d-5091141f08d6', '2018-06-06 11:41:10', '1', '超级管理员');

-- ----------------------------
-- Table structure for `t_agent_relation`
-- ----------------------------
DROP TABLE IF EXISTS `t_agent_relation`;
CREATE TABLE `t_agent_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL COMMENT '代理用户ID',
  `higherAgent` int(11) DEFAULT NULL,
  `inviteUserId` int(11) DEFAULT NULL COMMENT '邀请用户ID',
  `agentUsers` varchar(255) DEFAULT NULL COMMENT '上级代理列表',
  `createTime` timestamp NULL DEFAULT NULL,
  `updateTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(1) DEFAULT '0' COMMENT '状态 1禁用 0正常',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_agent_relation
-- ----------------------------

-- ----------------------------
-- Table structure for `t_bull_game_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_bull_game_log`;
CREATE TABLE `t_bull_game_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roomType` int(11) NOT NULL,
  `round` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `player1_bet` int(11) NOT NULL COMMENT '天 下注',
  `player2_bet` int(11) NOT NULL COMMENT '地 下注',
  `player3_bet` int(11) NOT NULL COMMENT '人 下注',
  `bet_total` int(11) NOT NULL COMMENT '下注总金额',
  `reward_total` int(11) NOT NULL COMMENT '派奖总金额',
  `isBanker` int(11) NOT NULL COMMENT '是否为庄家',
  `createTime` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_bull_game_log
-- ----------------------------

-- ----------------------------
-- Table structure for `t_bull_waybill`
-- ----------------------------
DROP TABLE IF EXISTS `t_bull_waybill`;
CREATE TABLE `t_bull_waybill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roomType` tinyint(4) NOT NULL COMMENT '场次类型',
  `round` int(11) NOT NULL COMMENT '局号',
  `banker_result` int(11) NOT NULL COMMENT '庄家的点数',
  `banker_cards` varchar(50) NOT NULL,
  `player1_result` int(11) NOT NULL COMMENT '闲1的输赢+点数得到的16进制数',
  `player1_cards` varchar(50) NOT NULL COMMENT '闲1的牌局数据',
  `player2_result` int(11) NOT NULL,
  `player2_cards` varchar(50) NOT NULL,
  `player3_result` int(11) NOT NULL,
  `player3_cards` varchar(50) NOT NULL,
  `updateTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_bull_waybill
-- ----------------------------

-- ----------------------------
-- Table structure for `t_club`
-- ----------------------------
DROP TABLE IF EXISTS `t_club`;
CREATE TABLE `t_club` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `clubId` int(8) NOT NULL COMMENT '所创俱乐部Id  8位数',
  `clubName` varchar(20) NOT NULL COMMENT '俱乐部的名称',
  `clubType` tinyint(3) NOT NULL COMMENT '0--私人俱乐部  1--公共俱乐部',
  `diamondPercent` int(11) NOT NULL COMMENT '扣除群主钻石的百分比',
  `scorePool` int(11) NOT NULL DEFAULT '0' COMMENT '创建俱乐部积分池 ，初始值1000000000',
  `coinPool` int(11) NOT NULL DEFAULT '0' COMMENT '俱乐部群主的金币池',
  `expandRate` int(11) NOT NULL DEFAULT '1' COMMENT '小盲的伸缩倍率',
  `scoreRate` int(11) NOT NULL DEFAULT '500' COMMENT '最低买入底分的倍率',
  `iconUrl` varchar(120) DEFAULT NULL COMMENT '俱乐部图标的url',
  `creatorId` int(11) NOT NULL COMMENT '创建俱乐部的创始人的userId',
  `city` varchar(30) DEFAULT NULL COMMENT '俱乐部创建所属城市',
  `peopleCount` int(11) DEFAULT NULL COMMENT '加入俱乐部的总人数',
  `createTime` datetime DEFAULT NULL COMMENT '俱乐部创建时间',
  `modifyTime` datetime DEFAULT NULL COMMENT '俱乐部有改动时间',
  `clubIntroduce` varchar(500) DEFAULT NULL COMMENT '俱乐部介绍',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_club
-- ----------------------------
INSERT INTO `t_club` VALUES ('5', '10000000', '百人牛牛场', '1', '0', '0', '990', '0', '0', 'www.jlavlpajfi', '0', '深圳', '59', '2018-02-05 17:25:08', '2018-02-05 17:25:11', '公共俱乐部，点击直接加入');

-- ----------------------------
-- Table structure for `t_club_config`
-- ----------------------------
DROP TABLE IF EXISTS `t_club_config`;
CREATE TABLE `t_club_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `configType` int(6) NOT NULL COMMENT '配置的类型 10001--公共俱乐部每个玩家可消耗房卡的额度 10002-公共俱乐部每次开房消耗的额度 10003-私人俱乐最大开桌数 10004-允许玩家加入的私人俱乐部的上限  10005-私人俱乐部人数上限  10006-私人俱乐部每次开房消耗的额度',
  `count` int(3) NOT NULL COMMENT '具体配置的数值 ',
  `updateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_club_config
-- ----------------------------
INSERT INTO `t_club_config` VALUES ('1', '10001', '26', '2018-01-26 16:18:27', '2018-01-26 16:10:49');
INSERT INTO `t_club_config` VALUES ('2', '10002', '2', '2018-01-30 16:19:21', '2018-01-30 16:19:24');
INSERT INTO `t_club_config` VALUES ('3', '10003', '10', '2018-01-30 16:19:59', '2018-01-30 16:20:02');
INSERT INTO `t_club_config` VALUES ('4', '10004', '5', '2018-01-30 16:20:16', '2018-01-30 16:20:19');
INSERT INTO `t_club_config` VALUES ('5', '10005', '100', '2018-01-30 16:23:17', '2018-01-30 16:23:20');
INSERT INTO `t_club_config` VALUES ('6', '10006', '1', '2018-01-30 16:24:38', '2018-01-30 16:24:41');
INSERT INTO `t_club_config` VALUES ('9', '10007', '200', '2018-04-18 15:16:06', '2018-04-18 15:16:09');

-- ----------------------------
-- Table structure for `t_club_diamond_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_club_diamond_log`;
CREATE TABLE `t_club_diamond_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clubId` int(8) NOT NULL COMMENT '俱乐部的Id',
  `roomNum` int(6) DEFAULT NULL COMMENT '房主创建的俱乐部房间号',
  `userId` int(11) NOT NULL COMMENT '俱乐部成员的userId',
  `diamond` int(11) NOT NULL COMMENT ' 钻石消耗数量',
  `type` smallint(1) NOT NULL COMMENT '4-消耗 5-归还  6-买入底分消耗',
  `createTime` datetime DEFAULT NULL COMMENT '玩家消耗创建者钻石的时间',
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_club_diamond_log
-- ----------------------------

-- ----------------------------
-- Table structure for `t_club_member`
-- ----------------------------
DROP TABLE IF EXISTS `t_club_member`;
CREATE TABLE `t_club_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clubId` int(8) NOT NULL COMMENT '俱乐部的Id',
  `userId` int(11) NOT NULL COMMENT '俱乐部的成员的userId',
  `diamondLimit` int(11) DEFAULT NULL COMMENT '俱乐部成员每天可以消耗的钻石的数量，由创建者设置',
  `costDiamond` int(11) DEFAULT NULL COMMENT '消耗的钻石',
  `scoreLimit` int(11) NOT NULL COMMENT '群主给俱乐部成员设置的积分限额',
  `costScore` int(11) NOT NULL COMMENT '俱乐部成员已消耗的积分',
  `currentScore` int(11) NOT NULL DEFAULT '0' COMMENT '玩家当前的积分',
  `coinLimit` int(11) NOT NULL DEFAULT '0' COMMENT '群主给群成员分配总金币限额',
  `position` smallint(3) DEFAULT NULL COMMENT '是否是该俱乐部的创建者 0--不是 1--是',
  `createTime` datetime DEFAULT NULL COMMENT '记录的创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_club_member
-- ----------------------------

-- ----------------------------
-- Table structure for `t_club_msg`
-- ----------------------------
DROP TABLE IF EXISTS `t_club_msg`;
CREATE TABLE `t_club_msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clubId` int(8) NOT NULL COMMENT '俱乐部Id',
  `applyId` int(11) DEFAULT NULL COMMENT '申请加入俱乐部的玩家的id',
  `userId` int(11) NOT NULL COMMENT '接收消息的玩家userId',
  `type` tinyint(2) DEFAULT NULL COMMENT '消息类型 1-非俱乐部玩家申请加入俱乐部 默认是 0',
  `content` varchar(500) NOT NULL COMMENT '消息的内容',
  `isRead` tinyint(2) DEFAULT NULL COMMENT '消息是否已经读取 0--未读  1--已读',
  `createTime` datetime DEFAULT NULL COMMENT '消息的创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_club_msg
-- ----------------------------

-- ----------------------------
-- Table structure for `t_club_msg_bak`
-- ----------------------------
DROP TABLE IF EXISTS `t_club_msg_bak`;
CREATE TABLE `t_club_msg_bak` (
  `id` int(11) NOT NULL DEFAULT '0',
  `clubId` int(8) NOT NULL COMMENT '俱乐部Id',
  `applyId` int(11) DEFAULT NULL COMMENT '申请加入俱乐部的玩家的id',
  `userId` int(11) NOT NULL COMMENT '接收消息的玩家userId',
  `type` tinyint(2) DEFAULT NULL COMMENT '消息类型 1-非俱乐部玩家申请加入俱乐部 默认是 0',
  `content` varchar(500) NOT NULL COMMENT '消息的内容',
  `isRead` tinyint(2) DEFAULT NULL COMMENT '消息是否已经读取 0--未读  1--已读',
  `createTime` datetime DEFAULT NULL COMMENT '消息的创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_club_msg_bak
-- ----------------------------

-- ----------------------------
-- Table structure for `t_club_operate_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_club_operate_log`;
CREATE TABLE `t_club_operate_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clubId` int(8) NOT NULL COMMENT '俱乐部的Id',
  `operatorId` int(11) NOT NULL COMMENT '俱乐部成员操作者的userId',
  `clubPosition` int(11) NOT NULL COMMENT '操作人的俱乐部职位 0--创建者 1--预留 2--普通成员 3-非俱乐部成员',
  `operateType` int(5) NOT NULL COMMENT '操作权限类型 ------普通成员： 0-申请加入俱乐部 1-退出俱乐部 创建者：10-创建俱乐部 11-删除俱乐部 12-审批加入申请通过 13-审批拒绝 14-邀请新成员 15-踢出成员  ',
  `createTime` datetime DEFAULT NULL COMMENT '操作者此次的操作时间',
  `remark` varchar(56) DEFAULT NULL COMMENT '备注 ：俱乐部成员具体职位的具体操作',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_club_operate_log
-- ----------------------------

-- ----------------------------
-- Table structure for `t_diamond_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_diamond_log`;
CREATE TABLE `t_diamond_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `oldDiamond` int(11) NOT NULL,
  `newDiamond` int(11) NOT NULL,
  `changedDiamond` int(11) NOT NULL,
  `changedType` tinyint(2) NOT NULL COMMENT '账变类型 0-充值 1-扣除<房费> 2-活动送(绑定礼品码送) 3-退还扣除房费',
  `updateTime` datetime NOT NULL,
  `remark` varchar(255) DEFAULT NULL COMMENT '钻石帐变备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_diamond_log
-- ----------------------------

-- ----------------------------
-- Table structure for `t_entryscore_config`
-- ----------------------------
DROP TABLE IF EXISTS `t_entryscore_config`;
CREATE TABLE `t_entryscore_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `startPoint` int(11) NOT NULL COMMENT '起点值',
  `endPoint` int(11) NOT NULL COMMENT '终点值',
  `expandRate` int(11) NOT NULL COMMENT '起始伸缩倍率',
  `scoreRate` int(11) NOT NULL COMMENT '最低带入底分倍率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_entryscore_config
-- ----------------------------
INSERT INTO `t_entryscore_config` VALUES ('1', '1', '100', '1', '500');

-- ----------------------------
-- Table structure for `t_field_config`
-- ----------------------------
DROP TABLE IF EXISTS `t_field_config`;
CREATE TABLE `t_field_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeId` int(11) NOT NULL COMMENT '场次id',
  `fieldName` varchar(20) NOT NULL COMMENT '场次名称',
  `entryLimit` int(11) NOT NULL COMMENT '最低入场限额',
  `upbankerLimit` int(11) NOT NULL COMMENT '最低上庄金额',
  `min_bet` int(11) NOT NULL COMMENT '最小下注',
  `rate` int(11) NOT NULL COMMENT '倍率',
  `isOpen` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否开放 1开0关',
  `updateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_field_config
-- ----------------------------
INSERT INTO `t_field_config` VALUES ('1', '1', '普通场', '100', '0', '10', '10', '1', '2018-05-23 14:24:30');
INSERT INTO `t_field_config` VALUES ('2', '2', '高级场', '500', '0', '50', '10', '1', '2018-05-23 16:43:30');
INSERT INTO `t_field_config` VALUES ('3', '3', '贵宾场', '1000', '0', '100', '10', '0', '2018-06-05 16:17:16');

-- ----------------------------
-- Table structure for `t_game_account_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_game_account_log`;
CREATE TABLE `t_game_account_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roomType` int(11) NOT NULL COMMENT '场次类型',
  `round` int(11) NOT NULL COMMENT '局数',
  `userId` int(11) NOT NULL,
  `oldMoney` int(11) NOT NULL,
  `newMoney` int(11) NOT NULL,
  `betCoin` int(11) NOT NULL COMMENT '下注金额',
  `rewardMoney` int(11) NOT NULL,
  `createTime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_game_account_log
-- ----------------------------

-- ----------------------------
-- Table structure for `t_game_activity_config`
-- ----------------------------
DROP TABLE IF EXISTS `t_game_activity_config`;
CREATE TABLE `t_game_activity_config` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `type` tinyint(5) NOT NULL DEFAULT '1' COMMENT '活动送钻石类型  ',
  `addDiamond` int(20) NOT NULL DEFAULT '8' COMMENT '玩家绑定邀请码成功后，赠送的钻石',
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_game_activity_config
-- ----------------------------
INSERT INTO `t_game_activity_config` VALUES ('1', '1', '8', '2017-11-01 14:04:01');

-- ----------------------------
-- Table structure for `t_game_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_game_log`;
CREATE TABLE `t_game_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `roomNum` int(7) NOT NULL,
  `roundTotal` int(3) NOT NULL COMMENT '房间局数  10  or  20',
  `playedRound` int(11) NOT NULL DEFAULT '0' COMMENT '已玩局数',
  `bankerMode` tinyint(2) NOT NULL DEFAULT '1' COMMENT '庄家模式',
  `baseScore` tinyint(2) DEFAULT NULL COMMENT '底分：1代表1/2，2代表2/4，3代表4/8 <非通比牛牛>',
  `allCompareBaseScore` tinyint(2) DEFAULT '0' COMMENT ' 通比牛牛的底分值',
  `roomOwnerId` int(7) DEFAULT NULL COMMENT '房主id，AA支付时没有房主',
  `payMode` tinyint(2) NOT NULL DEFAULT '0' COMMENT '支付方式 0-房主支付  1-AA支付',
  `playerId1` varchar(20) DEFAULT NULL COMMENT '座位1位置的玩家Id',
  `score1` int(11) DEFAULT NULL COMMENT '座位1的玩家总成绩',
  `headImgUrl1` varchar(512) DEFAULT NULL,
  `nickName1` varchar(40) DEFAULT NULL,
  `playerId2` varchar(20) DEFAULT NULL COMMENT '座位2位置的玩家Id',
  `score2` int(11) DEFAULT NULL COMMENT '座位2的玩家总成绩',
  `headImgUrl2` varchar(512) DEFAULT NULL,
  `nickName2` varchar(40) DEFAULT NULL,
  `playerId3` varchar(20) DEFAULT NULL COMMENT '座位3位置的玩家Id',
  `score3` int(11) DEFAULT NULL COMMENT '座位3的玩家总成绩',
  `headImgUrl3` varchar(512) DEFAULT NULL,
  `nickName3` varchar(40) DEFAULT NULL,
  `playerId4` varchar(20) DEFAULT NULL COMMENT '座位4位置的玩家Id',
  `score4` int(11) DEFAULT NULL COMMENT '座位4的玩家总成绩',
  `headImgUrl4` varchar(512) DEFAULT NULL,
  `nickName4` varchar(40) DEFAULT NULL,
  `playerId5` varchar(20) DEFAULT NULL COMMENT '座位5位置的玩家Id',
  `score5` int(11) DEFAULT NULL COMMENT '座位5的玩家总成绩',
  `headImgUrl5` varchar(512) DEFAULT NULL,
  `nickName5` varchar(40) DEFAULT NULL,
  `playerId6` varchar(20) DEFAULT NULL COMMENT '座位6位置的玩家Id',
  `score6` int(11) DEFAULT NULL COMMENT '座位6的玩家总成绩',
  `headImgUrl6` varchar(512) DEFAULT NULL,
  `nickName6` varchar(40) DEFAULT NULL,
  `roundIndex1` varchar(20) DEFAULT NULL,
  `roundIndex2` varchar(20) DEFAULT NULL,
  `roundIndex3` varchar(20) DEFAULT NULL,
  `roundIndex4` varchar(20) DEFAULT NULL,
  `roundIndex5` varchar(20) DEFAULT NULL,
  `roundIndex6` varchar(20) DEFAULT NULL,
  `roundIndex7` varchar(20) DEFAULT NULL,
  `roundIndex8` varchar(20) DEFAULT NULL,
  `roundIndex9` varchar(20) DEFAULT NULL,
  `roundIndex10` varchar(20) DEFAULT NULL,
  `roundIndex11` varchar(20) DEFAULT NULL,
  `roundIndex12` varchar(20) DEFAULT NULL,
  `roundIndex13` varchar(20) DEFAULT NULL,
  `roundIndex14` varchar(20) DEFAULT NULL,
  `roundIndex15` varchar(20) DEFAULT NULL,
  `roundIndex16` varchar(20) DEFAULT NULL,
  `roundIndex17` varchar(20) DEFAULT NULL,
  `roundIndex18` varchar(20) DEFAULT NULL,
  `roundIndex19` varchar(20) DEFAULT NULL,
  `roundIndex20` varchar(20) DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL COMMENT '游戏的最后一局记录的更新时间',
  `createTime` datetime DEFAULT NULL COMMENT '该条记录的创建时间',
  `clubId` int(8) DEFAULT NULL,
  `isCharge` tinyint(1) DEFAULT '0' COMMENT '俱乐部房间是否收过费',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_game_log
-- ----------------------------

-- ----------------------------
-- Table structure for `t_game_player_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_game_player_log`;
CREATE TABLE `t_game_player_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clubId` int(11) NOT NULL COMMENT '俱乐部id',
  `clubName` varchar(50) DEFAULT NULL COMMENT '俱乐部名称',
  `roomNum` int(11) NOT NULL COMMENT '房间号',
  `playerId` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `buyScore` int(11) NOT NULL DEFAULT '0' COMMENT '累计买入积分',
  `result` int(11) NOT NULL DEFAULT '0' COMMENT '输赢结果',
  `isJoinGame` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否加入游戏',
  `headImgUrl` varchar(20) DEFAULT NULL,
  `nickName` varchar(20) DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_game_player_log
-- ----------------------------

-- ----------------------------
-- Table structure for `t_game_room_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_game_room_log`;
CREATE TABLE `t_game_room_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clubId` int(11) NOT NULL COMMENT '俱乐部id',
  `roomNum` int(11) NOT NULL COMMENT '房间号',
  `playedRound` int(11) NOT NULL COMMENT '俱乐部开房玩过的总局数',
  `scoreLimit` int(11) NOT NULL DEFAULT '0' COMMENT '入场最低积分',
  `gameTime` int(11) NOT NULL DEFAULT '0' COMMENT '游戏时长',
  `bankerMode` tinyint(4) NOT NULL DEFAULT '1' COMMENT '上庄模式 默认为牛牛上庄 1-牛牛上庄 2-固定庄家 3-自由抢庄 4-明牌抢庄 5-通比牛牛 6-轮庄牛牛',
  `baseScore` tinyint(4) DEFAULT NULL COMMENT '底分：1代表1/2，2代表2/4，3代表4/8 <非通比牛牛>',
  `allCompareBaseScore` tinyint(4) DEFAULT '0' COMMENT ' 通比牛牛的底分值',
  `roomOwnerId` int(11) DEFAULT NULL COMMENT '俱乐部开房者',
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_game_room_log
-- ----------------------------

-- ----------------------------
-- Table structure for `t_game_round_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_game_round_log`;
CREATE TABLE `t_game_round_log` (
  `roundIndex` varchar(20) NOT NULL COMMENT '局数对应的索引',
  `roomNum` int(7) NOT NULL COMMENT '房间号',
  `round` tinyint(2) NOT NULL COMMENT '游戏的局数 取值范围为 1-20 ',
  `roomOwner` varchar(20) DEFAULT NULL COMMENT '房主Id AA支付时没有房主',
  `chooseBaseScore` tinyint(2) NOT NULL DEFAULT '0' COMMENT '庄家选择分数 2/4/8/16/32',
  `bankerId` varchar(20) DEFAULT NULL COMMENT '庄家Id，通比牛牛时没有庄家',
  `player1` varchar(20) DEFAULT NULL COMMENT '座位1的玩家Id',
  `cards1` varchar(40) DEFAULT NULL COMMENT '座位1的玩家的牌信息',
  `cardType1` tinyint(2) DEFAULT NULL COMMENT '1位置的玩家的牌类型',
  `baseScore1` int(2) DEFAULT NULL COMMENT '座位1玩家一局的押注底分，庄家不押注',
  `getScore1` int(11) DEFAULT NULL COMMENT '座位1的玩家的一局得分',
  `getScoreTotal1` int(11) DEFAULT NULL,
  `isRobBanker1` tinyint(2) DEFAULT NULL COMMENT '0--没有抢庄  非0表示有抢庄1--x2  2--x4  3--x8',
  `robBankerNum1` tinyint(2) DEFAULT NULL COMMENT '位置1的玩家的抢庄倍率 明牌抢庄的时候用到',
  `player2` varchar(20) DEFAULT NULL COMMENT '座位2的玩家Id',
  `cards2` varchar(40) DEFAULT NULL COMMENT '座位2的玩家的牌信息',
  `cardType2` tinyint(2) DEFAULT NULL COMMENT '2位置的玩家的牌类型',
  `baseScore2` int(2) DEFAULT NULL COMMENT '座位2玩家一局的押注底分，庄家不押注',
  `getScore2` int(11) DEFAULT NULL COMMENT '座位2的玩家的一局得分',
  `getScoreTotal2` int(11) DEFAULT NULL,
  `isRobBanker2` tinyint(2) DEFAULT NULL COMMENT '2号位置上的玩家是否抢庄  自由抢庄时用到',
  `robBankerNum2` tinyint(2) DEFAULT NULL COMMENT '位置2的玩家的抢庄倍率 明牌抢庄的时候用到',
  `player3` varchar(20) DEFAULT NULL COMMENT '座位3的玩家Id',
  `cards3` varchar(40) DEFAULT NULL COMMENT '座位3的玩家的牌信息',
  `cardType3` int(2) DEFAULT NULL COMMENT '3位置的玩家的牌类型',
  `baseScore3` int(2) DEFAULT NULL COMMENT '座位3玩家一局的押注底分，庄家不押注',
  `getScore3` int(11) DEFAULT NULL COMMENT '座位3的玩家的一局得分',
  `getScoreTotal3` int(11) DEFAULT NULL,
  `isRobBanker3` tinyint(2) DEFAULT NULL COMMENT '3号位置上的玩家是否抢庄  自由抢庄时用到',
  `robBankerNum3` tinyint(2) DEFAULT NULL COMMENT '位置3的玩家的抢庄倍率 明牌抢庄的时候用到',
  `player4` varchar(20) DEFAULT NULL COMMENT '座位4的玩家Id',
  `cards4` varchar(40) DEFAULT NULL COMMENT '座位4的玩家的牌信息',
  `cardType4` tinyint(2) DEFAULT NULL COMMENT '4位置的玩家的牌类型',
  `baseScore4` int(2) DEFAULT NULL COMMENT '座位4玩家一局的押注底分，庄家不押注',
  `getScore4` int(11) DEFAULT NULL COMMENT '座位4的玩家的一局得分',
  `getScoreTotal4` int(11) DEFAULT NULL,
  `isRobBanker4` tinyint(2) DEFAULT NULL COMMENT '4号位置上的玩家是否抢庄  自由抢庄时用到',
  `robBankerNum4` tinyint(2) DEFAULT NULL COMMENT '位置4的玩家的抢庄倍率 明牌抢庄的时候用到',
  `player5` varchar(20) DEFAULT NULL COMMENT '座位5的玩家Id',
  `cards5` varchar(40) DEFAULT NULL COMMENT '座位5的玩家的牌信息',
  `cardType5` tinyint(2) DEFAULT NULL COMMENT '5位置的玩家的牌类型',
  `baseScore5` int(2) DEFAULT NULL COMMENT '座位5玩家一局的押注底分，庄家不押注',
  `getScore5` int(11) DEFAULT NULL COMMENT '座位5的玩家的一局得分',
  `getScoreTotal5` int(11) DEFAULT NULL,
  `isRobBanker5` tinyint(2) DEFAULT NULL COMMENT '5号位置上的玩家是否抢庄  自由抢庄时用到',
  `robBankerNum5` tinyint(2) DEFAULT NULL COMMENT '位置5的玩家的抢庄倍率 明牌抢庄的时候用到',
  `player6` varchar(20) DEFAULT NULL COMMENT '座位6的玩家Id',
  `cards6` varchar(40) DEFAULT NULL COMMENT '座位6的玩家的牌信息',
  `cardType6` tinyint(2) DEFAULT NULL COMMENT '6位置的玩家的牌类型',
  `baseScore6` int(2) DEFAULT NULL COMMENT '座位6玩家一局的押注底分，庄家不押注',
  `getScore6` int(11) DEFAULT NULL COMMENT '座位6的玩家的一局得分',
  `getScoreTotal6` int(11) DEFAULT NULL,
  `isRobBanker6` tinyint(2) DEFAULT NULL COMMENT '6号位置上的玩家是否抢庄  自由抢庄时用到',
  `robBankerNum6` tinyint(2) NOT NULL COMMENT '位置6的玩家的抢庄倍率 明牌抢庄的时候用到',
  `updateTime` datetime NOT NULL,
  PRIMARY KEY (`roundIndex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_game_round_log
-- ----------------------------

-- ----------------------------
-- Table structure for `t_game_round_log_h5`
-- ----------------------------
DROP TABLE IF EXISTS `t_game_round_log_h5`;
CREATE TABLE `t_game_round_log_h5` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clubId` int(11) NOT NULL COMMENT '俱乐部id',
  `roomNum` int(11) NOT NULL COMMENT '房间号',
  `round` int(11) NOT NULL COMMENT '游戏的局数 ',
  `bankerId` varchar(20) DEFAULT NULL COMMENT '庄家Id，通比牛牛时没有庄家',
  `player1` varchar(20) DEFAULT NULL COMMENT '座位1的玩家Id',
  `cards1` varchar(40) DEFAULT NULL COMMENT '座位1的玩家的牌信息',
  `cardType1` tinyint(2) DEFAULT NULL COMMENT '1位置的玩家的牌类型',
  `baseScore1` int(2) DEFAULT NULL COMMENT '座位1玩家一局的押注底分，庄家不押注',
  `getScore1` int(11) DEFAULT NULL COMMENT '座位1的玩家的一局得分',
  `getScoreTotal1` int(11) DEFAULT NULL,
  `isRobBanker1` tinyint(2) DEFAULT NULL COMMENT '0--没有抢庄  非0表示有抢庄1--x2  2--x4  3--x8',
  `robBankerNum1` tinyint(2) DEFAULT NULL COMMENT '位置1的玩家的抢庄倍率 明牌抢庄的时候用到',
  `player2` varchar(20) DEFAULT NULL COMMENT '座位2的玩家Id',
  `cards2` varchar(40) DEFAULT NULL COMMENT '座位2的玩家的牌信息',
  `cardType2` tinyint(2) DEFAULT NULL COMMENT '2位置的玩家的牌类型',
  `baseScore2` int(2) DEFAULT NULL COMMENT '座位2玩家一局的押注底分，庄家不押注',
  `getScore2` int(11) DEFAULT NULL COMMENT '座位2的玩家的一局得分',
  `getScoreTotal2` int(11) DEFAULT NULL,
  `isRobBanker2` tinyint(2) DEFAULT NULL COMMENT '2号位置上的玩家是否抢庄  自由抢庄时用到',
  `robBankerNum2` tinyint(2) DEFAULT NULL COMMENT '位置2的玩家的抢庄倍率 明牌抢庄的时候用到',
  `player3` varchar(20) DEFAULT NULL COMMENT '座位3的玩家Id',
  `cards3` varchar(40) DEFAULT NULL COMMENT '座位3的玩家的牌信息',
  `cardType3` int(2) DEFAULT NULL COMMENT '3位置的玩家的牌类型',
  `baseScore3` int(2) DEFAULT NULL COMMENT '座位3玩家一局的押注底分，庄家不押注',
  `getScore3` int(11) DEFAULT NULL COMMENT '座位3的玩家的一局得分',
  `getScoreTotal3` int(11) DEFAULT NULL,
  `isRobBanker3` tinyint(2) DEFAULT NULL COMMENT '3号位置上的玩家是否抢庄  自由抢庄时用到',
  `robBankerNum3` tinyint(2) DEFAULT NULL COMMENT '位置3的玩家的抢庄倍率 明牌抢庄的时候用到',
  `player4` varchar(20) DEFAULT NULL COMMENT '座位4的玩家Id',
  `cards4` varchar(40) DEFAULT NULL COMMENT '座位4的玩家的牌信息',
  `cardType4` tinyint(2) DEFAULT NULL COMMENT '4位置的玩家的牌类型',
  `baseScore4` int(2) DEFAULT NULL COMMENT '座位4玩家一局的押注底分，庄家不押注',
  `getScore4` int(11) DEFAULT NULL COMMENT '座位4的玩家的一局得分',
  `getScoreTotal4` int(11) DEFAULT NULL,
  `isRobBanker4` tinyint(2) DEFAULT NULL COMMENT '4号位置上的玩家是否抢庄  自由抢庄时用到',
  `robBankerNum4` tinyint(2) DEFAULT NULL COMMENT '位置4的玩家的抢庄倍率 明牌抢庄的时候用到',
  `player5` varchar(20) DEFAULT NULL COMMENT '座位5的玩家Id',
  `cards5` varchar(40) DEFAULT NULL COMMENT '座位5的玩家的牌信息',
  `cardType5` tinyint(2) DEFAULT NULL COMMENT '5位置的玩家的牌类型',
  `baseScore5` int(2) DEFAULT NULL COMMENT '座位5玩家一局的押注底分，庄家不押注',
  `getScore5` int(11) DEFAULT NULL COMMENT '座位5的玩家的一局得分',
  `getScoreTotal5` int(11) DEFAULT NULL,
  `isRobBanker5` tinyint(2) DEFAULT NULL COMMENT '5号位置上的玩家是否抢庄  自由抢庄时用到',
  `robBankerNum5` tinyint(2) DEFAULT NULL COMMENT '位置5的玩家的抢庄倍率 明牌抢庄的时候用到',
  `player6` varchar(20) DEFAULT NULL COMMENT '座位6的玩家Id',
  `cards6` varchar(40) DEFAULT NULL COMMENT '座位6的玩家的牌信息',
  `cardType6` tinyint(2) DEFAULT NULL COMMENT '6位置的玩家的牌类型',
  `baseScore6` int(2) DEFAULT NULL COMMENT '座位6玩家一局的押注底分，庄家不押注',
  `getScore6` int(11) DEFAULT NULL COMMENT '座位6的玩家的一局得分',
  `getScoreTotal6` int(11) DEFAULT NULL,
  `isRobBanker6` tinyint(2) DEFAULT NULL COMMENT '6号位置上的玩家是否抢庄  自由抢庄时用到',
  `robBankerNum6` tinyint(2) NOT NULL COMMENT '位置6的玩家的抢庄倍率 明牌抢庄的时候用到',
  `updateTime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_game_round_log_h5
-- ----------------------------

-- ----------------------------
-- Table structure for `t_gift_code`
-- ----------------------------
DROP TABLE IF EXISTS `t_gift_code`;
CREATE TABLE `t_gift_code` (
  `id` int(16) NOT NULL,
  `giftCode` varchar(20) NOT NULL DEFAULT '' COMMENT '礼品码',
  `presentDiamond` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '赠送钻石数',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_gift_code
-- ----------------------------

-- ----------------------------
-- Table structure for `t_gift_code_bind_info`
-- ----------------------------
DROP TABLE IF EXISTS `t_gift_code_bind_info`;
CREATE TABLE `t_gift_code_bind_info` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `giftCode` varchar(32) NOT NULL,
  `diamond` int(11) NOT NULL DEFAULT '0' COMMENT '赠送钻石数量',
  `createTime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_gift_code_bind_info
-- ----------------------------

-- ----------------------------
-- Table structure for `t_marquee`
-- ----------------------------
DROP TABLE IF EXISTS `t_marquee`;
CREATE TABLE `t_marquee` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(120) NOT NULL COMMENT '跑马灯内容',
  `voild` int(16) NOT NULL COMMENT '启动  100 禁用 101',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT NULL,
  `pId` tinyint(5) NOT NULL COMMENT ' 每一条跑马灯的序列号 ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_marquee
-- ----------------------------
INSERT INTO `t_marquee` VALUES ('1', '隆重上线的斗牛', '100', '2017-11-01 18:25:49', null, '1');
INSERT INTO `t_marquee` VALUES ('2', '进入这里就等于跌进了坑里，你在也爬不出来了', '100', '2017-11-01 18:26:39', null, '2');
INSERT INTO `t_marquee` VALUES ('3', '珍爱生命 远离赌博', '100', '2017-11-01 18:27:32', null, '3');

-- ----------------------------
-- Table structure for `t_notice`
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(500) NOT NULL COMMENT '公告内容',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_notice
-- ----------------------------
INSERT INTO `t_notice` VALUES ('2', '锣鼓喧天\n竹报平安\n瑞雪纷飞\n人寿年丰\n万家灯火\n合家团圆\n走亲访友\n丰衣足食\n国泰民安\n五彩缤纷', '2018-03-30 14:29:22', '2018-05-11 10:44:29');

-- ----------------------------
-- Table structure for `t_online_taurus`
-- ----------------------------
DROP TABLE IF EXISTS `t_online_taurus`;
CREATE TABLE `t_online_taurus` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `onlineCount` int(11) NOT NULL,
  `gameType` int(4) NOT NULL COMMENT '1:牛牛',
  `updateTime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_online_taurus
-- ----------------------------

-- ----------------------------
-- Table structure for `t_order`
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` varchar(50) NOT NULL COMMENT '订单号',
  `userId` int(11) NOT NULL COMMENT '用户id',
  `diamond` int(11) NOT NULL COMMENT '购买钻石数',
  `amount` int(11) NOT NULL COMMENT '充值金额 单位（分）',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '订单状态 0表示创建 1 成功  2 撤销  3超时',
  `createTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order
-- ----------------------------

-- ----------------------------
-- Table structure for `t_payconfig`
-- ----------------------------
DROP TABLE IF EXISTS `t_payconfig`;
CREATE TABLE `t_payconfig` (
  `id` int(11) NOT NULL,
  `payType` varchar(255) NOT NULL,
  `payName` varchar(255) NOT NULL,
  `minMoney` int(11) NOT NULL,
  `maxMoney` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `sort` int(11) NOT NULL,
  `updateTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `createTime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_payconfig
-- ----------------------------
INSERT INTO `t_payconfig` VALUES ('1', 'wxpay', '微信支付', '10', '5000', '1', '1', '2018-06-05 15:45:58', '2018-06-01 15:24:47');
INSERT INTO `t_payconfig` VALUES ('2', 'remit', '银行卡转账', '0', '100000000', '1', '2', '2018-06-06 09:45:44', '2018-06-01 15:25:29');
INSERT INTO `t_payconfig` VALUES ('3', 'qqpay', 'QQ支付', '10', '100000', '1', '3', '2018-06-05 16:49:05', '2018-06-01 15:26:46');
INSERT INTO `t_payconfig` VALUES ('4', 'alipay', '支付宝支付', '10', '5000', '1', '4', '2018-06-05 09:46:15', '2018-06-01 15:27:37');
INSERT INTO `t_payconfig` VALUES ('5', 'online', '在线网银', '0', '100000000', '1', '5', '2018-06-06 09:44:43', '2018-06-01 15:28:29');
INSERT INTO `t_payconfig` VALUES ('6', 'quick', '快捷支付', '10', '5000', '1', '6', '2018-06-05 09:46:50', '2018-06-01 15:29:44');

-- ----------------------------
-- Table structure for `t_platform_domain_config`
-- ----------------------------
DROP TABLE IF EXISTS `t_platform_domain_config`;
CREATE TABLE `t_platform_domain_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `platformid` int(11) NOT NULL,
  `domainname` varchar(255) NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_platform_domain_config
-- ----------------------------
INSERT INTO `t_platform_domain_config` VALUES ('1', '1', 'http://119.23.154.14/bullplatform', '2018-05-12 14:43:38');

-- ----------------------------
-- Table structure for `t_qq_service`
-- ----------------------------
DROP TABLE IF EXISTS `t_qq_service`;
CREATE TABLE `t_qq_service` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `qqGroup` varchar(11) NOT NULL COMMENT 'qq群',
  `wxPublicAccount` varchar(11) NOT NULL,
  `qqService` varchar(11) NOT NULL,
  `createTime` timestamp NULL DEFAULT NULL,
  `modifyTime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_qq_service
-- ----------------------------
INSERT INTO `t_qq_service` VALUES ('1', '123456', 'ly123456', '888555', '2017-11-29 15:38:45', null);

-- ----------------------------
-- Table structure for `t_room`
-- ----------------------------
DROP TABLE IF EXISTS `t_room`;
CREATE TABLE `t_room` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '房间ID，主键，递增',
  `roomNum` int(7) NOT NULL COMMENT '房间号',
  `roomStatus` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0-游戏未开始 1-游戏已经开始  主要用于判断超时解散房间',
  `roomOwnerId` int(7) NOT NULL COMMENT '创建房间的房主Id',
  `gameTime` int(11) NOT NULL DEFAULT '0' COMMENT '房间的游戏时长',
  `joinGameScoreLimit` int(11) NOT NULL DEFAULT '0' COMMENT '加入俱乐部房间游戏的最低积分',
  `upBankerMode` tinyint(2) NOT NULL DEFAULT '1' COMMENT '上庄模式 默认为牛牛上庄 1-牛牛上庄 2-固定庄家 3-自由抢庄 4-明牌抢庄 5-通比牛牛 6-轮庄牛牛',
  `roundNum` tinyint(2) NOT NULL DEFAULT '10' COMMENT '本房间的局数，10或者20，默认值为10',
  `sitDownNum` int(11) DEFAULT NULL,
  `seatNum` int(11) NOT NULL DEFAULT '6' COMMENT '座位数量',
  `baseScore` int(11) NOT NULL DEFAULT '1' COMMENT '游戏底分 通比牛牛时，不用此项 1-1/2 2-2/4 3-4/8 4-庄家选择',
  `allCompareBaseScore` int(11) NOT NULL DEFAULT '1' COMMENT '通比牛牛的底分选项 选项分别为 1、2、4',
  `payMode` tinyint(2) NOT NULL DEFAULT '0' COMMENT '支付方式 0-房主支付 1-AA支付',
  `timesMode` tinyint(2) NOT NULL DEFAULT '2' COMMENT '翻倍规则 2-牛牛X4 牛九X3 牛八X2 牛七X2  1-牛牛X3 牛九X2 牛八X2',
  `allFace` tinyint(2) NOT NULL DEFAULT '0' COMMENT '五花<5倍>',
  `bomb` tinyint(2) NOT NULL DEFAULT '0' COMMENT '炸弹牛<6倍>',
  `allSmall` tinyint(2) NOT NULL DEFAULT '0' COMMENT '五小牛<8倍>',
  `playerInjection` tinyint(2) NOT NULL DEFAULT '0' COMMENT '闲家推注 取值范围为 0 5 10 20',
  `noEnter` tinyint(2) NOT NULL DEFAULT '0' COMMENT '游戏开始后禁止进入房间',
  `noShuffle` tinyint(2) NOT NULL DEFAULT '0' COMMENT '禁止搓牌',
  `mostRobBanker` tinyint(2) NOT NULL DEFAULT '4' COMMENT '最大抢庄，明牌强壮模式所特有  取值范围为1、2、3、4',
  `upBankerScore` int(11) NOT NULL DEFAULT '0' COMMENT '上庄分数，固定庄家模式所特有 0 50 100 150 200',
  `createTime` datetime NOT NULL,
  `clubId` int(8) NOT NULL DEFAULT '0' COMMENT '0 表示非俱乐部创建房间，其余是俱乐部Id ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_room
-- ----------------------------

-- ----------------------------
-- Table structure for `t_sectionconfig`
-- ----------------------------
DROP TABLE IF EXISTS `t_sectionconfig`;
CREATE TABLE `t_sectionconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `secType` int(11) NOT NULL COMMENT '区间序号',
  `minMoney` int(11) NOT NULL COMMENT '最低金额 >',
  `maxMoney` int(11) NOT NULL COMMENT '最大金额 <=',
  `scale` int(11) NOT NULL COMMENT '比例',
  `updateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `createTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sectionconfig
-- ----------------------------
INSERT INTO `t_sectionconfig` VALUES ('1', '1', '0', '3280', '100', '2018-06-05 17:15:13', '2018-05-29 14:49:01');
INSERT INTO `t_sectionconfig` VALUES ('2', '2', '3280', '5000', '95', '2018-06-05 17:15:13', '2018-05-29 14:49:33');
INSERT INTO `t_sectionconfig` VALUES ('3', '3', '5000', '10000', '90', '2018-06-05 17:15:13', '2018-05-29 14:50:09');
INSERT INTO `t_sectionconfig` VALUES ('4', '4', '10000', '10001', '85', '2018-06-05 17:15:13', '2018-05-29 14:50:40');
INSERT INTO `t_sectionconfig` VALUES ('5', '5', '10001', '10001', '80', '2018-06-05 17:15:13', '2018-05-29 14:51:06');

-- ----------------------------
-- Table structure for `t_statistics_day_report`
-- ----------------------------
DROP TABLE IF EXISTS `t_statistics_day_report`;
CREATE TABLE `t_statistics_day_report` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `userNumber` int(11) NOT NULL DEFAULT '0' COMMENT '有效人数',
  `roomNumber` int(11) NOT NULL DEFAULT '0' COMMENT '开房有效数量',
  `roundNumber` int(11) NOT NULL DEFAULT '0' COMMENT '有效局数',
  `diamondNumber` int(11) NOT NULL COMMENT '钻石消耗',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_statistics_day_report
-- ----------------------------
INSERT INTO `t_statistics_day_report` VALUES ('30', '0', '0', '0', '0', '2018-06-06 23:59:59');
INSERT INTO `t_statistics_day_report` VALUES ('31', '0', '0', '0', '0', '2018-06-07 23:59:59');
INSERT INTO `t_statistics_day_report` VALUES ('32', '0', '0', '0', '0', '2018-06-08 23:59:59');
INSERT INTO `t_statistics_day_report` VALUES ('33', '0', '0', '0', '0', '2018-06-09 23:59:59');
INSERT INTO `t_statistics_day_report` VALUES ('34', '0', '0', '0', '0', '2018-06-10 23:59:59');
INSERT INTO `t_statistics_day_report` VALUES ('35', '0', '0', '0', '0', '2018-06-11 23:59:59');

-- ----------------------------
-- Table structure for `t_statistics_newuserlog`
-- ----------------------------
DROP TABLE IF EXISTS `t_statistics_newuserlog`;
CREATE TABLE `t_statistics_newuserlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gametype` int(4) NOT NULL COMMENT '游戏类型 1：牛牛',
  `roomNumber` int(4) NOT NULL COMMENT '每天新增人数在单项产品开房',
  `roundNumber` int(4) NOT NULL COMMENT '每天新增人数在单项产品局数',
  `createTime` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_statistics_newuserlog
-- ----------------------------
INSERT INTO `t_statistics_newuserlog` VALUES ('25', '1', '0', '0', '2018-06-07 02:00:00');
INSERT INTO `t_statistics_newuserlog` VALUES ('26', '1', '0', '0', '2018-06-08 02:00:00');
INSERT INTO `t_statistics_newuserlog` VALUES ('27', '1', '0', '0', '2018-06-09 02:00:00');
INSERT INTO `t_statistics_newuserlog` VALUES ('28', '1', '0', '0', '2018-06-10 02:00:00');
INSERT INTO `t_statistics_newuserlog` VALUES ('29', '1', '0', '0', '2018-06-11 02:00:00');
INSERT INTO `t_statistics_newuserlog` VALUES ('30', '1', '0', '0', '2018-06-12 02:00:00');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `userId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `phoneNum` bigint(11) DEFAULT NULL COMMENT '玩家登陆时的手机号',
  `platformId` int(11) DEFAULT '0' COMMENT '平台id',
  `userName` varchar(64) DEFAULT NULL COMMENT '平台用户的用户名',
  `wxId` varchar(64) DEFAULT NULL COMMENT '微信的Id',
  `sex` tinyint(2) NOT NULL COMMENT '微信性别',
  `nickName` varchar(64) NOT NULL COMMENT '微信昵称',
  `headImgUrl` varchar(255) NOT NULL COMMENT '微信头像url',
  `loginAddress` varchar(255) DEFAULT NULL COMMENT '最新登录的地理位置',
  `registerIp` varchar(255) DEFAULT NULL COMMENT '最新登录的Ip',
  `loginIp` varchar(255) DEFAULT NULL,
  `diamond` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '玩家在游戏内的钻石',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '玩家金币数',
  `roundNum` int(11) NOT NULL DEFAULT '0' COMMENT '已玩局数',
  `registerTime` datetime NOT NULL COMMENT '注册时间',
  `loginTime` datetime NOT NULL COMMENT '最后的更新时间',
  `sessionId` varchar(64) DEFAULT '' COMMENT '用于自动登录时使用',
  `isFrozen` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否冻结，0-未冻结 1-冻结',
  `inviteCode` int(11) DEFAULT '0' COMMENT '推广码,代理模式下，玩家的上级玩家的邀请码,邀请码为玩家的id',
  `tableNum` varchar(10) DEFAULT NULL COMMENT '保存玩家的进入房间信息，用于处理玩家掉线后再次登录提示玩家“牌局结束”',
  `isProxy` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否代理',
  `applyClubCount` int(11) DEFAULT '0' COMMENT '正在申请加入俱乐部的数量（没有得到具体答复）',
  `clubCount` int(11) DEFAULT '0' COMMENT '已经加入俱乐部的数量（和正在申请的一起<=5）',
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------

-- ----------------------------
-- Procedure structure for `Pro_AddClud_daysum_diamond`
-- ----------------------------
DROP PROCEDURE IF EXISTS `Pro_AddClud_daysum_diamond`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Pro_AddClud_daysum_diamond`()
begin
		declare _baseD bigint default 6;						#房主支付钻石的基数
		declare _AAD bigint default 2;						  #AA支付钻石的基数
		declare _clubId int default 0;
		declare _diamondSum bigint default 0;					#钻石总数

		declare _playSZ bigint default 0;					#牛牛上庄钻石总数
		declare _playGD bigint default 0;					#固定庄家钻石总数
		declare _playZY bigint default 0;					#自由抢庄钻石总数
		declare _playMP bigint default 0;					#明牌抢庄钻石总数
		declare _playTB bigint default 0;					#通比牛牛钻石总数
		declare _playLZ bigint default 0;				  #通比牛牛钻石总数

	 	#创建结束标志变量  
		declare done int default false;

		declare _startDate varchar(50) default CONCAT(DATE_SUB(DATE_SUB(CURDATE(),interval 0 day), interval 1 day),' 00:00:00');	#当前时间前一天 开始
		declare _endDate varchar(50) default CONCAT(DATE_SUB(CURDATE(), interval 1 day),' 23:59:59');		#当前时间前一天 结束

		#创建游标
 		declare cur cursor for SELECT clubId  from t_game_room_log where clubId > 0  and createTime between _startDate and _endDate  GROUP BY clubId;
	
		#指定游标循环结束时的返回值
		declare continue handler for not found set done = TRUE; 

		#打开游标  
		open cur;  
		#开始循环游标里的数据  
		read_loop:loop 
		#根据游标当前指向的一条数据  
		fetch cur into _clubId;
		if done then  
				leave read_loop;    #跳出游标循环  
		end if;  

				/*
				上庄模式 默认为牛牛上庄 1-牛牛上庄 2-固定庄家 3-自由抢庄 4-明牌抢庄 5-通比牛牛 6-轮庄牛牛
				*/
				SELECT sum(diamond) into _diamondSum from t_club_diamond_log where clubId = _clubId AND createTime between _startDate and _endDate;

				SELECT sum(diamond) into _playSZ  from t_club_diamond_log WHERE 1=1 and clubId = _clubId and  roomNum in (SELECT roomNum FROM t_game_room_log where clubId = _clubId AND updateTime between _startDate and _endDate and bankerMode=1);
				SELECT sum(diamond) into _playGD  from t_club_diamond_log WHERE 1=1 and clubId = _clubId and  roomNum in (SELECT roomNum FROM t_game_room_log where clubId = _clubId AND updateTime between _startDate and _endDate and bankerMode=2);
				SELECT sum(diamond) into _playZY  from t_club_diamond_log WHERE 1=1 and clubId = _clubId and  roomNum in (SELECT roomNum FROM t_game_room_log where clubId = _clubId AND updateTime between _startDate and _endDate and bankerMode=3);
				SELECT sum(diamond) into _playMP  from t_club_diamond_log WHERE 1=1 and clubId = _clubId and  roomNum in (SELECT roomNum FROM t_game_room_log where clubId = _clubId AND updateTime between _startDate and _endDate and bankerMode=4);
				SELECT sum(diamond) into _playTB  from t_club_diamond_log WHERE 1=1 and clubId = _clubId and  roomNum in (SELECT roomNum FROM t_game_room_log where clubId = _clubId AND updateTime between _startDate and _endDate and bankerMode=5);
				SELECT sum(diamond) into _playLZ  from t_club_diamond_log WHERE 1=1 and clubId = _clubId and  roomNum in (SELECT roomNum FROM t_game_room_log where clubId = _clubId AND updateTime between _startDate and _endDate and bankerMode=6);
				/*
				SELECT (count(*)* _baseD) into _diamondSum from t_game_log where clubId = _clubId AND createTime between _startDate and _endDate;
				SELECT (count(*)* _baseD) into _playSZ from t_game_log where clubId = _clubId AND bankerMode =1 AND createTime between _startDate and _endDate;
				SELECT (count(*)* _baseD) into _playGD from t_game_log where clubId = _clubId AND bankerMode =2 AND createTime between _startDate and _endDate;
				SELECT (count(*)* _baseD) into _playZY from t_game_log where clubId = _clubId AND bankerMode =3 AND createTime between _startDate and _endDate;
				SELECT (count(*)* _baseD) into _playMP from t_game_log where clubId = _clubId AND bankerMode =4 AND createTime between _startDate and _endDate;
				SELECT (count(*)* _baseD) into _playTB from t_game_log where clubId = _clubId AND bankerMode =5 AND createTime between _startDate and _endDate;
				SELECT (count(*)* _baseD) into _playLZ from t_game_log where clubId = _clubId AND bankerMode =6 AND createTime between _startDate and _endDate;
				*/
				#diamondType钻石类型:1消耗
				#type类别：1个人，2俱乐部
				INSERT INTO sys_daysum_diamond(type,typeId,diamond,diamondType,createTime,playSZ,playGD,playZY,playMP,playTB,playLZ)
				VALUES(2,_clubId,_diamondSum,1,_endDate,_playSZ,_playGD,_playZY,_playMP,_playTB,_playLZ);

		#结束游标循环  
		end loop;
		#关闭游标  
		close cur;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `Pro_AddStatisticsDayReport`
-- ----------------------------
DROP PROCEDURE IF EXISTS `Pro_AddStatisticsDayReport`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Pro_AddStatisticsDayReport`()
begin

		declare _startdate varchar(19) default date_format(date_sub(curdate(),interval 1 day),'%Y-%m-%d 00:00:00');
		declare _enddate varchar(19) default  date_format(date_sub(curdate(),interval 1 day),'%Y-%m-%d 23:59:59');
		
		declare _userNumber bigint default 0;  	#日有效人数
		declare _roomNumber bigint default 0;		#日有效开房数
		declare _roundNumber bigint default 0; 	#日有效局数
		declare _sumDiamond bigint default 0;		#钻石消耗
		
		drop table if exists list;  
		create temporary table list(playerId INT not null);


		/*
	SELECT playerId1 ,playerId2 ,playerId3 ,playerId4 ,playerId5 ,playerId6
	FROM t_game_log GROUP BY playerId1 ,playerId2 ,playerId3 ,playerId4 ,playerId5 ,playerId6;
	WHERE createTime BETWEEN _startDate and _endDate
	*/
		# 好友场的有效人数
		INSERT INTO list SELECT playerId1 as playerId FROM t_game_log WHERE createTime BETWEEN _startDate and _endDate and playerId1 IS NOT NULL GROUP BY playerId1;
		INSERT INTO list SELECT playerId2 as playerId FROM t_game_log WHERE createTime BETWEEN _startDate and _endDate and playerId2 IS NOT NULL GROUP BY playerId2;
		INSERT INTO list SELECT playerId3 as playerId FROM t_game_log WHERE createTime BETWEEN _startDate and _endDate and playerId3 IS NOT NULL GROUP BY playerId3;
		INSERT INTO list SELECT playerId4 as playerId FROM t_game_log WHERE createTime BETWEEN _startDate and _endDate and playerId4 IS NOT NULL GROUP BY playerId4;
		INSERT INTO list SELECT playerId5 as playerId FROM t_game_log WHERE createTime BETWEEN _startDate and _endDate and playerId5 IS NOT NULL GROUP BY playerId5;
		INSERT INTO list SELECT playerId6 as playerId FROM t_game_log WHERE createTime BETWEEN _startDate and _endDate and playerId6 IS NOT NULL GROUP BY playerId6;
		# 俱乐部的有效人数
		INSERT INTO list SELECT playerId FROM t_game_player_log where updateTime BETWEEN _startDate and _endDate  group by playerId;
		# 好友场+俱乐部 合并去重
		SELECT count(*) into _userNumber from(SELECT * from  list group by playerId) as tb;
		

		SELECT count(*) into _roomNumber from t_game_room_log where createTime between _startDate and _endDate;
		
		SELECT SUM(playedRound) into _roundNumber from t_game_room_log where createTime between _startDate and _endDate ;
		if _roundNumber is NULL 
		THEN
			set _roundNumber = 0;
		END IF;

		SELECT SUM(changedDiamond) into _sumDiamond FROM t_diamond_log  where changedType  in (1,3,4,5,6) and  updateTime between _startDate and _endDate;
		if _sumDiamond is NULL 
		THEN
				set _sumDiamond = 0;
		END IF;

		INSERT INTO t_statistics_day_report (userNumber,roomNumber,roundNumber,diamondNumber,createTime) VALUES (_userNumber,_roomNumber,_roundNumber,_sumDiamond,_endDate);

		#SELECT * FROM t_statistics_day_report
		#call Pro_AddStatisticsDayReport()
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `Pro_AddStatistics_newuser`
-- ----------------------------
DROP PROCEDURE IF EXISTS `Pro_AddStatistics_newuser`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Pro_AddStatistics_newuser`()
begin

		declare _startdate varchar(19) default date_format(date_sub(curdate(),interval 1 day),'%Y-%m-%d 00:00:00');
		declare _enddate varchar(19) default date_format(date_sub(curdate(),interval 1 day),'%Y-%m-%d 23:59:59');
		declare _gametype bigint default 1;  -- 游戏类型：1牛牛
		declare _roomNumber bigint default 0;	-- 开房数
		declare _roundNumber bigint default 0; -- 开局数

		
		# 个人好友场 根据新增玩家匹配开房记录的房主 得出开房数
		SELECT count(distinct(roomNum)) into _roomNumber FROM t_game_log where createTime  between _startDate and _endDate 
					 and roomOwnerId in (SELECT distinct(userId) FROM t_user where registerTime between _startDate and _endDate);
		
		# 俱乐部开房数
		SELECT count(distinct(roomNum))+ _roomNumber  into _roomNumber FROM t_game_player_log WHERE updateTime  between _startDate and _endDate  
					AND playerId in (SELECT distinct(userId) FROM t_user where registerTime between _startDate and _endDate);


		# distinct 作用去重
		# 个人开局数，根据新增玩家匹配开局记录中六个位置的数据，得出局数统计
		SELECT count(distinct(roundIndex)) into _roundNumber from  t_game_round_log where updateTime between _startDate and _endDate
		 and ( 	 player1 in (SELECT distinct(userId) FROM t_user where registerTime between _startDate and _endDate) 
					or player2 in (SELECT distinct(userId) FROM t_user where registerTime between _startDate and _endDate) 
					or player3 in (SELECT distinct(userId) FROM t_user where registerTime between _startDate and _endDate) 
					or player4 in (SELECT distinct(userId) FROM t_user where registerTime between _startDate and _endDate) 
					or player5 in (SELECT distinct(userId) FROM t_user where registerTime between _startDate and _endDate) 
					or player6 in (SELECT distinct(userId) FROM t_user where registerTime between _startDate and _endDate) 
					);
		
		# 俱乐部的数据
		SELECT count(distinct(round))+ _roundNumber into _roundNumber FROM t_game_round_log_h5 where updateTime between _startDate and _endDate 
					and (	player1 in (SELECT distinct(userId) FROM t_user where registerTime between _startDate and _endDate) 
					or player2 in (SELECT distinct(userId) FROM t_user where registerTime between _startDate and _endDate) 
					or player3 in (SELECT distinct(userId) FROM t_user where registerTime between _startDate and _endDate) 
					or player4 in (SELECT distinct(userId) FROM t_user where registerTime between _startDate and _endDate) 
					or player5 in (SELECT distinct(userId) FROM t_user where registerTime between _startDate and _endDate) 
					or player6 in (SELECT distinct(userId) FROM t_user where registerTime between _startDate and _endDate) 
					);

	INSERT INTO t_statistics_newuserlog (gametype,roomNumber,roundNumber,createTime)VALUES (_gametype,_roomNumber,_roundNumber,NOW());
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `Pro_AddUser`
-- ----------------------------
DROP PROCEDURE IF EXISTS `Pro_AddUser`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Pro_AddUser`(
		/*
			创建人：刘晓博
			创建时间：2017-05-31
			功能描述：新增系统用户
			参数说明：（$UserName:用户名称，$UserPassWord:用户密码,$UserNickName:用户昵称，$UserType:用户类型,$RegistIP:注册IP,$Valid:用户状态,$NewId:新用户Id）
		*/
	in $UserName varchar(50),
	in $UserPassWord varchar(200),
	in $UserNickName varchar(50),
	in $UserType int,
	in $RegistIP varchar(50),
	in $Valid int,
	out $NewId int
)
begin 
		insert into sys_user(UserName,UserPassWord,UserNickName,UserType,RegistIP,Valid,CreateDate)
		values($UserName,$UserPassWord,$UserNickName,$UserType,$RegistIP,$Valid,NOW());
		set $NewId=@@identity;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `Pro_del_game_log`
-- ----------------------------
DROP PROCEDURE IF EXISTS `Pro_del_game_log`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Pro_del_game_log`()
BEGIN
delete from t_game_round_log where updateTime <= date_add(now(), interval -2 day); 
delete from t_game_log where updateTime <= date_add(now(), interval -2 day); 
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `Pro_GetUserInfo`
-- ----------------------------
DROP PROCEDURE IF EXISTS `Pro_GetUserInfo`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Pro_GetUserInfo`(
		/*
			创建人：刘晓博
			创建时间：2017-05-27
			功能描述：根据用户名称和密码获取管理员信息
			参数说明：（UName:用户名称，UPwd:用户密码）
		*/
		in UName varchar(20),
		in UPwd varchar(100)
)
begin  
		select * from sys_user where UserName=UName and UserPassWord=UPwd;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `Pro_GetUserInfoById`
-- ----------------------------
DROP PROCEDURE IF EXISTS `Pro_GetUserInfoById`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Pro_GetUserInfoById`(
		/*
			创建人：刘晓博
			创建时间：2017-05-27
			功能描述：根据用户Id获取管理员信息
			参数说明：（UId:用户Id）
		*/
		in UId int
)
begin  
		select * from sys_user where Id=UId;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `Pro_UpdateUserLoginInfo`
-- ----------------------------
DROP PROCEDURE IF EXISTS `Pro_UpdateUserLoginInfo`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Pro_UpdateUserLoginInfo`(
		/*
			创建人：刘晓博
			创建时间：2017-05-27
			功能描述：根据用户Id更新用户登录信息
			参数说明：（UId:用户Id，UIP:用户IP）
		*/
		in UId int,
		in UIP varchar(20)
)
begin  
		update sys_user set LoginDate=NOW(),LoginIP=UIP where Id=UId;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `Pro_UpdateUserPWd`
-- ----------------------------
DROP PROCEDURE IF EXISTS `Pro_UpdateUserPWd`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Pro_UpdateUserPWd`(
		/*
			创建人：刘晓博
			创建时间：2017-05-27
			功能描述：根据用户Id更新密码
			参数说明：（UId:用户Id，PWd:用户密码）
		*/
		in UId int,
		in PWd varchar(100)
)
begin  
		update sys_user set ModifyDate=NOW(),UserPassWord=PWd where Id=UId;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `Pro_UpdateUserValid`
-- ----------------------------
DROP PROCEDURE IF EXISTS `Pro_UpdateUserValid`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Pro_UpdateUserValid`(
		/*
			创建人：刘晓博
			创建时间：2017-05-27
			功能描述：根据用户Id更新状态
			参数说明：（UId:用户Id，VId:用户状态）
		*/
		in UId int,
		in VId int
)
begin  
		update sys_user set ModifyDate=NOW(),Valid=VId where Id=UId;
end
;;
DELIMITER ;

-- ----------------------------
-- Event structure for `ReportTable_Clud_daysum_diamond`
-- ----------------------------
DROP EVENT IF EXISTS `ReportTable_Clud_daysum_diamond`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` EVENT `ReportTable_Clud_daysum_diamond` ON SCHEDULE EVERY 1 DAY STARTS '2018-05-12 02:00:00' ON COMPLETION PRESERVE ENABLE DO begin
	
	call Pro_AddClud_daysum_diamond();  #俱乐部钻石消耗统计
	
	call Pro_AddStatistics_newuser();		#每日新增数据
		
	call Pro_AddStatisticsDayReport();  #每日统计的数据
end
;;
DELIMITER ;

-- ----------------------------
-- Event structure for `ReportTable_VIP`
-- ----------------------------
DROP EVENT IF EXISTS `ReportTable_VIP`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` EVENT `ReportTable_VIP` ON SCHEDULE EVERY 1 DAY STARTS '2017-11-30 00:00:00' ON COMPLETION PRESERVE ENABLE COMMENT '删除两天之前的游戏记录、每天凌晨00:00执行' DO call Pro_del_game_log()
;;
DELIMITER ;
