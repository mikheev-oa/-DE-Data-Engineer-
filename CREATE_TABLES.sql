/* type_car тип автомобиля (Стандарт, Комфорт, Бизнес)
# price_km  стоимость проезда на автомобиле для клиента
# perc_discount_on_card скидка на поездку по дисконтной карте В ПРОЦЕНТАХ для клиента
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
id_driver   ключевое поле
surname_dr  фамилия
name_dr     имя
patronymic_dr   отчество
perc_payment_work   процент который получает водитель такси за перевозку клиента
date_birth  день рождения
dr_license_series   серия воительского удостоверения
dr_license_numb номер водительского удостоверения
work_experience стаж работы водителем
dr_category категория водительского удостоверения
vin_numb    VIN машины, на которой он работает
dе_dismissal    признак того, что уволен
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
id_app  Связано с таким же полем в таблице Applicat
vin_numb    Связано с таким же полем в Automobil VIN номер автомобиля
app_dt  Связано с таким же полем в Applicat дата поездки
*/
CREATE TABLE application_service
(   
    id_app      NUMBER(10, 0)  NOT NULL
    , vin_numb  VARCHAR2(100)    NOT NULL
    , app_dt    DATE    NOT NULL
 );
/

/*
# id_dispatcher ID диспетчера
# surname_ds    фамилия
# name_ds   имя
# patronymic_ds отчество
# perc_payment_work     процент от заказа
# date_birth    дата рождения
# passport_series   серия паспорта
# passport_number   номер паспорта
# dismissed_ds  дата увольнения (если не 01.01.1900)
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
state_number    госномер автомобиля
car_brand       марка автомобиля
vin_numb    VIN номер
color_car   цвет
year_release    год выпуска
commissioning_car   с какой даты работает
type_car    тип автомобиля по классификации такси
fuel_consumption    расход топлива на 100 километров
octane_number   октановое число топлива
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
service_car дата сервиса
vin_numb    VIN номер
type_service    тип сервиса
price_service   стоимость 
*/
CREATE TABLE maintenance_prc
(   service_car     DATE
    , vin_numb      VARCHAR2(50)    
    , type_service  VARCHAR2(50)   
    , price_service NUMBER(10, 0)
 );
 
/*
id_app ИД строки
id_dispatcher ИД диспетчера
id_driver   ИД водителя
numb_teleph_cust    номер телефона клиента
discount_card наличие  клиента дисконтной карты
app_dt  дата поездки
adr_board   пункт отправления
distr_travel    район назначения
street_travel улица назначения
home_numb   номер дома
evaluation_trip оценка поездки клиентом
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
city_district район города
price_trip  стоимость поездки
*/
CREATE TABLE price_distinct
(   city_district   VARCHAR2(100)
    , price_trip    NUMBER(10, 0)    
 );
/

/*
area_item   район области
distance_adr_board  стоимость поездки
*/
CREATE TABLE area_distance
(   area_item               VARCHAR2(100)
    , distance_adr_board    NUMBER(10, 0)    
 );
/

 /*
octane_number     октановое число топлива
price_cons цена топлива
*/
CREATE TABLE consumption_price
(   octane_number   NUMBER(10, 0)
    , price_cons    NUMBER(10, 0)    
 );
/