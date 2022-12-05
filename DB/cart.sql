/* ----------------- CART TABLE ----------------- */
CREATE TABLE TBL_CART
(
	MEMBER_NUMBER number NOT NULL,
	PRODUCT_NUMBER number NOT NULL,
	CART_COUNT NUMBER,
	CONSTRAINT FK_CART_MEMBER FOREIGN KEY (MEMBER_NUMBER)
	REFERENCES TBL_MEMBER (MEMBER_NUMBER),
	CONSTRAINT FK_CART_PRODUCT FOREIGN KEY (PRODUCT_NUMBER)
	REFERENCES TBL_PRODUCT (PRODUCT_NUMBER),
	CONSTRAINT PK_CART PRIMARY KEY (MEMBER_NUMBER, PRODUCT_NUMBER)
);

DROP TABLE TBL_CART;
SELECT * FROM TBL_CART;
/* ----------------------------------------------------- */
INSERT INTO TBL_CART
(MEMBER_NUMBER, PRODUCT_NUMBER, CART_COUNT)
VALUES(26, 3, 3);
INSERT INTO TBL_CART
(MEMBER_NUMBER, PRODUCT_NUMBER, CART_COUNT)
VALUES(26, 1, 1);

MERGE INTO TBL_CART
USING DUAL
ON (MEMBER_NUMBER=26 AND PRODUCT_NUMBER=1)
WHEN MATCHED THEN
UPDATE SET CART_COUNT=1
WHEN NOT MATCHED THEN
INSERT(MEMBER_NUMBER, PRODUCT_NUMBER, CART_COUNT)
VALUES(26, 1, 1);

SELECT C.PRODUCT_NUMBER, CART_COUNT, PRODUCT_NAME, PRODUCT_PRICE, ADDRESS_MAIN, ADDRESS_DETAIL
FROM (TBL_ADDRESS A LEFT JOIN TBL_CART C
ON A.MEMBER_NUMBER=C.MEMBER_NUMBER
INNER JOIN TBL_PRODUCT P
ON C.PRODUCT_NUMBER=P.PRODUCT_NUMBER)
WHERE A.MEMBER_NUMBER = 26 AND A.ADDRESS_STATUS='기본배송지';

SELECT A.MEMBER_NUMBER, C.PRODUCT_NUMBER, CART_COUNT, ADDRESS_MAIN, ADDRESS_DETAIL, ADDRESS_STATUS
FROM TBL_ADDRESS A LEFT JOIN TBL_CART C
ON A.MEMBER_NUMBER=C.MEMBER_NUMBER
WHERE A.MEMBER_NUMBER = 26 AND A.ADDRESS_STATUS='기본배송지';

SELECT * FROM TBL_PRODUCT;


