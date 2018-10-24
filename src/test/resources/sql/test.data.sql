/*
drop database eshop2 ;
create database eshop2 charset utf8 ;
use eshop2 ;
*/


LOCK TABLES tu_fun WRITE;
INSERT INTO tu_fun VALUES (1,0,'2018-06-14 17:00:47.000000','Root',0,'','','公司','',''),
(2,0,'2018-06-14 17:00:47.000000','Root',1,'','','公司业务','','app/user/com.view.js'),
(3,0,'2018-06-14 17:00:47.000000','Root',1,'','','程序功能','','app/user/fun.view.js'),
(4,0,'2018-06-14 17:00:47.000000','user',0,'','','用户管理','',''),
(5,0,'2018-06-14 17:00:47.000000','user',4,'','','用户','','app/user/user.view.js'),
(6,0,'2018-06-14 17:00:47.000000','user',4,'','','角色','','app/user/role.view.js'),
(7,0,'2018-06-14 17:00:47.000000','user',4,'','','站点','','app/user/store.view.js'),
(8,0,'2018-06-14 17:00:47.000000','goods',0,'','','商品信息','',''),
(9,0,'2018-06-14 17:00:47.000000','goods',8,'','','商品属性','','app/goods/goodsTree.view.js'),
(10,0,'2018-06-14 17:00:47.000000','goods',8,'','','商品库存','','app/kc/goods.kc.view.js'),
(11,0,'2018-06-14 17:00:47.000000','goods',8,'','','商品价格','','app/goods/goodsPrice.view.js'),
(12,0,'2018-06-14 17:00:47.000000','goods',8,'','','站点价格','','app/goods/goodsStorePrice.view.js');
UNLOCK TABLES;

LOCK TABLES tu_role WRITE;
INSERT INTO tu_role VALUES (1,0,'2018-07-18 14:49:58.036000','Root',1);
UNLOCK TABLES;

LOCK TABLES tu_role_fun WRITE;
INSERT INTO tu_role_fun VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12);
UNLOCK TABLES;


LOCK TABLES tu_com WRITE;
INSERT INTO tu_com VALUES (1,0,'2018-07-18 14:49:35.517000','北京大六环',1,'cc',0,false,false,'2018-07-18 14:49:35.517000','MyShop',10,2,'18613806246',NULL,20,10,'2018-07-18 14:49:35.517000',10,1,'_end');
UNLOCK TABLES;


LOCK TABLES tu_store WRITE;
INSERT INTO tu_store(id,b_isDel,b_wtime,addr,isCenter,isHasKc,isHasLensKc,isZhanDianJia,isZhiYing,name,phone,phote,pinYin,py,comid)
 VALUES (1,0,'2018-07-18 14:49:50.189000','北京shop-1',true,true,true,false,true,'ShopStore-1','186138061',NULL,'ShopStore-1','ShopStore-1',1) ;
UNLOCK TABLES;


LOCK TABLES tu_user WRITE;
INSERT INTO tu_user (id,b_isdel,b_wtime,addr,brithday,loginname,name,password,phone,photo,userType,xue_li,zhi_wu,comid,roleid,storeid)
VALUES (1,0,'2018-07-18 14:50:08.813000','北京','2001-01-01 00:00:00.000000','cc','cc','E0323A9039ADD2978BF5B49550572C7C','18613806246',NULL,'normal','小学','CEO',1,1,1);
UNLOCK TABLES;


