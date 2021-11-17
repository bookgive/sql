#데이터베이스 삭제
drop database bookgivedb;
#데이터베이스 생성
create database bookgivedb
collate utf8_general_ci;
#데이터베이스 사용
use bookgivedb;
#사용자 테이블 생성
#팀원소개 테이블 생성
CREATE TABLE intro (
    -> studentID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    -> name VARCHAR(30) NULL,
    -> department VARCHAR(30) NULL,
    -> school VARCHAR(30) NULL
    -> );
#기관 기부 게시판 테이블 생성
CREATE TABLE institution_donation (
    -> institution_donation_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    -> userID VARCHAR(20) NULL,
    -> title VARCHAR(50) NULL, 
    -> content LONGTEXT NULL,
    -> img LONGTEXT NULL,
    -> created_at DATE NULL,
    -> modified_at DATE NULL, 
    -> institution VARCHAR(50) NULL,
    -> donation_state VARCHAR(50) NULL,
    -> book_status VARCHAR(20) NULL
    -> );
#개인 기부 게시판 테이블 생성
#개인기부 댓글 게시판 생성
CREATE TABLE personal_donation (
	personal_donation_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	userID VARCHAR(20) NULL,
	title VARCHAR(50) NULL,
	content LONGTEXT NULL,
	create_at DATE NULL,
	modified_at DATE NULL,
	donation_state BOOLEAN NULL,
	book_status VARCHAR(10) NULL
	#,FOREIGN KEY (userID) REFERENCES User(userID)
);

#데이터 삽입
insert into personal_donation(userID,title,content,donation_state) values('id1','title1','content1',true);

select * from personal_donation
