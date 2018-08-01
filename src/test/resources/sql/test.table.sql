create table TG_Goods (id bigint not null auto_increment, b_isDel Boolean default false not null, b_wtime datetime(6) not null, c_code varchar(40) not null, kcjb integer, name varchar(60) not null, pinYin varchar(180) not null, py varchar(30) not null, brandId bigint, colorId bigint, kindId bigint, versionId bigint, primary key (id)) ;

 create table TG_GoodsAttr (id bigint not null auto_increment, b_isDel Boolean default false not null, b_wtime datetime(6) not null, a1 varchar(25), a10 varchar(25), a11 varchar(25), a12 varchar(25), a13 varchar(25), a14 varchar(25), a15 varchar(25), a2 varchar(25), a3 varchar(25), a4 varchar(25), a5 varchar(25), a6 varchar(25), a7 varchar(25), a8 varchar(25), a9 varchar(25), goodsId bigint not null, primary key (id)) ;

 create table TG_GoodsAttrSetup (id bigint not null auto_increment, b_isDel Boolean default false not null, b_wtime datetime(6) not null, c_type varchar(40), columnName varchar(40), columnValue varchar(40), defaults varchar(200), kindId bigint, primary key (id)) ;

 create table TG_GoodsTree (id bigint not null auto_increment, b_isDel Boolean default false not null, b_wtime datetime(6) not null, a1 varchar(30), a2 varchar(30), a3 varchar(30), a4 varchar(30), a5 varchar(30), c_group varchar(30) not null, c_level integer, fid bigint not null, pinyi varchar(120), py varchar(20), text varchar(40) not null, comId bigint, primary key (id)) ;

 create table TG_Lens (id bigint not null auto_increment, b_isDel Boolean default false not null, b_wtime datetime(6) not null, cyl float, sph float, goodsId bigint not null, lensSetupId bigint not null, primary key (id)) ;

 create table TG_LensSetup (id bigint not null auto_increment, b_isDel Boolean default false not null, b_wtime datetime(6) not null, cylMax float, cylPool float, cylhMin float, sphMax float, sphMin float, sphPool float, goodsId bigint, primary key (id)) ;

 create table TG_Price (id bigint not null auto_increment, b_isDel Boolean default false not null, b_wtime datetime(6) not null, cyl float, pin double precision, pout double precision, priceType varchar(10) not null, sph float, comId bigint, goodsId bigint not null, storeId bigint, primary key (id)) ;

 create table TK_KC (id bigint not null auto_increment, b_isDel Boolean default false not null, b_wtime datetime(6) not null, cyl float, isPd bit, last_pd_day datetime(6), last_pd_userId bigint, num_can_pin bigint not null, num_ci_pin bigint not null, num_need bigint not null, num_zeng_pin bigint not null, num_zheng_pin bigint not null, sph float, comId bigint, goodsId bigint, storeId bigint, primary key (id)) ;

 create table TSYS_Setup (id bigint not null auto_increment, b_isDel Boolean default false not null, b_wtime datetime(6) not null, name varchar(30) not null, note varchar(200) not null, val varchar(100) not null, primary key (id)) ;

 create table TSYS_SetupCom (id bigint not null auto_increment, b_isDel Boolean default false not null, b_wtime datetime(6) not null, name varchar(30) not null, note varchar(200) not null, val varchar(100) not null, comId bigint, primary key (id)) ;

 create table TU_Com (id bigint not null auto_increment, b_isDel Boolean default false not null, b_wtime datetime(6) not null, addr varchar(200) not null, adminId bigint, adminPassword varchar(36), cz bigint, isJy bit, isYueJie bit, maxUseDay datetime(6), idxu_com_name varchar(100) not null, padNum integer, padPrice integer, phone varchar(20) not null, photo varchar(50), servicePrice integer, storeNum integer, useDate datetime(6), webNum integer, webPrice integer, yueJieRQ varchar(255), primary key (id)) ;

 create table TU_Fun (id bigint not null auto_increment, b_isDel Boolean default false not null, b_wtime datetime(6) not null, c_group varchar(18) not null, fid bigint not null, htmlPath varchar(255), iconPath varchar(255), name varchar(30) not null, studyPath varchar(200), viewPath varchar(255), primary key (id)) ;

 create table TU_Message (id bigint not null auto_increment, b_isDel Boolean default false not null, b_wtime datetime(6) not null, c_type varchar(12) not null, isRead bit, msg varchar(500) not null, title varchar(50) not null, readerId bigint not null, primary key (id)) ;

 create table TU_Role (id bigint not null auto_increment, b_isDel Boolean default false not null, b_wtime datetime(6) not null, name varchar(40), comId bigint, primary key (id)) ;

 create table TU_Role_Fun (roleId bigint not null, funId bigint not null) ;

 create table TU_Store (id bigint not null auto_increment, b_isDel Boolean default false not null, b_wtime datetime(6) not null, addr varchar(100), fid bigint, isCenter bit, isHasKc bit, isZhanDianJia bit, isZhiYing bit, name varchar(30) not null, phone varchar(20), phote varchar(100), pinYin varchar(90) not null, py varchar(15) not null, comId bigint, primary key (id)) ;

 create table TU_User (id bigint not null auto_increment, b_isDel Boolean default false not null, b_wtime datetime(6) not null, addr varchar(120), brithday datetime(6), loginName varchar(40) not null, name varchar(80) not null, password varchar(36) not null, phone varchar(20), photo varchar(120), userType varchar(12) not null, xue_li varchar(20), zhi_wu varchar(20), comId bigint, roleId bigint, storeId bigint, primary key (id)) ;