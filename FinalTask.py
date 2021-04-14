# -*- coding: utf-8 -*-
"""
Created on Fri Apr  9 13:35:40 2021

@author: Pit
"""


# Загрузка данных из нескольких листов одного файла Excel

import sqlalchemy as adb
from sqlalchemy import MetaData
import cx_Oracle as ora
import pandas as pd 


print("\033[H\033[J")


l_file_excel = ''
l_user = 'MIKHEEV_OA'
l_pass = 'Km1040013'
l_tns = ora.makedsn('13.95.167.129', 1521, service_name = 'pdb1')
l_put_file = r'C:\Users\Pit\Documents\REBOOT. Школа DE (Data Engineer)\Занятия\Итоговое задание\Tables.xlsx'
l_conn_ora = adb.create_engine(r'oracle://{p_user}:{p_pass}@{p_tns}'.format(
    p_user = l_user
    , p_pass = l_pass
    , p_tns = l_tns
    )
    )
print(l_conn_ora)


# Загрузка из листа "Price_kilometer"
def Loading_Table_Price_kilometer():
    l_count_str = 0
    l_tabl_name = 'price_kilometer' 
    l_sheet_name = 'Price_kilometer'
    l_meta = MetaData(l_conn_ora)
    l_meta.reflect()
    l_tax = l_meta.tables[l_tabl_name]
    l_file_excel = pd.read_excel(l_put_file, l_sheet_name)
    l_list = l_file_excel.values.tolist()
    for i in l_list:
        #print(i[0], i[1], i[2])
        l_tax.insert([    l_tax.c.type_car
                          , l_tax.c.price_km
                          , l_tax.c.perc_discount_on_card]).values(
                              type_car = i[0]
                              , price_km = i[1]
                              , perc_discount_on_card = i[2]
                              ).execute()
    #l_conn_ora.execute(adb.text('BEGIN pkg_dem.make_aggr_tax_f; END;'))
        l_count_str = l_count_str + 1
    print('Готово. В БД {l_t_name} записано {l_cnt_str} строк'.format(
        l_t_name = l_tabl_name
        , l_cnt_str = l_count_str
        )
        )
#===============================================================================
    
# Загрузка из листа "Driver"
def Loading_Table_Drivers_Lst():
    l_count_str = 0
    l_tabl_name = 'drivers_lst' 
    l_sheet_name = 'Driver_lst'
    l_meta = MetaData(l_conn_ora)
    l_meta.reflect()
    l_tax = l_meta.tables[l_tabl_name]
    l_file_excel = pd.read_excel(l_put_file, l_sheet_name)
    l_list = l_file_excel.values.tolist()
    for i in l_list:  
        l_tax.insert([    l_tax.c.id_driver
                          , l_tax.c.surname_dr
                          , l_tax.c.name_dr
                          , l_tax.c.patronymic_dr
                          , l_tax.c.perc_payment_work
                          , l_tax.c.date_birth
                          , l_tax.c.dr_license_series
                          , l_tax.c.dr_license_numb
                          , l_tax.c.work_experience
                          , l_tax.c.dr_category
                          , l_tax.c.vin_numb]).values(
                              id_driver = i[0]
                              , surname_dr = i[1]
                              , name_dr = i[2]
                              , patronymic_dr = i[3]
                              , perc_payment_work = i[4]
                              , date_birth = i[5]
                              , dr_license_series = i[6]
                              , dr_license_numb = i[7]
                              , work_experience = i[8]
                              , dr_category = i[9]
                              , vin_numb = i[10]
                              ).execute()
    #l_conn_ora.execute(adb.text('BEGIN pkg_dem.make_aggr_tax_f; END;'))
        l_count_str = l_count_str + 1
        print("\033[H\033[J")
        print('В БД "{l_t_name}" записано {l_cnt_str} строк'.format(
            l_t_name = l_tabl_name
            , l_cnt_str = l_count_str))
    print("Готово")
#===============================================================================

