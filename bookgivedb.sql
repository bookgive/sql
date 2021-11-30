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
     img LONGTEXT NULL,
     created_at DATE NULL,
     modified_at DATE NULL, 
     institution VARCHAR(50) NULL,
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
	created_at DATE NULL,
	donation_state BOOLEAN NULL,
	book_status VARCHAR(10) NULL,
	count 	int(11) NULL,
	filename varchar(30),
     	filesize int(11),
	FOREIGN KEY (userID) REFERENCES userdb(userID),
	INDEX userID (userID)
);

#개인기부 댓글 게시판 생성
CREATE TABLE personal_comment (
	comment_ID INT(11) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	personal_donation_ID INT NOT NULL,
	userID VARCHAR(20) NULL,
	created_at DATE NULL,
	modified_at DATE NULL,
	FOREIGN KEY (userID) REFERENCES userdb(userID),
	FOREIGN KEY (personal_donation_ID) REFERENCES personal_donation(personal_donation_id),
	INDEX personal_comment (userID),
   INDEX personal_donation_ID (personal_donation_ID)
);

CREATE TABLE `tblZipcode` (
  `zipcode` char(5) NOT NULL,
  `area1` char(10) DEFAULT NULL,
  `area2` char(20) DEFAULT NULL,
  `area3` char(30) DEFAULT NULL
);

#임시 데이터 삽입
insert into userdb(userID,pwd,name) values('id','1234',"김민재");
insert into personal_donation(userID,title,content,donation_state) values('id','개인기부합니다~~!1','content1',true);
insert into personal_donation(userID,title,content,donation_state) values('id','개인기부합니다~~!2','content2',true);
insert into personal_donation(userID,title,content,donation_state) values('id','개인기부합니다~~!3','content3',true);
insert into institution_donation(userID,title,content,donation_state) values('id','기관기부합니다~~!1','content1',true);
insert into institution_donation(userID,title,content,donation_state) values('id','기관기부합니다~~!2','content2',true);
insert into institution_donation(userID,title,content,donation_state) values('id','기관기부합니다~~!3','content3',true);
insert into intro(studentID, name, department, school) values('20191001','고민채','정보시스템공학과','성신여자대학교');
insert into intro(studentID, name, department, school) values('20191003','김민재','정보시스템공학과','성신여자대학교');
insert into intro(studentID, name, department, school) values('20191014','남소희','정보시스템공학과','성신여자대학교');
insert into intro(studentID, name, department, school) values('20191024','양지원','정보시스템공학과','성신여자대학교');
insert into intro(studentID, name, department, school) values('20191039','최소원','정보시스템공학과','성신여자대학교');

select * from personal_donation;
