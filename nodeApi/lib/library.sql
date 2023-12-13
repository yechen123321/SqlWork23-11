/*
MySQL
localhost:3306
*/
drop database if exists chenye_library;
create database chenye_library;
use chenye_library;
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
-- ----------------------------
# 创建用户
drop user if exists 'chenye'@'localhost';

create user 'chenye'@'localhost' identified by '123456';
# 设置权限
grant all privileges on *.* to 'chenye'@'localhost' with grant option ;

-- admin
DROP TABLE IF EXISTS cyadmin;
CREATE TABLE cyadmin  (
  id varchar(50) PRIMARY KEY NOT NULL,
  password varchar(20) NULL DEFAULT NULL,
  name varchar(20) NULL DEFAULT NULL
);
-- ----------------------------

-- admin
INSERT INTO cyadmin VALUES
    ('3223012318','123456','陈晔'),
    ('3223012344','123456','胡芮宁'),
    ('320202020639','123456','程雨铮');
-- ----------------------------

-- book
DROP TABLE IF EXISTS cybook;
CREATE TABLE cybook  (
  bookId varchar(50) PRIMARY KEY NOT NULL,
  bookName varchar(20) NULL DEFAULT NULL,
  author varchar(10) NOT NULL,
  amount int(0) NULL DEFAULT NULL,
  position varchar(30) NULL DEFAULT NULL,
  totalAmount int(0) NULL DEFAULT NULL,
  borrowedTimes int(0) NULL DEFAULT NULL,
  status int(0) NULL DEFAULT NULL
);
-- ----------------------------

-- book
INSERT INTO cybook VALUES ('2001', '三体1：地球往事', '刘慈欣', 32, '01#12A#1-1', 32, 3, 0);
INSERT INTO cybook VALUES ('2002', '简·爱', '夏洛蒂·勃朗特', 15, '02#01B#2-2', 15, 0, 0);
INSERT INTO cybook VALUES ('2003', '平凡的世界', '路遥', 89, '03#02B#3-1', 106, 24, 1);
INSERT INTO cybook VALUES ('3', '向北方', '李红梅、刘仰东', 12, '03#02B#3-2', 12, 0, 0);
INSERT INTO cybook VALUES ('2', '中国共产党简史', '人民出版社', 431, '03#02C#3-1', 432, 3, 1);
INSERT INTO cybook VALUES ('1', '论中国共产党历史', '中央文献出版社', 234, '03#02C#3-2', 234, 0, 1);
INSERT INTO cybook VALUES ('4', '觉醒年代', '龙平平', 12, '03#02C#3-3', 12, 0, 1);
INSERT INTO cybook VALUES ('5', '靠山', '铁流', 34, '03#02C#3-4', 34, 0, 1);
INSERT INTO cybook VALUES ('6', '大医马海德', '陈敦德', 32, '03#02C#3-5', 32, 1, 1);
INSERT INTO cybook VALUES ('7', '数字解读中国：中国的发展坐标与发展成就', '贺耀敏、甄峰', 77, '03#02C#3-6', 78, 2, 1);
INSERT INTO cybook VALUES ('8', '中国北斗', '龚盛辉', 56, '03#02C#3-7', 56, 0, 1);
INSERT INTO cybook VALUES ('9', '王安石传', '崔铭', 43, '03#02B#3-3', 43, 0, 1);
INSERT INTO cybook VALUES ('10', '远去的白马', '朱秀海', 23, '03#02C#3-8', 23, 0, 1);
INSERT INTO cybook VALUES ('11', '锦绣', '李铁', 54, '03#02C#3-9', 54, 0, 1);
INSERT INTO cybook VALUES ('12', '北纬四十度', '陈福民', 435, '03#02B#3-4', 435, 0, 1);
INSERT INTO cybook VALUES ('13', '深海探秘：换一个角度看地球', '张建松', 54, '03#02B#3-5', 54, 0, 1);
INSERT INTO cybook VALUES ('14', '一个女孩朝前走', '阮梅', 23, '03#02B#3-6', 23, 0, 1);
INSERT INTO cybook VALUES ('15', '回望：近代一百年', '马勇 ', 45, '03#02B#3-7', 45, 0, 1);
INSERT INTO cybook VALUES ('16', '伏尔泰文集', '伏尔泰', 3, '03#02B#3-8', 3, 0, 1);
INSERT INTO cybook VALUES ('17', '星之继承者', '詹姆斯·P·霍根', 54, '03#02B#3-9', 54, 0, 1);
INSERT INTO cybook VALUES ('18', '尖帽子的魔法工坊', '白滨鸥 ', 23, '03#02B#3-10', 23, 0, 1);
INSERT INTO cybook VALUES ('19', '清代家族内的罪与刑', '魏道明', 65, '03#02F#3-1', 65, 0, 1);
INSERT INTO cybook VALUES ('20', '陀思妥耶夫斯基传', '安德里亚斯·古斯基', 42, '01#02F#3-2', 42, 0, 1);
INSERT INTO cybook VALUES ('21', '大唐帝国', '宫崎市定', 65, '01#02E#3-6', 65, 0, 1);
INSERT INTO cybook VALUES ('22', '消失的图书馆', '叶锦鸿', 24, '01#02D#3-2', 24, 0, 1);
INSERT INTO cybook VALUES ('23', '海边的房间', '黄丽群', 23, '01#02B#4-6', 23, 0, 1);
INSERT INTO cybook VALUES ('24', '下沉年代', '乔治·帕克', 45, '01#02A#3-9', 45, 0, 1);
INSERT INTO cybook VALUES ('miagW8Lc0Ve7zL2gNAc88', '巴黎圣母院', '维克多·雨果', 89, '01#12A#1-2', 89, 0, 1);
-- ----------------------------