# Загрузка из листа "Application_service"
def Loading_Table_Application_service():
    l_count_str = 0
    l_tabl_name = 'application_service' 
    l_sheet_name = 'Application_service'
    l_meta = MetaData(l_conn_ora)
    l_meta.reflect()
    l_tax = l_meta.tables[l_tabl_name]
    l_file_excel = pd.read_excel(l_put_file, l_sheet_name)
    l_list = l_file_excel.values.tolist()
    for i in l_list:  
        l_tax.insert([    l_tax.c.id_app
                          , l_tax.c.vin_numb
                          , l_tax.c.app_dt]).values(
                              id_app = i[0]
                              , vin_numb = i[1]
                              , app_dt = i[2]
                              ).execute()
    #l_conn_ora.execute(adb.text('BEGIN pkg_dem.make_aggr_tax_f; END;'))
        l_count_str = l_count_str + 1
        print("\033[H\033[J")
        print('В БД "{l_t_name}" записано {l_cnt_str} строк'.format(
            l_t_name = l_tabl_name
            , l_cnt_str = l_count_str))
    print("Готово")
#===============================================================================
# Загрузка из листа Dispatcher   
def Loading_Table_Dispatcher():
    l_count_str = 0
    l_tabl_name = 'dispatcher' 
    l_sheet_name = 'Dispatcher'
    l_meta = MetaData(l_conn_ora)
    l_meta.reflect()
    l_tax = l_meta.tables[l_tabl_name]
    l_file_excel = pd.read_excel(l_put_file, l_sheet_name)
    l_list = l_file_excel.values.tolist()
    for i in l_list:  
        l_tax.insert([    l_tax.c.id_dispatcher
                          , l_tax.c.surname_ds
                          , l_tax.c.name_ds
                          , l_tax.c.patronymic_ds
                          , l_tax.c.perc_payment_work
                          , l_tax.c.date_birth
                          , l_tax.c.passport_series
                          , l_tax.c.passport_number]).values(
                              id_dispatcher = i[0]
                              , surname_ds = i[1]
                              , name_ds = i[2]
                              , patronymic_ds = i[3]
                              , perc_payment_work = i[4]
                              , date_birth = i[5]
                              , passport_series = i[6]
                              , passport_number = i[7]
                              ).execute()
    #l_conn_ora.execute(adb.text('BEGIN pkg_dem.make_aggr_tax_f; END;'))
        l_count_str = l_count_str + 1
        print("\033[H\033[J")
        print('В БД "{l_t_name}" записано {l_cnt_str} строк'.format(
            l_t_name = l_tabl_name
            , l_cnt_str = l_count_str))
    print("Готово")
#===============================================================================    
    
# Загрузка из листа Automobil   
def Loading_Table_Automobil():
    l_count_str = 0
    l_tabl_name = 'automobil' 
    l_sheet_name = 'Automobil'
    l_meta = MetaData(l_conn_ora)
    l_meta.reflect()
    l_tax = l_meta.tables[l_tabl_name]
    l_file_excel = pd.read_excel(l_put_file, l_sheet_name)
    l_list = l_file_excel.values.tolist()
    for i in l_list: 
        i[0] = ''.join(i[0].split())
        l_tax.insert([    l_tax.c.state_number
                          , l_tax.c.car_brand
                          , l_tax.c.vin_numb
                          , l_tax.c.color_car
                          , l_tax.c.year_release
                          , l_tax.c.commissioning_car
                          , l_tax.c.type_car
                          , l_tax.c.fuel_consumption
                          , l_tax.c.octane_number]).values(
                              state_number = i[0]
                              , car_brand = i[1]
                              , vin_numb = i[2]
                              , color_car = i[3]
                              , year_release = i[4]
                              , commissioning_car = i[5]
                              , type_car = i[6]
                              , fuel_consumption = i[7]
                              , octane_number = i[8]
                              ).execute()
    #l_conn_ora.execute(adb.text('BEGIN pkg_dem.make_aggr_tax_f; END;'))
        l_count_str = l_count_str + 1
        print("\033[H\033[J")
        print('В БД "{l_t_name}" записано {l_cnt_str} строк'.format(
            l_t_name = l_tabl_name
            , l_cnt_str = l_count_str))
    print("Готово")