LOCK TABLES tg_goodstree WRITE;
INSERT INTO tg_goodstree VALUES (1,0,'2018-07-25 10:36:17.340000','true','true','false','','','品类',1,0,'JingPian','JP','镜片',1),(2,0,'2018-07-25 10:44:07.258000','false','true','false','','','品类',1,0,'JingJia','JJ','镜架',1),(3,0,'2018-07-25 10:44:59.688000','false','true','false','','','品类',1,0,'TaiYangJing','TYJ','太阳镜',1),(4,1,'2018-07-25 10:45:15.792000','true','true','false','','','品类',1,0,'HuaJing','HJ','老花镜',1),(5,1,'2018-07-25 10:45:42.523000','true','true','true','','','品类',1,0,'YinXing','YX','隐形',1),(6,0,'2018-07-25 10:46:16.709000','','','','','','品牌',2,1,'CaiSi','CS','蔡司',1),(7,0,'2018-07-25 10:46:37.172000','','','','','','型号',3,6,'1.50','1.50','1.50',1),(8,0,'2018-07-26 13:34:32.988000','','','','','','颜色',4,7,'WuSe','WS','防蓝光',1),(9,0,'2018-08-08 13:50:00.634000','','','','','','品牌',2,1,'YiShiLu','YSL','依士路',1),(10,0,'2018-08-08 13:50:08.887000','','','','','','型号',3,9,'QingMing','QM','清明',1),(11,0,'2018-08-08 13:50:19.893000','','','','','','颜色',4,10,'ShuiJingMo','SJM','水晶膜',1);
UNLOCK TABLES;

