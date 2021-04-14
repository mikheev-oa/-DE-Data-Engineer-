/* ������ � ����������� */
CREATE TABLE VEHICLE_DATA
(   VIN_NUMB        VARCHAR2(100)
    , CNT_TRIP      NUMBER(20, 0)    
    , TYPE_CAR      VARCHAR2(35)   
    , SUM_TRIP_RUB  NUMBER(20, 0)
    , TOTAL_MILEAGE NUMBER(20, 0)
    , OUTLAY_RUB    NUMBER(20, 0)
 );
 /
INSERT INTO VEHICLE_DATA
    (   VIN_NUMB, CNT_TRIP, TYPE_CAR, SUM_TRIP_RUB, TOTAL_MILEAGE, OUTLAY_RUB   )
    SELECT  A.VIN_NUMB AS VIN_NUMB
            , COUNT(A.VIN_NUMB) AS CNT_TRIP
            , A.TYPE_CAR    
            , SUM(A.FUEL_RATE) AS SUM_TRIP_RUB
            , SUM(A.DISTANCE_ADR_BOARD) * 2 AS TOTAL_MILEAGE
            , (((SUM(A.DISTANCE_ADR_BOARD) * 2) / 100) * A.FUEL_CONSUMPTION) * A.PRICE_CONS AS "OUTLAY_RUB"
    FROM basic_showcase_one A
    GROUP BY A.VIN_NUMB, A.TYPE_CAR, A.FUEL_CONSUMPTION, A.PRICE_CONS, A.FUEL_CONSUMPTION, A.PRICE_CONS;
/

/* ��������� ���������� */
CREATE TABLE DISP_EARNINGS
(   ID_DISPATCHER     NUMBER(20, 0)
    , CNT_ORDERS      NUMBER(20, 0) 
    , DISPATCHER_NAME VARCHAR2(100)
    , INCOME_DISP     NUMBER(20, 0)   
 );
 /
INSERT INTO DISP_EARNINGS
    (   ID_DISPATCHER, CNT_ORDERS, DISPATCHER_NAME, INCOME_DISP )
    SELECT  A.ID_DISPATCHER
            , COUNT(A.ID_DISPATCHER)
            , A.DISPATCHER_NAME
            , (SUM(A.FUEL_RATE) / 100) * A.PERC_DISPATHER AS INCOME_DISP
    FROM basic_showcase_one A 
    GROUP BY A.ID_DISPATCHER, A.DISPATCHER_NAME, A.PERC_DISPATHER ;
/

/* ��������� �������� */
CREATE TABLE DRIVER_EARNINGS
(   ID_DRIVER       NUMBER(20, 0)
    , CNT_ORDERS    NUMBER(20, 0) 
    , DRIVER_NAME   VARCHAR2(100)
    , INCOME_DRIVER NUMBER(20, 0)   
);
 /
INSERT INTO DRIVER_EARNINGS
    (   ID_DRIVER, CNT_ORDERS, DRIVER_NAME, INCOME_DRIVER )
    SELECT  A.ID_DRIVER
            , COUNT(A.ID_DRIVER)
            , A.DRIVER_NAME
            , (SUM(A.FUEL_RATE) / 100) * A.PERC_DRIVER AS INCOME_DRIVER
    FROM basic_showcase_one A 
    GROUP BY A.ID_DRIVER, A.DRIVER_NAME, A.PERC_DRIVER ;
/

/* ������ ����� �������� */
CREATE TABLE FULL_COMPANY_REVENUE
(   ALL_INCOME       NUMBER(30, 0)
);
 /
INSERT INTO FULL_COMPANY_REVENUE
    (   ALL_INCOME )
    SELECT  SUM(SUM(FUEL_RATE) - ((((SUM(A.DISTANCE_ADR_BOARD) * 2) / 100) * A.FUEL_CONSUMPTION) * A.PRICE_CONS) - ((SUM(A.FUEL_RATE) / 100) * A.PERC_DISPATHER) - ((SUM(A.FUEL_RATE) / 100) * A.PERC_DRIVER)) AS ALL_INCOME
    FROM basic_showcase_one A 
    GROUP BY A.FUEL_CONSUMPTION, A.PRICE_CONS, A.PERC_DISPATHER, A.PERC_DRIVER;
/ 