#===============================================================================

# Загрузка из листа Maintenance_repair_price   
def Loading_Table_Maintenance_repair_price():
    l_count_str = 0
    l_tabl_name = 'maintenance_prc' 
    l_sheet_name = 'Maintenance_repair_price'
    l_meta = MetaData(l_conn_ora)
    l_meta.reflect()
    l_tax = l_meta.tables[l_tabl_name]
    l_file_excel = pd.read_excel(l_put_file, l_sheet_name)
    l_list = l_file_excel.values.tolist()
    for i in l_list: 
        l_tax.insert([    l_tax.c.service_car
                          , l_tax.c.vin_numb
                          , l_tax.c.type_service
                          , l_tax.c.price_service]).values(
                              service_car = i[0]
                              , vin_numb = i[1]
                              , type_service = i[2]
                              , price_service = i[3]
                              ).execute()
    #l_conn_ora.execute(adb.text('BEGIN pkg_dem.make_aggr_tax_f; END;'))
        l_count_str = l_count_str + 1
        print("\033[H\033[J")
        print('В БД "{l_t_name}" записано {l_cnt_str} строк'.format(
            l_t_name = l_tabl_name
            , l_cnt_str = l_count_str))
    print("Готово")
#===============================================================================

# Загрузка из листа Applicat   
def Loading_Table_Applicat():
    l_count_str = 0
    l_tabl_name = 'app_licat' 
    l_sheet_name = 'Applicat'
    l_meta = MetaData(l_conn_ora)
    l_meta.reflect()
    l_tax = l_meta.tables[l_tabl_name]
    l_file_excel = pd.read_excel(l_put_file, l_sheet_name)
    l_list = l_file_excel.values.tolist()
    for i in l_list: 
        l_tax.insert([    l_tax.c.id_app
                          , l_tax.c.id_dispatcher
                          , l_tax.c.id_driver
                          , l_tax.c.numb_teleph_cust
                          , l_tax.c.discount_card
                          , l_tax.c.app_dt
                          , l_tax.c.adr_board
                          , l_tax.c.distr_travel
                          , l_tax.c.street_travel
                          , l_tax.c.home_numb
                          , l_tax.c.evaluation_trip]).values(
                              id_app = i[0]
                              , id_dispatcher = i[1]
                              , id_driver = i[2]
                              , numb_teleph_cust = i[3]
                              , discount_card = i[4]
                              , app_dt = i[5]
                              , adr_board = i[6]
                              , distr_travel = i[7]
                              , street_travel = i[8]
                              , home_numb = i[9]
                              , evaluation_trip = i[10]
                              ).execute()
    #l_conn_ora.execute(adb.text('BEGIN pkg_dem.make_aggr_tax_f; END;'))
        l_count_str = l_count_str + 1
        print("\033[H\033[J")
        print('В БД "{l_t_name}" записано {l_cnt_str} строк'.format(
            l_t_name = l_tabl_name
            , l_cnt_str = l_count_str))
    print("Готово")
#===============================================================================  

# Загрузка из листа Price_distinct   
def Loading_Table_Price_distinct():
    l_count_str = 0
    l_tabl_name = 'price_distinct' 
    l_sheet_name = 'Price_distinct'
    l_meta = MetaData(l_conn_ora)
    l_meta.reflect()
    l_tax = l_meta.tables[l_tabl_name]
    l_file_excel = pd.read_excel(l_put_file, l_sheet_name)
    l_list = l_file_excel.values.tolist()
    for i in l_list: 
        l_tax.insert([    l_tax.c.city_district
                          , l_tax.c.price_trip]).values(
                              city_district = i[0]
                              , price_trip = i[1]
                              ).execute()
    #l_conn_ora.execute(adb.text('BEGIN pkg_dem.make_aggr_tax_f; END;'))
        l_count_str = l_count_str + 1
        print("\033[H\033[J")
        print('В БД "{l_t_name}" записано {l_cnt_str} строк'.format(
            l_t_name = l_tabl_name
            , l_cnt_str = l_count_str))
    print("Готово")    