LOCK TABLES tg_goodsattrsetup WRITE;
INSERT INTO tg_goodsattrsetup VALUES (1,0,'2018-07-25 10:36:17.458000','select','a1','镀膜','无膜;蓝膜;绿膜;钻石膜;莲花膜',1),(2,0,'2018-07-25 10:36:17.458000','select','a2','折射率','1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16;17;18;19;20;21;22;23;24;25;26;27;28;29;30;31;32;33;34;35;36;37;38;39;40;41;42;43;44;45;46;47;48;49;50;51;52;53;54;55;56;57;58;59;60;61;62;63;64;65;66',1),(3,0,'2018-07-25 10:36:17.458000','text','a3',NULL,'',1),(4,0,'2018-07-25 10:36:17.458000','text','a4',NULL,'',1),(5,0,'2018-07-25 10:36:17.458000','text','a5',NULL,'',1),(6,0,'2018-07-25 10:36:17.458000','text','a6',NULL,'',1),(7,0,'2018-07-25 10:36:17.458000','text','a7',NULL,'',1),(8,0,'2018-07-25 10:36:17.458000','text','a8',NULL,'',1),(9,0,'2018-07-25 10:36:17.458000','text','a9',NULL,'',1),(10,0,'2018-07-25 10:36:17.458000','text','a10',NULL,'',1),(11,0,'2018-07-25 10:36:17.458000','text','a11',NULL,'',1),(12,0,'2018-07-25 10:36:17.458000','text','a12',NULL,'',1),(13,0,'2018-07-25 10:36:17.458000','text','a13',NULL,'',1),(14,0,'2018-07-25 10:36:17.458000','text','a14',NULL,'',1),(15,0,'2018-07-25 10:36:17.458000','text','a15',NULL,'',1),(16,0,'2018-07-25 10:44:07.265000','text','a1',NULL,'',2),(17,0,'2018-07-25 10:44:07.265000','text','a2',NULL,'',2),(18,0,'2018-07-25 10:44:07.265000','text','a3',NULL,'',2),(19,0,'2018-07-25 10:44:07.265000','text','a4',NULL,'',2),(20,0,'2018-07-25 10:44:07.265000','text','a5',NULL,'',2),(21,0,'2018-07-25 10:44:07.265000','text','a6',NULL,'',2),(22,0,'2018-07-25 10:44:07.265000','text','a7',NULL,'',2),(23,0,'2018-07-25 10:44:07.265000','text','a8',NULL,'',2),(24,0,'2018-07-25 10:44:07.265000','text','a9',NULL,'',2),(25,0,'2018-07-25 10:44:07.265000','text','a10',NULL,'',2),(26,0,'2018-07-25 10:44:07.265000','text','a11',NULL,'',2),(27,0,'2018-07-25 10:44:07.265000','text','a12',NULL,'',2),(28,0,'2018-07-25 10:44:07.265000','text','a13',NULL,'',2),(29,0,'2018-07-25 10:44:07.265000','text','a14',NULL,'',2),(30,0,'2018-07-25 10:44:07.265000','text','a15',NULL,'',2),(31,0,'2018-07-25 10:44:59.699000','text','a1',NULL,'',3),(32,0,'2018-07-25 10:44:59.699000','text','a2',NULL,'',3),(33,0,'2018-07-25 10:44:59.699000','text','a3',NULL,'',3),(34,0,'2018-07-25 10:44:59.699000','text','a4',NULL,'',3),(35,0,'2018-07-25 10:44:59.699000','text','a5',NULL,'',3),(36,0,'2018-07-25 10:44:59.699000','text','a6',NULL,'',3),(37,0,'2018-07-25 10:44:59.699000','text','a7',NULL,'',3),(38,0,'2018-07-25 10:44:59.699000','text','a8',NULL,'',3),(39,0,'2018-07-25 10:44:59.699000','text','a9',NULL,'',3),(40,0,'2018-07-25 10:44:59.699000','text','a10',NULL,'',3),(41,0,'2018-07-25 10:44:59.699000','text','a11',NULL,'',3),(42,0,'2018-07-25 10:44:59.699000','text','a12',NULL,'',3),(43,0,'2018-07-25 10:44:59.699000','text','a13',NULL,'',3),(44,0,'2018-07-25 10:44:59.699000','text','a14',NULL,'',3),(45,0,'2018-07-25 10:44:59.699000','text','a15',NULL,'',3),(46,0,'2018-07-25 10:45:15.808000','text','a1',NULL,'',4),(47,0,'2018-07-25 10:45:15.808000','text','a2',NULL,'',4),(48,0,'2018-07-25 10:45:15.808000','text','a3',NULL,'',4),(49,0,'2018-07-25 10:45:15.808000','text','a4',NULL,'',4),(50,0,'2018-07-25 10:45:15.808000','text','a5',NULL,'',4),(51,0,'2018-07-25 10:45:15.808000','text','a6',NULL,'',4),(52,0,'2018-07-25 10:45:15.808000','text','a7',NULL,'',4),(53,0,'2018-07-25 10:45:15.808000','text','a8',NULL,'',4),(54,0,'2018-07-25 10:45:15.808000','text','a9',NULL,'',4),(55,0,'2018-07-25 10:45:15.808000','text','a10',NULL,'',4),(56,0,'2018-07-25 10:45:15.808000','text','a11',NULL,'',4),(57,0,'2018-07-25 10:45:15.808000','text','a12',NULL,'',4),(58,0,'2018-07-25 10:45:15.808000','text','a13',NULL,'',4),(59,0,'2018-07-25 10:45:15.808000','text','a14',NULL,'',4),(60,0,'2018-07-25 10:45:15.808000','text','a15',NULL,'',4),(61,0,'2018-07-25 10:45:42.534000','text','a1',NULL,'',5),(62,0,'2018-07-25 10:45:42.534000','text','a2',NULL,'',5),(63,0,'2018-07-25 10:45:42.534000','text','a3',NULL,'',5),(64,0,'2018-07-25 10:45:42.535000','text','a4',NULL,'',5),(65,0,'2018-07-25 10:45:42.535000','text','a5',NULL,'',5),(66,0,'2018-07-25 10:45:42.535000','text','a6',NULL,'',5),(67,0,'2018-07-25 10:45:42.535000','text','a7',NULL,'',5),(68,0,'2018-07-25 10:45:42.535000','text','a8',NULL,'',5),(69,0,'2018-07-25 10:45:42.535000','text','a9',NULL,'',5),(70,0,'2018-07-25 10:45:42.535000','text','a10',NULL,'',5),(71,0,'2018-07-25 10:45:42.535000','text','a11',NULL,'',5),(72,0,'2018-07-25 10:45:42.535000','text','a12',NULL,'',5),(73,0,'2018-07-25 10:45:42.535000','text','a13',NULL,'',5),(74,0,'2018-07-25 10:45:42.535000','text','a14',NULL,'',5),(75,0,'2018-07-25 10:45:42.535000','text','a15',NULL,'',5);
UNLOCK TABLES;



