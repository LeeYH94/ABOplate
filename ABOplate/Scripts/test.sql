SELECT * FROM RESTAURANT;

SELECT DISTINCT RESTAURANT_FOOD_CATEGORY FROM 
	(SELECT * FROM RESTAURANT WHERE RESTAURANT_FOOD_CATEGORY LIKE '%삼%');

SELECT RESTAURANT_NAME FROM RESTAURANT;
 
SELECT RESTAURANT_NAME FROM RESTAURANT WHERE RESTAURANT_NAME LIKE '%곤%';

SELECT DISTINCT RESTAURANT_NAME FROM RESTAURANT 
		WHERE RESTAURANT_LOCAL_CURRENCY = 'O' AND RESTAURANT_NAME LIKE '%신%';

SELECT DISTINCT SUBSTR(RESTAURANT_ADDRESS, 1, INSTR(RESTAURANT_ADDRESS, ' ', 1, 1)) FROM RESTAURANT
	WHERE RESTAURANT_ADDRESS LIKE '%남%';	
	

 SELECT * FROM
      (SELECT ROWNUM R, V.* FROM
      
     ( SELECT * FROM RESTAURANT WHERE RESTAURANT_NUM = 99, 31, 32)
     
      WHERE L.R BETWEEN 2 AND 3
      
      
      
      
      
SELECT * FROM RESTAURANT WHERE RESTAURANT_NUM IN (99, 32);