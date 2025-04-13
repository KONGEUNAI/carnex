# Spring 중고차 플랫폼 프로젝트

### 프로젝트 기간 : 24.07.04 ~ 24.12.13
### 프로젝트 수행자 : 공은애(kea4150@gmail.com)
### 시연 영상 : 

## 환경
- Windows 10
- JDK 1.8
- Tomcat 9.0
- Spring 4.3.8
- MariaDB 10.11
- MyBatis 3.4.1
- Lombok
- Gson
- JSTL
- BcryptpasswordEncoder
- Encoding : UTF-8

## 디자인 및 차량, 차량이미지, 차량설명 참고 사이트
 1. KB차차차
  - https://www.kbchachacha.com/
 2. SK엔카
  - https://car.encar.com/
 3. 카바조
  - https://www.carvazo.com/

## MySQL 데이터베이스 생성 및 사용자 생성
```sql
CREATE USER 'dba'@'%' identified by 'dbapwd';
GRANT ALL privileges on *.* TO 'dba'@'%';
create database carnex;
```

## MySQL 테이블 생성
```sql
use carnex;
```

```sql
CREATE TABLE user_tbl (
	user_id VARCHAR(30) NOT NULL COMMENT '회원아이디',
	user_pwd VARCHAR(150) NOT NULL COMMENT '회원비밀번호',
	user_name VARCHAR(20) NOT NULL COMMENT '회원 이름',
	user_nick VARCHAR(15)	 NOT NULL COMMENT '닉네임',
	user_birth VARCHAR(15) NOT NULL COMMENT '회원 생년월일',
	user_gender CHAR(2) NOT NULL COMMENT '성별',
	user_tel	 CHAR(13) NOT NULL COMMENT '회원 전화번호',
	user_zipcode VARCHAR(7) NOT NULL COMMENT '회원 우편번호',
	user_address VARCHAR(150) NOT NULL	 COMMENT '회원 주소',
	user_mail VARCHAR(30)	 NULL COMMENT '회원 이메일',
	user_wishcar VARCHAR(50) NULL COMMENT '선호차량',
	user_wishprice VARCHAR(50) NULL COMMENT '선호 가격',
	user_path VARCHAR(50) NULL COMMENT '가입경로',
	user_type INT NULL DEFAULT 1 COMMENT '회원 타입', -- 0 비회원, 1 회원
	user_drop TEXT NULL COMMENT '탈퇴 사유',
	user_img TEXT NULL COMMENT '이미지 경로',
	user_intro TEXT NULL COMMENT '인사말',
	user_reg_date TIMESTAMP NULL COMMENT '회원 가입일시',
	user_up_date TIMESTAMP COMMENT '회원 수정일시',
	PRIMARY KEY (user_id)
) COMMENT '회원테이블';

CREATE TABLE staff_tbl (
	staff_id VARCHAR(15) NOT NULL COMMENT '사원번호',
	staff_pwd VARCHAR(150) NOT NULL COMMENT '비밀번호',
	staff_name VARCHAR(30) NOT NULL COMMENT '이름',
	staff_phone CHAR(13) NULL COMMENT '연락처',
	staff_part INT NULL COMMENT '부서',-- 1 C/S, 2 영업, 3 임원
	staff_type INT NULL DEFAULT 1 COMMENT '고용상태', -- 0 퇴사, 1 근무
	staff_img TEXT NULL COMMENT '이미지 경로',
	staff_intro TEXT NULL COMMENT '인사말',
	staff_reg_date TIMESTAMP NULL COMMENT '입사일',
	staff_up_date TIMESTAMP NULL COMMENT '수정일',
	staff_out_date TIMESTAMP NULL COMMENT '퇴사일',
	PRIMARY KEY (staff_id)
) COMMENT '직원테이블';

CREATE TABLE board_tbl (
	bno INT AUTO_INCREMENT COMMENT '게시물번호',
	title VARCHAR(150) NULL COMMENT '게시물제목',
	content TEXT NULL COMMENT '게시물내용',
	writer VARCHAR(30) NULL COMMENT '작성자',
	viewcnt INT NULL DEFAULT 0 COMMENT '조회수',
	replycnt INT NULL DEFAULT 0 COMMENT '댓글수',
	reg_date TIMESTAMP NULL COMMENT '작성일',
	up_date TIMESTAMP NULL COMMENT '수정일',
	user_id VARCHAR(30) NULL COMMENT '유저아이디',
	staff_id VARCHAR(15) NULL COMMENT '사원번호',
	PRIMARY KEY (bno),
	FOREIGN KEY (user_id) REFERENCES user_tbl(user_id),
	FOREIGN KEY (staff_id) REFERENCES staff_tbl(staff_id) 
) COMMENT '게시판테이블';

CREATE TABLE goods_tbl (
	car_num INT AUTO_INCREMENT COMMENT '자동차 상세번호',
	car_brand VARCHAR(10) NOT NULL COMMENT '자동차 제조사',
	car_type VARCHAR(15) NOT NULL COMMENT '자동차 분류',
	car_model VARCHAR(15) NOT NULL COMMENT '자동차 모델',
	car_price INT NULL COMMENT '가격',
	car_title	 VARCHAR(100) NULL COMMENT '상품 제목',
	car_subtitle VARCHAR(100) NULL COMMENT '서브타이틀',
	car_content TEXT NULL COMMENT '자동차 설명',
	car_accident INT NULL COMMENT '사고 유무', -- 0 무사고, 1 사고내역 있음
	car_zone CHAR(2) NULL COMMENT '보유지점', -- 광교, 용인, 분당
	car_thumbimg TEXT NULL COMMENT '자동차 이미지 경로',
	car_img TEXT NULL COMMENT '상세 이미지 경로',
	car_status VARCHAR(4) NULL COMMENT '판매 상태', -- 거래중, 판매완료, 판매보류, ...
	car_reg_date TIMESTAMP NULL COMMENT '등록일',
	car_up_date TIMESTAMP NULL	COMMENT '수정일',
	staff_id VARCHAR(15) NOT NULL COMMENT '사원번호',
	PRIMARY KEY (car_num),
	FOREIGN KEY (staff_id) REFERENCES staff_tbl(staff_id)
) COMMENT '상품테이블';

CREATE TABLE  reply_tbl (
    rno INT AUTO_INCREMENT COMMENT'댓글번호',
    user_id VARCHAR(30) NULL COMMENT'회원아이디',
    content TEXT NOT NULL COMMENT'내용',
    writer VARCHAR(30) NOT NULL COMMENT'작성자',
    reg_date TIMESTAMP NULL COMMENT'작성일',
    up_date TIMESTAMP NULL COMMENT'수정일',
    bno INT NOT NULL COMMENT'게시물번호',
    staff_id VARCHAR(15) NULL COMMENT'사원번호',
    PRIMARY KEY(rno),
    FOREIGN KEY (bno) REFERENCES board_tbl (bno) ON DELETE CASCADE,
    FOREIGN KEY (staff_id) REFERENCES staff_tbl (staff_id),
    FOREIGN KEY (user_id) REFERENCES user_tbl (user_id)
) COMMENT '댓글테이블';

CREATE TABLE attach_tbl (
	UUID VARCHAR(100) NOT NULL COMMENT '랜덤접두사',
	uploadPath VARCHAR(200) NOT NULL COMMENT '업로드경로',
	fileName VARCHAR(100) NOT NULL COMMENT '파일명',
	fileType VARCHAR(5) DEFAULT 'I' COMMENT '이미지여부',
	bno INT NOT NULL COMMENT  '게시물번호'
) COMMENT '첨부파일테이블';

CREATE TABLE card_tbl (
	card_num INT AUTO_INCREMENT COMMENT'등록번호',
	user_id VARCHAR(30) NOT NULL COMMENT '회원아이디',
	card_bank VARCHAR(10) NOT NULL COMMENT '카드사 이름',
	card_lastname VARCHAR(10) NOT NULL COMMENT '성',
	card_firstname VARCHAR(20) NOT NULL COMMENT '이름',
	card_expdate VARCHAR(10) NOT NULL COMMENT '유효기간(YYYY-MM)',
	card_cvc INT NOT NULL COMMENT 'cvc번호',
	card_digit1 INT NOT NULL COMMENT '카드번호 자리1',
	card_digit2 INT NOT NULL COMMENT '카드번호 자리2',
	card_digit3 INT NOT NULL COMMENT '카드번호 자리3',
	card_digit4 INT NOT NULL COMMENT '카드번호 자리4',
	PRIMARY KEY(card_num),
	FOREIGN KEY (user_id) REFERENCES user_tbl(user_id)
) COMMENT '카드테이블';

CREATE TABLE address_tbl (
	zipcode CHAR(7) NULL COMMENT '우편번호',
	area1 CHAR(15) NULL COMMENT '도시/도',
	area2 CHAR(30) NULL COMMENT '구/군',
	area3 CHAR(40) NULL COMMENT '동/면',
	area4 CHAR(30) NULL COMMENT '번지'
) COMMENT'주소테이블';

CREATE TABLE contract_tbl (
	con_no INT AUTO_INCREMENT COMMENT '계약번호',
	con_sign TEXT NULL COMMENT '서명 정보',
	con_status VARCHAR(50) NULL COMMENT '계약 구분',
	con_reg_date TIMESTAMP NULL DEFAULT now() COMMENT '계약날짜',
	car_num INT NOT NULL COMMENT '자동차 상세번호',
	staff_id VARCHAR(15) NOT NULL COMMENT '사원번호',
	card_num INT NOT NULL COMMENT '카드등록번호',
	user_id VARCHAR(30) NOT NULL COMMENT '구매자 아이디',
	PRIMARY KEY (con_no),
	FOREIGN KEY (car_num) REFERENCES goods_tbl(car_num) ON DELETE CASCADE,
	FOREIGN KEY (staff_id) REFERENCES staff_tbl(staff_id),
	FOREIGN KEY (card_num) REFERENCES card_tbl(card_num) ON DELETE CASCADE,	
	FOREIGN KEY (user_id) REFERENCES user_tbl(user_id)
) COMMENT '계약테이블';

CREATE TABLE reservation_tbl (
	rev_no INT AUTO_INCREMENT COMMENT '상담예약번호',
	rev_status VARCHAR(10) NULL COMMENT '상담예약상태',
	rev_time VARCHAR(50) NULL COMMENT '예약시간',
	rev_date VARCHAR(50) NULL COMMENT '예약날짜',
	rev_reg_date TIMESTAMP NULL COMMENT '접수날짜',
	user_id VARCHAR(30) NOT NULL COMMENT '회원아이디',
	car_num INT NOT NULL COMMENT '자동차 상세번호',
	staff_id VARCHAR(15) NOT NULL COMMENT '사원번호',
	PRIMARY KEY (rev_no),
	FOREIGN KEY (user_id) REFERENCES user_tbl(user_id),
	FOREIGN KEY (car_num) REFERENCES goods_tbl(car_num) ON DELETE CASCADE,
	FOREIGN KEY (staff_id) REFERENCES staff_tbl(staff_id)
) COMMENT '상담예약테이블';

```