LOCK TABLES tsys_setup WRITE;
INSERT INTO tsys_setup  (id,b_isDel,b_wtime,name,note,val) VALUES (1,0,'2018-07-27 11:53:32.000000','添加商品时是否添加价格','添加商品时是否添加价格','1');
insert into tsys_setup  (id,b_isDel,b_wtime,name,note,val) values (2,0,now(),'添加商品时初始化库存','添加商品时初始化库存','1') ;
UNLOCK TABLES;


LOCK TABLES tsys_setupcom WRITE;
INSERT INTO tsys_setupcom (id,b_isDel,b_wtime,name,note,val,ext1,ext2,comid) VALUES (1,false,now(),'save_not_lens_add_price','添加成品商品时添加价格','true','10','20',1);
insert into tsys_setupcom (id,b_isDel,b_wtime,name,note,val,ext1,comid) values (2,false,now(),'save_not_lens_add_kc','添加成品商品时初始化库存','true','20',1) ;
insert into tsys_setupcom (id,b_isDel,b_wtime,name,note,val,ext1,ext2,comid) values (3,false,now(),'save_lens_add_price','添加度数商品时添加添加默认价格0','true','10','20',1) ;
insert into tsys_setupcom (id,b_isDel,b_wtime,name,note,val,ext1,comid) values (4,false,now(),'save_lens_add_kc','添加度数商品时添加默认库存0','true','20',1) ;
UNLOCK TABLES;


LOCK TABLES tu_message WRITE;
INSERT INTO tu_message VALUES (1,0,'2018-07-18 17:41:27.450000','GeRen',false,'个人信息详细','个人信息',1),(2,0,'2018-07-18 17:41:27.481000','ZhanDian',false,'站点信息详细','站点信息',1),(3,0,'2018-07-18 17:41:27.484000','JiaoSe',false,'角色信息详细','角色信息',1);
UNLOCK TABLES;



