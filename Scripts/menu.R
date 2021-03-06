#������� ��������� ����
main_menu_function = function(){
	#�������� ��������� ����
	menu_items = c('����������','��������� ������','���������')
	#����������� ���� ��� ���� ����� ���� ������ ���� ������� ������������ ���� �� ����� ���������� �����
	while(T){
		menu_form = menu(menu_items, graphics=T, title='����� ��������')
		switch(menu_form, 
			#������� ���� � �����������
			{path_to_instraction <- paste0(getwd(), '/Notes/instraction.txt')
			shell.exec(path_to_instraction)},
			#�������� ������
			{work_data <- load_file()
			sub_menu_1_function(work_data)
			break},
			#����� �� ���������
			{break}
			)
		}
	}

#������� ������� ������� (�������� �������� ����� ����� ������ �������� ������)
sub_menu_1_function = function(work_data){
	menu_items = c('�������� ������','����������� ������', '������� ������������� ������', '����������� ������������� ������', '���������� ������', '���������')
	while(T){
		menu_form = menu(menu_items, graphics=T, title='����� ��������')
		switch(menu_form,
			{work_data = load_file()},
			{sub_menu_2_function(work_data)},
			{simple_linear_regression(work_data)},
			{multiple_linear_regression(work_data)},
			{type_of_user_cluster(work_data)},
			{break}
			)
		}
	}

#������� ������� ������� (��� ������ ���� �������)
sub_menu_2_function = function(work_data){
	menu_items = c('���������� ���������','�������� ���������','��������� �����������', '���� � �����', '�����������')
	while(T){
		menu_form = menu(menu_items, graphics=T, title='����� ��������')
		switch(menu_form,
			#����� ������� � �����������  ��������� ������� ����
			{barplot_function(work_data); break},
			{piechart_function(work_data); break},
			{scatterplot_function(work_data); break},
			{boxplot_function(work_data); break},
			{hist_function(work_data); break}
			)
		}
	}
