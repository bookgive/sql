#데이터베이스 삭제
drop database bookgivedb;
#데이터베이스 생성
create database bookgivedb
collate utf8_general_ci;
#데이터베이스 사용
use bookgivedb;

#사용자 테이블 생성
CREATE TABLE userdb (
   userID VARCHAR(20) NOT NULL,
   name VARCHAR(20) NOT NULL,
   pwd VARCHAR(20) NOT NULL,
   phone VARCHAR(20) NOT NULL,
   address VARCHAR(50) NOT NULL,
   email VARCHAR(50) NOT NULL,
   role VARCHAR(20) NOT NULL,
   description LONGTEXT NULL,
   PRIMARY KEY (userID)
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
     book_status VARCHAR(20) NULL
     );
     
#개인 기부 게시판 테이블 생성
CREATE TABLE personal_donation (
	personal_donation_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	userID VARCHAR(20) NULL,
	title VARCHAR(50) NULL,
	content LONGTEXT NULL,
	created_at DATE NULL,
	modified_at DATE NULL,
	donation_state BOOLEAN NULL,
	book_status VARCHAR(10) NULL
	#,FOREIGN KEY (userID) REFERENCES User(userID)
);

#개인기부 댓글 게시판 생성
CREATE TABLE personal_comment (
	comment_ID INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
	personal_donation_ID INT(11) NOT NULL,
	userID VARCHAR(20) NOT NULL,
	created_at DATE NOT NULL,
	modified_at DATE NOT NULL,
	PRIMARY KEY (comment_ID),
	CONSTRAINT personal_comment FOREIGN KEY (userID) REFERENCES userdb (userID)
);



#데이터 삽입
insert into personal_donation(userID,title,content,donation_state) values('id1','개인기부합니다~~!','content1',true);
insert into institution_donation(userID,title,content,donation_state) values('id2','기관기부합니다~~!','content1',true);
insert into intro(studentID, name, department, school) values('20191003','김민재','정보시스템공학과','성신여자대학교');

select * from personal_donation
