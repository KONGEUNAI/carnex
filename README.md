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
 <b>1. 회원가입&회원로그인&직원로그인</b>
 ![image](https://github.com/user-attachments/assets/f44e5250-0752-45f2-9f77-5e3d8d55459b.png)
 - 회원가입 시 입력한 비밀번호는 BcryptpasswordEncoder으로 인코딩되어 DB에 저장됩니다.    
 - 회원가입과 로그인을 탭 기능으로 한 화면에서 처리하도록 구현했습니다.
   
 <b>2. 회원 로그인</b>
 ![image](https://user-images.githubusercontent.com/63082842/106240841-53524500-6248-11eb-884c-5c51142c0813.png)
 
 <b>3. 직원 로그인</b>
 ![image](https://user-images.githubusercontent.com/63082842/106241091-c8be1580-6248-11eb-99b1-bd787c8ab9aa.png)
 
 <b>4. 로그아웃</b>
 
 <b>5. 유저메인페이지</b>
 ![image](https://user-images.githubusercontent.com/63082842/106241659-c14b3c00-6249-11eb-90f6-c3230a020bb4.png)
 - Carousel을 활용하였습니다.
 - grid Layout을 활용하였습니다.
 
 <b>6. 상단바 차종별 검색</b>
 ![image](https://user-images.githubusercontent.com/63082842/106241762-ec359000-6249-11eb-8d99-5bc8ca0e8397.png)
 - SELECT문을 활용하여 company 테이블의 모든 회사명을 불러옵니다. (회사가 추가되어도 따로 수정할 필요가 없습니다.)
 - 모든 페이지에 header와 상단바가 존재하여, filter를 사용하여 모든 페이지에서 사용할 수 있게 하였습니다.
 
 <b>7. 차종별 상품 페이지</b>
 ![image](https://user-images.githubusercontent.com/63082842/106244992-19387180-624f-11eb-9255-987a3590edcc.png)
 
 <b>8. 전체 차량 페이지</b>
 ![image](https://user-images.githubusercontent.com/63082842/106245244-82b88000-624f-11eb-9771-98bec7015d12.png)
 - 검색어를 포함하고 있는 상품명과 회사의 모든 결과를 보여줍니다.

 <b>9. 게시판 페이지</b>
 ![image](https://user-images.githubusercontent.com/63082842/106244815-d8d8f380-624e-11eb-9eee-7b886d0f8d06.png)
 - 유저가 상품을 구매하면 product 테이블의 구매수가 오르게 되고, ORDER BY soldCount DESC을 사용하여 판매량 순으로 조회한 결과입니다.

 <b>10. 검색기능</b>
 ![image](https://user-images.githubusercontent.com/63082842/106245360-aa0f4d00-624f-11eb-9e85-1a0315e1bb34.png)
 - 좌측에 라디오박스의 브랜드 중 클릭된 브랜드의 상품만 보는 기능입니다.
 
 <b>11. 로그인 시 상단 메뉴 추가</b>
 ![image](https://user-images.githubusercontent.com/63082842/106245552-f8245080-624f-11eb-9a16-4b307b6884c4.png)
 - 유저의 등급이 admin 이상이면 상품등록, 상품수정 메뉴가 생깁니다.
 - 유저의 등급이 기본 이상이면 찜, 장바구니, 정보수정, 로그아웃 메뉴가 생깁니다.

 <b>12. 정보수정 클릭 시 비밀번호 재확인</b>
 ![image](https://user-images.githubusercontent.com/63082842/106245663-2c980c80-6250-11eb-9caa-fb189732be99.png)
 - 유저가 자신이 설정한 비밀번호를 입력하면, 입력받은 값을 SHA-256 인코딩을 적용하여 DB에 저장된 값과 비교합니다.

 <b>13. 회원정보 수정</b>
 ![image](https://user-images.githubusercontent.com/63082842/106245704-3faadc80-6250-11eb-93c0-20da739c78c3.png)

 <b>14. 회원 마이페이지</b>
 ![image](https://user-images.githubusercontent.com/63082842/106245704-3faadc80-6250-11eb-93c0-20da739c78c3.png)
 
 <b>15. 상세상품 페이지 - 상단</b>
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
 
 <b>16. 계약하기</b>
 ![image](https://user-images.githubusercontent.com/63082842/106247326-b5b04300-6252-11eb-854d-2dd2896be434.png)
 - 비밀번호 확인 후 일치하면 상세 페이지로 이동합니다.
 
 <b>17. 어드민 부터 대시보드</b>
 ![image](https://user-images.githubusercontent.com/63082842/106247390-cf518a80-6252-11eb-8cbd-bf39dfb39a6f.png)
 - 보고있던 상품 내용을 함께 불러오며, 상품 사진 클릭 시 상품 페이지로 이동할 수 있습니다.

 <b>18. 회원관리</b>
 ![image](https://user-images.githubusercontent.com/63082842/106247390-cf518a80-6252-11eb-8cbd-bf39dfb39a6f.png)

 <b>19. 매물관리 판매상태별 메뉴</b>
 ![image](https://user-images.githubusercontent.com/63082842/106247390-cf518a80-6252-11eb-8cbd-bf39dfb39a6f.png)

 <b>20. 문의 관리</b>
 ![image](https://user-images.githubusercontent.com/63082842/106247390-cf518a80-6252-11eb-8cbd-bf39dfb39a6f.png)