INSERT INTO tk_yw VALUES ('1', '0', '2018-06-15 14:00:18.000000', '0',          '添加商品时，添加商品默认库存', '默认', '添加商品默认库存', '+');
INSERT INTO tk_yw VALUES ('2', '0', '2018-06-15 14:00:18.000000', '100001001', '盘点后，正品盘盈，添加库存', '正品', '盘点添加正品', '+');
INSERT INTO tk_yw VALUES ('3', '0', '2018-06-15 14:00:18.000000', '100001002', '盘点后，次品盘盈，添加库存', '次品', '盘点添加次品', '+');
INSERT INTO tk_yw VALUES ('4', '0', '2018-06-15 14:00:18.000000', '100001003', '盘点后，残品盘盈，添加库存', '残品', '盘点添加残品', '+');
INSERT INTO tk_yw VALUES ('5', '0', '2018-06-15 14:00:18.000000', '100002001', '购入入库', '正品', '入库正品', '+');
INSERT INTO tk_yw VALUES ('6', '0', '2018-06-15 14:00:18.000000', '100002002', '正品转次', '次品', '正品转次', '+');
INSERT INTO tk_yw VALUES ('7', '0', '2018-06-15 14:00:19.000000', '100002003', '次品转残', '残品', '次品转残', '+');
INSERT INTO tk_yw VALUES ('8', '0', '2018-06-15 14:00:19.000000', '100002004', '赠品转正', '正品', '赠品转正', '+');
INSERT INTO tk_yw VALUES ('9', '0', '2018-06-15 14:00:19.000000', '100003001', '正品调拨入库', '正品', '调拨正品入库', '+');
INSERT INTO tk_yw VALUES ('10', '0', '2018-06-15 14:00:19.000000', '100003002', '次品调拨入库', '次品', '调拨次品入库', '+');
INSERT INTO tk_yw VALUES ('11', '0', '2018-06-15 14:00:19.000000', '100003003', '残品调拨入库', '残品', '调拨残品入库', '+');
INSERT INTO tk_yw VALUES ('12', '0', '2018-06-15 14:00:19.000000', '100004001', '结算后退货，商品没有改变', '正品', '结算退货', '+');
INSERT INTO tk_yw VALUES ('13', '0', '2018-06-15 14:00:19.000000', '100004002', '配送退货，商品没有改变', '正品', '配送退货', '+');
INSERT INTO tk_yw VALUES ('14', '0', '2018-06-15 14:00:19.000000', '100004003', '配料退货，商品没有改变', '正品', '配料退货', '+');
INSERT INTO tk_yw VALUES ('15', '0', '2018-06-15 14:00:19.000000', '100004004', '初检退货，商品没有改变', '正品', '初检退货', '+');
INSERT INTO tk_yw VALUES ('16', '0', '2018-06-15 14:00:19.000000', '100004005', '加工退货，被加工商品已改变', '残品', '加工退货-镜片', '+');
INSERT INTO tk_yw VALUES ('17', '0', '2018-06-15 14:00:19.000000', '100004006', '加工退货，被加工商品没改变', '正品', '加工退货-镜架', '+');
INSERT INTO tk_yw VALUES ('18', '0', '2018-06-15 14:00:19.000000', '100004007', '终检退货，被加工商品已改变', '残品', '终检退货-镜片', '+');
INSERT INTO tk_yw VALUES ('19', '0', '2018-06-15 14:00:19.000000', '100004008', '终检退货，被加工商品没改变', '正品', '终检退货-镜架', '+');
INSERT INTO tk_yw VALUES ('20', '0', '2018-06-15 14:00:19.000000', '100004009', '终检退货，被加工商品已改变', '残品', '取镜退货-镜片', '+');
INSERT INTO tk_yw VALUES ('21', '0', '2018-06-15 14:00:19.000000', '100004010', '终检退货，被加工商品没改变', '正品', '取镜退货-镜架', '+');
INSERT INTO tk_yw VALUES ('22', '0', '2018-06-15 14:00:19.000000', '100004011', '完成退货，被加工商品已改变', '残品', '完成退货-镜片', '+');
INSERT INTO tk_yw VALUES ('23', '0', '2018-06-15 14:00:19.000000', '100004012', '完成退货，被加工商品没改变', '正品', '完成退货-镜架', '+');
INSERT INTO tk_yw VALUES ('24', '0', '2018-06-15 14:00:19.000000', '100004013', '完成退货，被加工商品没改变', '次品', '完成退货-成品', '+');
INSERT INTO tk_yw VALUES ('25', '0', '2018-06-15 14:00:19.000000', '200001001', '盘点后，正品盘亏，减少库存', '正品', '盘亏正品', '-');
INSERT INTO tk_yw VALUES ('26', '0', '2018-06-15 14:00:19.000000', '200001002', '盘点后，次品盘亏，减少库存', '次品', '盘亏次品', '-');
INSERT INTO tk_yw VALUES ('27', '0', '2018-06-15 14:00:19.000000', '200001003', '盘点后，残品盘亏，减少库存', '残品', '盘亏残品', '-');
INSERT INTO tk_yw VALUES ('28', '0', '2018-06-15 14:00:19.000000', '200002001', '正品转次', '正品', '正品转次', '-');
INSERT INTO tk_yw VALUES ('29', '0', '2018-06-15 14:00:19.000000', '200002002', '次品转残', '次品', '次品转残', '-');
INSERT INTO tk_yw VALUES ('30', '0', '2018-06-15 14:00:19.000000', '200002003', '残品退出库存处理', '残品', '残品处理', '-');
INSERT INTO tk_yw VALUES ('31', '0', '2018-06-15 14:00:19.000000', '200002004', '正品转赠', '正品', '正品转赠', '-');
INSERT INTO tk_yw VALUES ('32', '0', '2018-06-15 14:00:19.000000', '200003001', '调拨到其它站点', '正品', '调拨正品出库', '-');
INSERT INTO tk_yw VALUES ('33', '0', '2018-06-15 14:00:19.000000', '200003002', '调拨到其它站点', '次品', '调拨次品出库', '-');
INSERT INTO tk_yw VALUES ('34', '0', '2018-06-15 14:00:19.000000', '200003003', '调拨到其它站点', '残品', '调拨残品出库', '-');
INSERT INTO tk_yw VALUES ('35', '0', '2018-06-15 14:00:19.000000', '200004001', '销售结算后减少库存', '正品', '销售正品', '-');
