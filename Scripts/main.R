#������� ���������� (�������� ������������)
rm(list=ls())

#�������� ���������� (� ��� ����� ����������)
source('./Scripts/parameters.r', echo=F)

#�������� ��������
source(data_analysis_script, echo=F)
source(read_write_script, echo=F)
source(graphic_analysis_script, echo=F)
source(regression_analysis_script, echo=F)
source(clustering_analysis_script, echo=F)

#�������� ����
work <- main_menu_function()