#===============================================================================

# Загрузка из листа Area_distance   
def Loading_Table_Area_distance():
    l_count_str = 0
    l_tabl_name = 'area_distance' 
    l_sheet_name = 'Area_distance'
    l_meta = MetaData(l_conn_ora)
    l_meta.reflect()
    l_tax = l_meta.tables[l_tabl_name]
    l_file_excel = pd.read_excel(l_put_file, l_sheet_name)
    l_list = l_file_excel.values.tolist()
    for i in l_list: 
        l_tax.insert([    l_tax.c.area_item
                          , l_tax.c.distance_adr_board]).values(
                              area_item = i[0]
                              , distance_adr_board = i[1]
                              ).execute()
    #l_conn_ora.execute(adb.text('BEGIN pkg_dem.make_aggr_tax_f; END;'))
        l_count_str = l_count_str + 1
        print("\033[H\033[J")
        print('В БД "{l_t_name}" записано {l_cnt_str} строк'.format(
            l_t_name = l_tabl_name
            , l_cnt_str = l_count_str))
    print("Готово")    
#===============================================================================    

# Загрузка из листа Region_distance   
def Loading_Table_Region_distance():
    l_count_str = 0
    l_tabl_name = 'region_distance' 
    l_sheet_name = 'Region_distance'
    l_meta = MetaData(l_conn_ora)
    l_meta.reflect()
    l_tax = l_meta.tables[l_tabl_name]
    l_file_excel = pd.read_excel(l_put_file, l_sheet_name)
    l_list = l_file_excel.values.tolist()
    for i in l_list: 
        l_tax.insert([    l_tax.c.region_item
                          , l_tax.c.distance_adr_board]).values(
                              region_item = i[0]
                              , distance_adr_board = i[1]
                              ).execute()
    #l_conn_ora.execute(adb.text('BEGIN pkg_dem.make_aggr_tax_f; END;'))
        l_count_str = l_count_str + 1
        print("\033[H\033[J")
        print('В БД "{l_t_name}" записано {l_cnt_str} строк'.format(
            l_t_name = l_tabl_name
            , l_cnt_str = l_count_str))
    print("Готово")       
#===============================================================================    

# Загрузка из листа Сonsumption_price   
def Loading_Table_Сonsumption_price():
    l_count_str = 0
    l_tabl_name = 'consumption_price' 
    l_sheet_name = 'Сonsumption_price'
    l_meta = MetaData(l_conn_ora)
    l_meta.reflect()
    l_tax = l_meta.tables[l_tabl_name]
    l_file_excel = pd.read_excel(l_put_file, l_sheet_name)
    l_list = l_file_excel.values.tolist()
    for i in l_list: 
        l_tax.insert([    l_tax.c.octane_number
                          , l_tax.c.price_cons]).values(
                              octane_number = i[0]
                              , price_cons = i[1]
                              ).execute()
    #l_conn_ora.execute(adb.text('BEGIN pkg_dem.make_aggr_tax_f; END;'))
        l_count_str = l_count_str + 1
        print("\033[H\033[J")
        print('В БД "{l_t_name}" записано {l_cnt_str} строк'.format(
            l_t_name = l_tabl_name
            , l_cnt_str = l_count_str))
    print("Готово")  
#===============================================================================


      
if __name__ == '__main__' :
    #Loading_Table_Price_kilometer()
    #Loading_Table_Drivers_Lst()
    #Loading_Table_Application_service()
    #Loading_Table_Dispatcher()
    #Loading_Table_Automobil()
    #Loading_Table_Maintenance_repair_price()
    #Loading_Table_Applicat()
    #Loading_Table_Price_distinct()
    Loading_Table_Area_distance()
    #Loading_Table_Region_distance()
    #Loading_Table_Сonsumption_price()