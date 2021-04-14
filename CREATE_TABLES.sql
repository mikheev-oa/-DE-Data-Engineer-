/* type_car ��� ���������� (��������, �������, ������)
# price_km  ��������� ������� �� ���������� ��� �������
# perc_discount_on_card ������ �� ������� �� ���������� ����� � ��������� ��� �������
*/
CREATE TABLE price_kilometer
(   
    type_car                    VARCHAR2(20)
    , price_km                  NUMBER(10, 0)   NOT NULL
    , perc_discount_on_card     NUMBER(10, 0)   NOT NULL
    , CONSTRAINT price_kilometer PRIMARY KEY (type_car)
 );
/

/*
id_driver   �������� ����
surname_dr  �������
name_dr     ���
patronymic_dr   ��������
perc_payment_work   ������� ������� �������� �������� ����� �� ��������� �������
date_birth  ���� ��������
dr_license_series   ����� ������������ �������������
dr_license_numb ����� ������������� �������������
work_experience ���� ������ ���������
dr_category ��������� ������������� �������������
vin_numb    VIN ������, �� ������� �� ��������
d�_dismissal    ������� ����, ��� ������
*/
CREATE TABLE drivers_lst
(   
    id_driver                   NUMBER(10, 0)
    , surname_dr                VARCHAR2(25)    NOT NULL
    , name_dr                   VARCHAR2(25)    NOT NULL
    , patronymic_dr             VARCHAR2(25)
    , perc_payment_work         NUMBER(10, 0)   NOT NULL
    , date_birth                DATE
    , dr_license_series         VARCHAR2(50)    NOT NULL
    , dr_license_numb           NUMBER(20, 0)   NOT NULL
    , work_experience           NUMBER(10, 0)   NOT NULL
    , dr_category               VARCHAR2(50)    NOT NULL
    , vin_numb                  VARCHAR2(100)   NOT NULL
    , CONSTRAINT Drivers PRIMARY KEY (id_driver)
 );
/

/*
id_app  ������� � ����� �� ����� � ������� Applicat
vin_numb    ������� � ����� �� ����� � Automobil VIN ����� ����������
app_dt  ������� � ����� �� ����� � Applicat ���� �������
*/
CREATE TABLE application_service
(   
    id_app      NUMBER(10, 0)  NOT NULL
    , vin_numb  VARCHAR2(100)    NOT NULL
    , app_dt    DATE    NOT NULL
 );
/

/*
# id_dispatcher ID ����������
# surname_ds    �������
# name_ds   ���
# patronymic_ds ��������
# perc_payment_work     ������� �� ������
# date_birth    ���� ��������
# passport_series   ����� ��������
# passport_number   ����� ��������
# dismissed_ds  ���� ���������� (���� �� 01.01.1900)
*/
CREATE TABLE dispatcher
(   id_dispatcher           NUMBER(10, 0)   
    , surname_ds            VARCHAR2(50)   
    , name_ds               VARCHAR2(50)    
    , patronymic_ds         VARCHAR2(50)
    , perc_payment_work     NUMBER(10, 0)
    , date_birth            DATE
    , passport_series       NUMBER(10, 0)
    , passport_number       NUMBER(10, 0)
 );
/

/*
state_number    �������� ����������
car_brand       ����� ����������
vin_numb    VIN �����
color_car   ����
year_release    ��� �������
commissioning_car   � ����� ���� ��������
type_car    ��� ���������� �� ������������� �����
fuel_consumption    ������ ������� �� 100 ����������
octane_number   ��������� ����� �������
*/
CREATE TABLE automobil
(   state_number            VARCHAR2(50)   NOT NULL
    , car_brand             VARCHAR2(50)    
    , vin_numb              VARCHAR2(50)   NOT NULL
    , color_car             VARCHAR2(50)
    , year_release          VARCHAR2(50)
    , commissioning_car     DATE
    , type_car              VARCHAR2(50)
    , fuel_consumption      NUMBER(10, 0)
    , octane_number         NUMBER(10, 0)
 );
/

/*
service_car ���� �������
vin_numb    VIN �����
type_service    ��� �������
price_service   ��������� 
*/
CREATE TABLE maintenance_prc
(   service_car     DATE
    , vin_numb      VARCHAR2(50)    
    , type_service  VARCHAR2(50)   
    , price_service NUMBER(10, 0)
 );
 
/*
id_app �� ������
id_dispatcher �� ����������
id_driver   �� ��������
numb_teleph_cust    ����� �������� �������
discount_card �������  ������� ���������� �����
app_dt  ���� �������
adr_board   ����� �����������
distr_travel    ����� ����������
street_travel ����� ����������
home_numb   ����� ����
evaluation_trip ������ ������� ��������
*/
CREATE TABLE app_licat
(   id_app              NUMBER(10, 0)
    , id_dispatcher     NUMBER(10, 0)    
    , id_driver         NUMBER(10, 0)   
    , numb_teleph_cust  VARCHAR2(35)
    , discount_card     VARCHAR2(25)
    , app_dt            DATE
    , adr_board         VARCHAR2(100)
    , distr_travel      VARCHAR2(100)
    , street_travel     VARCHAR2(100)
    , home_numb         VARCHAR2(25)
    , evaluation_trip   NUMBER(15, 0)
 );
/

/*
city_district ����� ������
price_trip  ��������� �������
*/
CREATE TABLE price_distinct
(   city_district   VARCHAR2(100)
    , price_trip    NUMBER(10, 0)    
 );
/

/*
area_item   ����� �������
distance_adr_board  ��������� �������
*/
CREATE TABLE area_distance
(   area_item               VARCHAR2(100)
    , distance_adr_board    NUMBER(10, 0)    
 );
/

 /*
octane_number     ��������� ����� �������
price_cons ���� �������
*/
CREATE TABLE consumption_price
(   octane_number   NUMBER(10, 0)
    , price_cons    NUMBER(10, 0)    
 );
/