-- borrow
DROP TABLE IF EXISTS cyborrow;
CREATE TABLE cyborrow  (
  borrowId bigint(0) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  readerId varchar(50) NOT NULL,
  bookId varchar(50) NOT NULL,
  borrowDate datetime(0) NOT NULL,
  returnDate datetime(0) NULL DEFAULT NULL,
  realDate datetime(0) NULL DEFAULT NULL,
  status varchar(255) NULL DEFAULT NULL,
  FOREIGN KEY (readerId) REFERENCES cyreader(readerId),
  FOREIGN KEY (bookId) REFERENCES cybook(bookId)
);
-- ----------------------------

-- comment
DROP TABLE IF EXISTS cycomment;
CREATE TABLE cycomment  (
  commentId varchar(50) PRIMARY KEY NOT NULL,
  readerId varchar(50) NOT NULL,
  bookId varchar(50) NOT NULL,
  date datetime(0) NULL DEFAULT NULL,
  content varchar(255) NOT NULL,
  praise int(0) NULL DEFAULT NULL,
  status int(0) NULL DEFAULT NULL,
  FOREIGN KEY (readerId) REFERENCES cyreader(readerId),
  FOREIGN KEY (bookId) REFERENCES cybook(bookId)
);
-- ----------------------------

-- reader
DROP TABLE IF EXISTS cyreader;
CREATE TABLE cyreader  (
  readerId varchar(50) PRIMARY KEY NOT NULL ,
  readerName varchar(50) NULL DEFAULT NULL,
  password varchar(50) NULL DEFAULT NULL,
  phone varchar(25) NULL DEFAULT NULL,
  borrowTimes bigint(0) NULL DEFAULT 0,
  ovdTimes bigint(0) NULL DEFAULT 0,
  email varchar(255) NULL DEFAULT NULL
);
-- ----------------------------

-- reader
insert into cyreader (readerId,readerName,password,phone,email) values
        ('10001','chenye',123456,'18755577565','3298365564@qq.com'),
        ('10002','huruining',123456,'17753906903','1123717618@qq.com'),
        ('10003','chengyuzheng',123456,'13359091326','2539415053@qq.com');
-- ----------------------------

-- report
DROP TABLE IF EXISTS cyreport;
CREATE TABLE cyreport  (
  commentId varchar(50) NOT NULL,
  reporterId varchar(50) PRIMARY KEY NOT NULL,
  reportdate datetime(0) NOT NULL,
  status varchar(255) NULL DEFAULT NULL,
  FOREIGN KEY (commentId) REFERENCES cycomment(commentId)
);
-- ----------------------------

-- reserve
DROP TABLE IF EXISTS cyreserve;
CREATE TABLE cyreserve  (
  reserveId bigint(0) PRIMARY KEY NOT NULL,
  readerId varchar(50) NOT NULL,
  bookId varchar(50) NOT NULL,
  date datetime(0) NOT NULL,
  status varchar(50) NULL DEFAULT NULL,
  FOREIGN KEY (readerId) REFERENCES cyreader(readerId)
);
-- ----------------------------

-- borrowinfo
DROP VIEW IF EXISTS borrowinfo;
CREATE ALGORITHM = UNDEFINED DEFINER = 'chenye'@'localhost' SQL SECURITY DEFINER VIEW borrowinfo AS
    select cyborrow.readerId AS readerId, cybook.bookId AS bookId, cyreader.readerName AS readerName, cybook.bookName AS bookName,
           cyborrow.borrowDate AS borrowDate,cyborrow.returnDate AS returnDate,cyborrow.realDate AS realDate
    from ((cyborrow left join cyreader on((cyborrow.readerId = cyreader.readerId))) left join cybook on((cyborrow.bookId = cybook.bookId)));
