use OopProject;

CREATE TABLE DISHES (
    DISH_ID INT AUTO_INCREMENT,
    DISH_NAME CHAR(128) UNIQUE,
	RATE INT,
	AUTHOR INT,
	APPROVED INT,
	RECEIPT text,
	PICTURE BLOB
);

INSERT INTO DISHES(DISH_NAME,RATE, AUTHOR, APPROVED, RECEIPT, PICTURE) VALUES("xach", 0, 1, 0, "bla", 'D:\Users\miriani\Desktop\xach.png');

/* axali id-s dagenerirebistvis
	E.I. yoveli kerdzis damatebisas avigebt am id-s dish_id-s vnaxavt ramdenia,
	gavzrdit da gazrdils davamatebt axali kerdzis id-ad.
*/


CREATE TABLE INGREDIENTS (
	DISH_ID INT,
	INGREDIENT_ID INT,
	AMOUNT CHAR(128)
);

CREATE TABLE INGREDIENT (
	INGREDIENT_ID INT AUTO_INCREMENT,
	INGREDIENT_NAME CHAR(128) UNIQUE,
	PICTURE BLOB
);


CREATE TABLE USER (
	USER_ID INT AUTO_INCREMENT,
	USER_NAME CHAR(128),
	USER_PASSWORD CHAR(128),
	ROLE INT /* ROLE : 0=USER, 1=ADMIN */
);

/*imisatvis rom davagenerirot axali id */
INSERT INTO USER VALUES (0, "ID", "", -1);


CREATE TABLE COMMENTS (
	COMMENT_ID INT AUTO_INCREMENT,
	COMMENT_BODY TEXT,
	USER_ID INT,
	DISH_ID INT
);

INSERT INTO COMMENTS VALUES (0, "",-1,-1);

CREATE TABLE WISH_LIST (
	USER_ID INT,
	DISH_ID INT
);