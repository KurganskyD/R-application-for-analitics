#Функция основного меню
main_menu_function = function(){
	#Название элементов меню
	menu_items = c('Инструкция','Загрузить данные','Завершить')
	#Бесконечный цикл для того чтобы меню всегда было открыто пользователю пока не будет произведен выход
	while(T){
		menu_form = menu(menu_items, graphics=T, title='Выбор действия')
		switch(menu_form, 
			#Открыть файл с инструкцией
			{path_to_instraction <- paste0(getwd(), '/Notes/instraction.txt')
			shell.exec(path_to_instraction)},
			#Загрузка данных
			{work_data <- load_file()
			sub_menu_1_function(work_data)
			break},
			#Выход из программы
			{break}
			)
		}
	}

#Функция первого подменю (заменяет основную сразу после первой загрузки данных)
sub_menu_1_function = function(work_data){
	menu_items = c('Изменить данные','Графический анализ', 'Простой регрессионный анализ', 'Многомерный регрессионный анализ', 'Кластерный анализ', 'Завершить')
	while(T){
		menu_form = menu(menu_items, graphics=T, title='Выбор действия')
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

#Функция второго подменю (для выбора типа графика)
sub_menu_2_function = function(work_data){
	menu_items = c('Столбчатая диаграмма','Круговая диаграмма','Диаграмма рассеивания', 'Ящик с усами', 'Гистограмма')
	while(T){
		menu_form = menu(menu_items, graphics=T, title='Выбор действия')
		switch(menu_form,
			#Вызов функций в соотвествие  выбранным пунктом меню
			{barplot_function(work_data); break},
			{piechart_function(work_data); break},
			{scatterplot_function(work_data); break},
			{boxplot_function(work_data); break},
			{hist_function(work_data); break}
			)
		}
	}
