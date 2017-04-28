type_of_user_cluster <- function(work) {
	menu_items <- c('Обычный пользователь','Эксперт')
	menu_form = menu(menu_items, graphics=T, title='Выберите Ваш тип пользователя')
	if (menu_form == 1) {cluster_analys_user(work)}
	else {cluster_analys_expert(work)}
}

##Кластерный анализ
cluster_analys_expert <- function(work) {
	menu_items <- c('1','2','3', '4', '5', '6', '7')
	menu_form = menu(menu_items, graphics=T, title='Выбирите кол-во кластеров')
	ind = menu_form
	first_param <- choosing_colums_function('Выбирите 1-ую переменную', work)
	#Выбираем зависимую переменную с помощью функции выбора переменной объявленной выше
	second_param <- choosing_colums_function('Выбирите 2-ую переменную', work)
	#Создаем из выбранных переменных формулу, для ее дальнейшей передачи в функцию boxplot
	columns <- as.formula(paste(first_param, second_param, sep="~"))
	x <- work[,c(first_param, second_param)]
	cl <- kmeans(x, ind)
	#Создаем название графика по умолчанию (пустое)
	ylab <- ''
	#Создаем название для оси ординат по умолчанию (пустое)
	xlab <- ''
	#Создаем название графика по умолчанию (пустое)
	main <- ''
	#Создаем диалог, в котором спрашиваем пользователя хочет ли он добавить подписи к графику
	if (winDialog("yesno", "Хотите добавить подписи к графику?") == "YES"){
		#Если согласен, то появляется окно, в котором можно ввести различные подписи, также прописываем для них значение по умолчанию
		ylab <- winDialogString("Введите подпись для оси Y", default = "Y")
		xlab <- winDialogString("Введите подпись для оси X", default = "X")
		main <- winDialogString("Введите название графика", default = "")
		}
	if (winDialog("yesno", "Хотите сохранить модель для дальнейшего использования?") == "YES"){
		model_for_saving <- c(first_param, second_param, ind, xlab, ylab, main)
		save(model_for_saving, file = "./Scripts/clustering_models/cluster_analys.rda")}
	plot(x, col = cl$cluster, xlab=xlab, ylab=ylab, main=main)
}

cluster_analys_user <- function(work) {
	menu_items <- list.files(path ='./Scripts/clustering_models')
	if (length(menu_items) == 0) {
		winDialog("ok", "Готовые модели кластерного анализа отсутсвуют! Добавьте их в режиме эксперта.")
		return()
	}
	#Создаем бесконечный цикл для выбора элемента
	menu_form = menu(menu_items, graphics=T, title='Выбирите модель для анализа')
	load(paste('./Scripts/clustering_models/', menu_items[menu_form], sep=''))
	x <- work[,c(model_for_saving[1], model_for_saving[2])]
	cl <- kmeans(x, strtoi(model_for_saving[3]))
	plot(x, col = cl$cluster, xlab=model_for_saving[4], ylab=model_for_saving[5], main=model_for_saving[6])
}