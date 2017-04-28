#
simple_linear_regression = function(work){
	#Выбираем первую переменную с помощью функции выбора переменной объявленной выше
	target <- choosing_colums_function('Выбираем целевую переменную', work)
	#Выбираем зависимую переменную с помощью функции выбора переменной объявленной выше
	dependent <- choosing_colums_function('Выбор 2-ой переменной', work)
	#Создаем из выбранных переменных формулу, для ее дальнейшей передачи в функцию boxplot
	columns <- as.formula(paste(target, dependent, sep="~"))
	#
	fit <- lm(columns, data=work)
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
	with(work, {plot(work[[target]],work[[dependent]], main=main, xlab=xlab, ylab=ylab)
	abline(fit)})
	#
	sink("./Output/Results_of_simple_linear_regression.txt", append=T, split=T)
	#
	summary(fit)
	#
	if (winDialog("yesno", "Хотите построить конфиденциальный интервал?") == "YES"){
		confint(fit, level = 0.95)}
	# Гетероскедастичность
	if (winDialog("yesno", "Хотите провести анализ Гетероскедастичность с помощью теста Breusch-Pagan?") == "YES"){
		ncvTest(fit)}
	#
	sink(file=NULL)
	#
	if (winDialog("yesno", "Хотите построить график нормальной кривой?") == "YES"){
		x11()
		qqPlot(fit, labels=row.names(work), id.method="identify", simulate=TRUE, main="Q-Q Plot")}
	if (winDialog("yesno", "Хотите провести анализ линейности?") == "YES"){
		x11()
		crPlots(fit)}
	if (winDialog("yesno", "Хотите построить график для теста Breusch-Pagan?") == "YES"){
		x11()
		spreadLevelPlot(fit)}
	}

#
multiple_linear_regression = function(work){
	#
	target <- choosing_colums_function('Выбираем целевую переменную', work)
	#
	number_of_variabels <- length(c(colnames(work))) - 1
	#
	vector_of_variabels <- vector()
	#
	vector_of_variabels[1] <- choosing_colums_function('Выбор зависимой переменной', work)
	#
	for (i in 2:number_of_variabels){
		if (winDialog("yesno", "Хотите добавить еще одну зависимую переменную?") == "YES"){
			#
			vector_of_variabels[i] <- choosing_colums_function('Выбор зависимой переменной', work)
		} else {break}
	}
	#
	dependent <- paste(vector_of_variabels, collapse="+")
	#
	columns_for_model <- as.formula(paste(target, dependent, sep="~"))
	#
	states <- as.data.frame(work[,c(target, vector_of_variabels)])
	#
	scatterplotMatrix(states, spread=FALSE, main="Scatter Plot Matrix")
	#
	fit <- lm(columns_for_model, data=states)
	sink("./Output/Results_of_multiple_linear_regression.txt", append=T, split=T)
	#
	summary(fit)
	sink(file=NULL)
	}