# 구현한 기능들

 <b>1. 회원가입 & 회원로그인 & 직원로그인 & 로그아웃</b>
 ![image](https://github.com/user-attachments/assets/f44e5250-0752-45f2-9f77-5e3d8d55459b)
 - 회원가입 시 입력한 비밀번호는 BcryptpasswordEncoder으로 인코딩되어 DB에 저장됩니다.    
 - 회원가입과 로그인을 탭 기능으로 한 화면에서 처리하도록 구현했습니다.
   
 <b>2. 유저메인페이지</b>
 ![image](https://github.com/user-attachments/assets/85c644c6-3b8e-4aec-83b5-773c64a07ff2)
 - 이미지 콘텐츠의 효과적인 제공을 위해 Carousel 형태의 UI를 적용하였습니다.
 - 요소의 정렬과 배치를 위해 Grid Layout을 사용하여 화면 구성을 체계적으로 구현하였습니다.
 
 <b>6. 차종별 검색</b>
 ![Image](https://github.com/user-attachments/assets/41bdeea7-ec31-445c-8efc-a1e2ea02781d)
 - SELECT문을 활용하여 car_type에 keyword가 포함된 데이터만 검색합니다. (LIKE '%keyword%')
 - 필터링 기능은 화면에 고정되어 있어 사용자가 페이지를 스크롤하더라도 지속적으로 활용할 수 있게 하였습니다.
 - car_status가 '예약중' 또는 '판매완료'가 아닌 것만 가져오고, 즉 판매 가능한 차량만 불러옵니다.
 
 <b>7. 전체 차량 페이지</b>
 ![Image](https://github.com/user-attachments/assets/ca095872-6aac-49f4-8cec-16a939bd43ac)
 - 판매 가능한 차량의 전체 목록을 보여줍니다.
 - '구매하러 가기' 버튼을 클릭하여 방문 상담 예약을 할 수 있습니다.

 <b>8. 게시판 페이지</b>
 ![Image](https://github.com/user-attachments/assets/62bdf6ab-533c-4afd-9c5c-cf27b2ec4986)
 - 사용자가 글을 작성, 수정, 삭제할 수 있는 게시판 기능을 통해 자유로운 의견 개진 및 커뮤니케이션이 가능하도록 구성하였습니다.

 <b>9. 로그인 시 상단 메뉴 추가</b>
 ![Image](https://github.com/user-attachments/assets/eff34c49-bdbe-41d7-aa98-88e48471b7f1)
 ![Image](https://github.com/user-attachments/assets/5083acd2-8d82-4c69-9904-df9cbd32d74b)
 - 상단바의 특정 기능은 회원에 한해서만 접근할 수 있으며, 탈퇴한 회원 혹은 비회원은 매물 조회 및 게시판 기능을 이용할 수 없습니다.

 <b>10. 정보수정 클릭 시 비밀번호 재확인</b>
 ![Image](https://github.com/user-attachments/assets/d693d776-aa8a-477a-aa0f-c76b47467a9c)
 - userMemberMapper.xml에서 주어진 user_id에 해당하는 사용자의 비밀번호를 DB에서 조회하고, 암호화된 비밀번호를 반환받아 사용자가 입력한 비밀번호와 비교하여 인증을 수행합니다.
 - 사용자가 입력한 비밀번호(user_pwd)와 데이터베이스에 저장된 비밀번호를 비교하여, 일치할 경우 회원 정보 수정 페이지로 이동합니다.
 - 불일치 시 본인 인증 오류 메시지를 띄운 후 비밀번호 입력 페이지로 리다이렉트합니다.
 
 <b>11. 회원정보 수정</b>
 ![Image](https://github.com/user-attachments/assets/dd076be1-c5a9-48d0-bcc6-ac5834769d3f)
 - 정보 수정 페이지에서 회원은 손쉽게 정보 수정이 가능합니다.
   
 <b>12. 회원 마이페이지</b>
 ![Image](https://github.com/user-attachments/assets/eb6b059c-5e8e-4b9f-bf61-7a4faa35134b)
 - 마이페이지는 회원의 기본 정보, 계약 및 예약 내역, 게시글과 댓글 활동, 카드 등록 현황 등을 탭 형태로 구분하여 제공하는 통합 사용자 정보 관리 기능입니다.
 - 각 내역은 관련 차량 및 담당 직원 정보와 함께 조회할 수 있도록 구성되어 있습니다.

 <b>13. 상세상품 페이지 - 상단</b>
 ![image](https://user-images.githubusercontent.com/63082842/106246754-f491c900-6251-11eb-8b09-4ef661d833be.png)
 - product 테이블의 값을 select 하여 보여줍니다.
 - 바로구매 버튼 클릭 시 결제페이지로 이동합니다. (로그인 시에만)
 - 장바구니 버튼 클릭 시 장바구니에 추가됩니다. (로그인 시에만)
 - 찜 버튼 클릭 시 찜목록에 추가됩니다. (로그인 시에만)
 ![image](https://user-images.githubusercontent.com/63082842/106248073-d0cf8280-6253-11eb-9bcc-60baca222f17.png)
  - 로그인 상태에서 버튼 클릭 시
 ![image](https://user-images.githubusercontent.com/63082842/106248122-e2188f00-6253-11eb-8e80-7bfa532fc7ed.png)
  - 비로그인 상태에서 버튼 클릭 시
  - 회원가입 클릭 시 회원가입 페이지로 이동합니다.
 
 <b>14. 계약하기</b>
 ![image](https://user-images.githubusercontent.com/63082842/106247326-b5b04300-6252-11eb-854d-2dd2896be434.png)
 - 비밀번호 확인 후 일치하면 상세 페이지로 이동합니다.
 
 <b>15. 어드민 부터 대시보드</b>
 ![image](https://user-images.githubusercontent.com/63082842/106247390-cf518a80-6252-11eb-8cbd-bf39dfb39a6f.png)
 - 보고있던 상품 내용을 함께 불러오며, 상품 사진 클릭 시 상품 페이지로 이동할 수 있습니다.

 <b>16. 회원관리</b>
 ![image](https://user-images.githubusercontent.com/63082842/106247390-cf518a80-6252-11eb-8cbd-bf39dfb39a6f.png)

 <b>17. 매물관리 판매상태별 메뉴</b>
 ![image](https://user-images.githubusercontent.com/63082842/106247390-cf518a80-6252-11eb-8cbd-bf39dfb39a6f.png)

 <b>18. 문의 관리</b>
 ![image](https://user-images.githubusercontent.com/63082842/106247390-cf518a80-6252-11eb-8cbd-bf39dfb39a6f.png)
