CREATE TABLE basic_showcase_two
(   STATE_NUMBER        VARCHAR2(20)
    , CAR_BRAND         VARCHAR2(50)    
    , VIN_NUMB          VARCHAR2(50)
    , TYPE_CAR          VARCHAR2(20)
    , FUEL_CONSUMPTION  NUMBER(10, 0)
    , OCTANE_NUMBER     NUMBER(10, 0)
    , PRC_SERVICE       NUMBER(30, 0)
    , PRICE_CONS        NUMBER(10, 0)
 );
/

INSERT INTO basic_showcase_TWO
(   STATE_NUMBER, CAR_BRAND, VIN_NUMB, TYPE_CAR, FUEL_CONSUMPTION
    , OCTANE_NUMBER, PRC_SERVICE, PRICE_CONS    )
SELECT  A.STATE_NUMBER
        , A.CAR_BRAND
        , A.VIN_NUMB
        , A.TYPE_CAR
        , A.FUEL_CONSUMPTION
        , A.OCTANE_NUMBER
        , B.PRC_SERVICE
        , C.PRICE_CONS
FROM automobil A
LEFT JOIN ( SELECT  VIN_NUMB
                    , SUM(PRICE_SERVICE) AS PRC_SERVICE 
            FROM maintenance_prc
            GROUP BY VIN_NUMB) B ON A.VIN_NUMB = B.VIN_NUMB
LEFT JOIN consumption_price C ON  C.OCTANE_NUMBER = A.OCTANE_NUMBER;
/
