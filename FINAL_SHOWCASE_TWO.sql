/* «¿“–¿“€ Õ¿ –≈ÃŒÕ“ œŒ Ã¿– ¿Ã ¿¬“ŒÃŒ¡»Àﬂ */
CREATE TABLE REPAIR_COSTS_CAR
(   CAR_BRAND       VARCHAR2(50)
    , CNT_CAR       NUMBER(10, 0)    
    , PRC_SERVICE   NUMBER(20, 0) 
    , AVG_CHECK     NUMBER(20, 2)
 );
 /
INSERT INTO REPAIR_COSTS_CAR
    (   CAR_BRAND, CNT_CAR, PRC_SERVICE, AVG_CHECK   )
    SELECT  C.CAR_BRAND 
            , B.CNT_CAR
            , SUM(C.PRC_SERVICE)
            , ROUND(SUM(C.PRC_SERVICE) / B.CNT_CAR, 2)
    FROM basic_showcase_two C
    INNER JOIN (SELECT  A.CAR_BRAND
                        , COUNT(A.CAR_BRAND) AS CNT_CAR 
                FROM basic_showcase_two A
                GROUP BY  A.CAR_BRAND) B ON B.CAR_BRAND = C.CAR_BRAND
    GROUP BY C.CAR_BRAND, B.CNT_CAR;
/