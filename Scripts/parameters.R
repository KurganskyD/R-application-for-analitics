#�������� ���������
if (!require(car))
{
print('�� ���������� car')
}
if (!require(rgl))
{
print('�� ���������� rgl')
}
if (!require(xlsx))
{
print('�� ���������� xlsx')
}

#�������� ����������
data_analysis_script <- './Scripts/menu.r' 
read_write_script <- './Library/read-write.r'
graphic_analysis_script <- './Library/graphic_analysis.r'
regression_analysis_script <- './Library/regression_analysis.r'
clustering_analysis_script <- './Library/clustering_analysis.r'

