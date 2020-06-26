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