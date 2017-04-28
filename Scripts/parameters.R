#проверка библиотек
if (!require(car))
{
print('не установлен car')
}
if (!require(rgl))
{
print('не установлен rgl')
}
if (!require(xlsx))
{
print('не установлен xlsx')
}

#Указание директорий
data_analysis_script <- './Scripts/menu.r' 
read_write_script <- './Library/read-write.r'
graphic_analysis_script <- './Library/graphic_analysis.r'
regression_analysis_script <- './Library/regression_analysis.r'
clustering_analysis_script <- './Library/clustering_analysis.r'

