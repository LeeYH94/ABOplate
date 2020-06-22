DROP TABLE MEMBER;

CREATE TABLE "MEMBER"(
	member_id VARCHAR2(30),
	member_name VARCHAR2(30) DEFAULT NULL,
	member_email VARCHAR2(30) DEFAULT NULL,
	member_password VARCHAR2(30) DEFAULT NULL,
	member_nickname VARCHAR2(50) UNIQUE,
	member_stamp NUMBER DEFAULT NULL,
	member_preference_food VARCHAR2(100) DEFAULT NULL,
	member_region VARCHAR2(20) DEFAULT NULL,
	member_report NUMBER DEFAULT NULL,
	member_last_report DATE DEFAULT NULL,
	member_type NUMBER DEFAULT 1,
	CONSTRAINT NUMBER_PK PRIMARY KEY(member_id)
);

DROP TABLE "MEMBER";

INSERT INTO MEMBER
(MEMBER_Id, MEMBER_PASSWORD, MEMBER_NICKNAME)
VALUES('asd123', '1234', 'test');

CREATE SEQUENCE restaurant_seq;
DROP SEQUENCE restaurant_seq;

CREATE TABLE RESTAURANT(
	restaurant_num NUMBER,
	restaurant_tel VARCHAR2(30),
	restaurant_name VARCHAR2(30),
	restaurant_address_road VARCHAR2(200),
	restaurant_address VARCHAR2(200),
	restaurant_food_category VARCHAR2(50),
	restaurant_parking CHAR,
	restaurant_day_off VARCHAR(30),
	restaurant_menu_board VARCHAR2(500),
	restaurant_local_currency CHAR,
	restaurant_age_group NUMBER,
	restaurant_business_day VARCHAR2(1000),
	restaurant_ration_total NUMBER DEFAULT 0,
	restaurant_hit NUMBER DEFAULT 0,
	CONSTRAINT RESTAURANT_PK PRIMARY KEY(restaurant_num),
	CONSTRAINT RESTAURANT_PARKING CHECK(restaurant_parking = 'O' OR restaurant_parking = 'X'),
	CONSTRAINT RESTAURANT_LOCAL_CURRENCY CHECK(restaurant_local_currency = 'O' OR restaurant_local_currency = 'X')	
);

DROP TABLE RESTAURANT;

CREATE SEQUENCE review_seq;
DROP SEQUENCE review_seq;

CREATE TABLE REVIEW(
	review_num NUMBER,
	restaurant_num NUMBER,
	member_nickname VARCHAR2(50),
	review VARCHAR2(3000),
	review_ration NUMBER,
	review_report CHAR,
	review_upload_date DATE,
	CONSTRAINT REVIEW_PK PRIMARY KEY(review_num),
	CONSTRAINT REVIEW_FK_1 FOREIGN KEY(restaurant_num) REFERENCES RESTAURANT(restaurant_num),
	CONSTRAINT REVIEW_FK_2 FOREIGN KEY(member_nickname) REFERENCES "MEMBER"(member_nickname)
);

CREATE SEQUENCE bookmark_seq;
DROP SEQUENCE bookmark_seq;

CREATE TABLE BOOKMARK(
	bookmark_num NUMBER,
	email VARCHAR2(50),
	restaurant_num NUMBER,
	CONSTRAINT BOOKMARK_FK_1 FOREIGN KEY(email) REFERENCES "MEMBER"(member_email),
	CONSTRAINT BOOKMARK_FK_2 FOREIGN KEY(restaurant_num) REFERENCES RESTAURANT(restaurant_num),	
)

CREATE TABLE MENU_LIST(
	restaurant_num NUMBER,
	menu VARCHAR2(30),
	price VARCHAR2(30),
	CONSTRAINT MENU_LIST_FK FOREIGN KEY(restaurant_num) REFERENCES RESTAURANT(restaurant_num)
);

DROP TABLE MENU_LIST;