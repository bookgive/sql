#데이터베이스 삭제
drop database IF EXISTS bookgivedb;
#데이터베이스 생성
create database bookgivedb
collate utf8_general_ci;
#데이터베이스 사용
use bookgivedb;

#사용자 테이블 생성
CREATE TABLE userdb (
   userID VARCHAR(20) NOT NULL PRIMARY KEY,
   name VARCHAR(20) NULL,
   pwd VARCHAR(20) NOT NULL,
   phone VARCHAR(20) NULL,
   address VARCHAR(50) NULL,
   email VARCHAR(50) NULL,
   zipcode char(5) NULL,
   role VARCHAR(20) NULL,
   description LONGTEXT NULL
);

#팀원소개 테이블 생성
CREATE TABLE intro (
     studentID INT NOT NULL PRIMARY KEY,
     name VARCHAR(30) NULL,
     department VARCHAR(30) NULL,
     school VARCHAR(30) NULL
     );
     
#기관 기부 게시판 테이블 생성
CREATE TABLE institution_donation (
     institution_donation_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
     userID VARCHAR(20) NULL,
     title VARCHAR(50) NULL,
     content LONGTEXT NULL,
     created_at DATE NULL,
     donation_state BOOLEAN NULL,
     book_status VARCHAR(20) NULL,
     pos smallint(7) unsigned,
     ref smallint(7),
     depth smallint(7) unsigned,
     pass varchar(15),
     count smallint(7) unsigned,
     filename varchar(30),
     filesize int(11),
     FOREIGN KEY (userID) REFERENCES userdb(userID),
     INDEX userID (userID)
     );
 
#개인 기부 게시판 테이블 생성
CREATE TABLE personal_donation (
	personal_donation_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	userID VARCHAR(20) NULL,
	pwd VARCHAR(20) NULL,
	title VARCHAR(50) NULL,
	content LONGTEXT NULL,
	pos smallint(7) unsigned,
	ref smallint(7),
     	depth smallint(7) unsigned,
	created_at DATE NULL,
	donation_state BOOLEAN NULL,
	book_status VARCHAR(10) NULL,
	count 	int(11) NULL,
	filename varchar(30),
     	filesize int(11),
	FOREIGN KEY (userID) REFERENCES userdb(userID),
	INDEX userID (userID)
);



CREATE TABLE `tblZipcode` (
  `zipcode` char(5) NOT NULL,
  `area1` char(10) DEFAULT NULL,
  `area2` char(20) DEFAULT NULL,
  `area3` char(30) DEFAULT NULL
);

#임시 데이터 삽입
insert into userdb(userID,pwd) values('id','1234');
insert into userdb(userID,pwd) values('minchae','1234');
insert into userdb(userID,pwd) values('minjae','1234');
insert into userdb(userID,pwd) values('sohee','1234');
insert into userdb(userID,pwd) values('jiwon','1234');
insert into userdb(userID,pwd) values('sowon','1234');

insert into personal_donation(userID,title,content,created_at,donation_state,book_status,pwd) values('minchae','어린왕자','기부합니다~!','2021-10-28',true,'좋음',1234);
insert into personal_donation(userID,title,content,created_at,donation_state,book_status,pwd) values('minjae','해리포터 시리즈','기부합니다~!','2021-11-02',true,'좋음',1234);
insert into personal_donation(userID,title,content,created_at,donation_state,book_status,pwd) values('sohee','달러구트 꿈 백화점','기부합니다~!','2021-11-02',true,'좋음',1234);
insert into personal_donation(userID,title,content,created_at,donation_state,book_status,pwd) values('jiwon','나의 라임오렌지 나무','기부합니다~!','2021-11-14',true,'좋음',1234);
insert into personal_donation(userID,title,content,created_at,donation_state,book_status,pwd) values('sowon','노인과바다','기부합니다~!','2021-11-28',true,'좋음',1234);

insert into institution_donation(userID,title,content,created_at,donation_state,book_status,pass) values('minchae','어린왕자','기부합니다~!','2021-10-28',true,'좋음',1234);
insert into institution_donation(userID,title,content,created_at,donation_state,book_status,pass) values('minjae','해리포터 시리즈','기부합니다~!','2021-11-02',true,'좋음',1234);
insert into institution_donation(userID,title,content,created_at,donation_state,book_status,pass) values('sohee','달러구트 꿈 백화점','기부합니다~!','2021-11-02',true,'좋음',1234);
insert into institution_donation(userID,title,content,created_at,donation_state,book_status,pass) values('jiwon','나의 라임오렌지 나무','기부합니다~!','2021-11-14',true,'좋음',1234);
insert into institution_donation(userID,title,content,created_at,donation_state,book_status,pass) values('sowon','노인과바다','기부합니다~!','2021-11-28',true,'좋음',1234);

insert into intro(studentID, name, department, school) values('20191001','고민채','정보시스템공학과','성신여자대학교');
insert into intro(studentID, name, department, school) values('20191003','김민재','정보시스템공학과','성신여자대학교');
insert into intro(studentID, name, department, school) values('20191014','남소희','정보시스템공학과','성신여자대학교');
insert into intro(studentID, name, department, school) values('20191024','양지원','정보시스템공학과','성신여자대학교');
insert into intro(studentID, name, department, school) values('20191039','최소원','정보시스템공학과','성신여자대학교');

insert tblZipcode values ('06267','서울특별시','강남구','강남대로 238 ~ 246                ');
insert tblZipcode values ('06266','서울특별시','강남구','강남대로 248 ~ 256                ');
insert tblZipcode values ('06265','서울특별시','강남구','강남대로 262 ~ 276			');
insert tblZipcode values ('06258','서울특별시','강남구','강남대로 278 ~ 292			');
insert tblZipcode values ('06253','서울특별시','강남구','강남대로 298 ~ 318			');
insert tblZipcode values ('06252','서울특별시','강남구','강남대로 320 ~ 334			');
insert tblZipcode values ('06242','서울특별시','강남구','강남대로 338 ~ 354			');
insert tblZipcode values ('06241','서울특별시','강남구','강남대로 358 ~ 374			');
insert tblZipcode values ('06232','서울특별시','강남구','강남대로 376 ~ 390			');
insert tblZipcode values ('06232','서울특별시','강남구','강남대로 396				');
