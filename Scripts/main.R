#Очистка переменных (рабочего пространства)
rm(list=ls())

#Загрузка параметров (в том числе директорий)
source('./Scripts/parameters.r', echo=F)

#Загрузка скриптов
source(data_analysis_script, echo=F)
source(read_write_script, echo=F)
source(graphic_analysis_script, echo=F)
source(regression_analysis_script, echo=F)
source(clustering_analysis_script, echo=F)

#Загрузка меню
work <- main_menu_function()