-- ----------------------------

-- reportinfo
DROP VIEW IF EXISTS reportinfo;
CREATE ALGORITHM = UNDEFINED DEFINER = 'chenye'@'localhost' SQL SECURITY DEFINER VIEW reportinfo AS
    select a.status AS status,a.commentId AS commentId,a.reporterId AS reporterId,a.reportdate AS reportdate,b.readerId AS readerId,
           cyreader.readerName AS readerName, b.bookId AS bookId, cybook.bookName AS bookName, b.date AS date, b.content AS content
    from (((cyreport a left join cycomment b on((a.commentId = b.commentId))) left join cyreader on((b.readerId = cyreader.readerId))) left join cybook on((b.bookId = cybook.bookId)));
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;

# 函数

SET GLOBAL log_bin_trust_function_creators = 1;

## 管理员登陆函数

drop function if exists cy_login;

create function cy_login (p_id varchar(50), p_password varchar(20))
returns  varchar(20)
begin
    declare result varchar(20);
    declare count INT;
    select COUNT(*) into count from cyadmin where id = p_id and password = p_password;
    if count > 0 then
        set result = 'login successful';
    else
        set result = 'login failed';
    end if;
    return result;
end;

select cy_login('3223012318','123456');

## 用户登录

drop function if exists hrn_login;

create function hrn_login (p_id varchar(11), p_password varchar(50))
returns varchar(20)
begin
    declare result varchar(20);
    declare count int;

    select count(*) into count from cyreader where phone = p_id and password = p_password;

    if count > 0 then
        set result = 'login successful';
    else
        set result = 'login failed';
    end if;
    return result;
end;

select hrn_login('18755577565','123456');

# 存储过程
## 1. 插入新的书本信息

drop procedure if exists cyz_book;

create procedure  cyz_book
    (in book_name varchar(20), in author_name varchar(10),
    in amounts int(0), in position_where varchar(30), in total int(0))
pro:begin
    declare count int;
    select count(*) into count from cybook where position=position_where;
    SELECT COUNT;
    if ( count > 0 ) then
        begin
            select '添加书本失败！' as SystemsMessages;
            leave pro;
        end;
    else
        begin
             select '添加书本成功' as SystemsMessages;
        end;
    end if;
    insert into cybook (bookId,bookName, author, amount, position, totalAmount)
      values (RAND(),book_name, author_name, amounts, position_where, total);
end;

call cyz_book('算法导论','程雨铮',322,'01#12A#1-12',322);

## 2. 删除文章，这里指的是逻辑删除，数据并未从数据库中彻底抹去

drop procedure if exists cy_book_clear;

create procedure cy_book_clear ( in book_id varchar(50) )
begin
    declare count int;
    select count(*) into count from cybook where bookId = book_id && cybook.status=1;
    if(count = 0) then
        begin
           select '书本不存在或已被删除' as SystemsMessages;
        end;
    else
        update cybook set status=0 where bookId = book_id && cybook.status=1;
        select '书本删除成功' as SystemsMessages;
end if;
end;

call cy_book_clear(1);

#

# 3. 借书信息插入

drop procedure if exists cy_borrow;

create procedure cy_borrow (in reader_id varchar(50), in book_id varchar(50), in borrow_date datetime(0), in statue varchar(255))
loops:begin
    declare count int;
    declare checks int;

    select count(*) into checks from cybook where bookId = book_id and amount > 0;
    if( checks = 0) then
        select '书本库存紧缺，无法借书!';
        leave loops;
    end if;

    insert into cyborrow (readerId, bookId, borrowDate, returnDate, status) values (reader_id, book_id, borrow_date, date_add(borrow_date, interval 1 month ) , statue);

    select count(*) into count from cyborrow where readerId = reader_id and bookId=book_id and borrowDate = borrow_date;

    if( count = 1) then
        begin
            select '借书成功' as SystemsMessages;
        end;
    else
        select '借书失败' as SystemsMessages;
    end if;
end;

call cy_borrow('10001','1',now(), '未还');

# 触发器
# # 借书后书本的目前库存-1

# drop trigger if exists hrn_borrowChange;
# 
# create trigger hrn_borrowChange after insert on cyborrow for each row
# begin
#     update cybook
#         set amount = amount - 1,
#             borrowedTimes = borrowedTimes + 1
#         where bookId = NEW.bookId;
# end;
