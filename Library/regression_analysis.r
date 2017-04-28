#
simple_linear_regression = function(work){
	#�������� ������ ���������� � ������� ������� ������ ���������� ����������� ����
	target <- choosing_colums_function('�������� ������� ����������', work)
	#�������� ��������� ���������� � ������� ������� ������ ���������� ����������� ����
	dependent <- choosing_colums_function('����� 2-�� ����������', work)
	#������� �� ��������� ���������� �������, ��� �� ���������� �������� � ������� boxplot
	columns <- as.formula(paste(target, dependent, sep="~"))
	#
	fit <- lm(columns, data=work)
	#������� �������� ������� �� ��������� (������)
	ylab <- ''
	#������� �������� ��� ��� ������� �� ��������� (������)
	xlab <- ''
	#������� �������� ������� �� ��������� (������)
	main <- ''
	#������� ������, � ������� ���������� ������������ ����� �� �� �������� ������� � �������
	if (winDialog("yesno", "������ �������� ������� � �������?") == "YES"){
		#���� ��������, �� ���������� ����, � ������� ����� ������ ��������� �������, ����� ����������� ��� ��� �������� �� ���������
		ylab <- winDialogString("������� ������� ��� ��� Y", default = "Y")
		xlab <- winDialogString("������� ������� ��� ��� X", default = "X")
		main <- winDialogString("������� �������� �������", default = "")
		}
	with(work, {plot(work[[target]],work[[dependent]], main=main, xlab=xlab, ylab=ylab)
	abline(fit)})
	#
	sink("./Output/Results_of_simple_linear_regression.txt", append=T, split=T)
	#
	summary(fit)
	#
	if (winDialog("yesno", "������ ��������� ���������������� ��������?") == "YES"){
		confint(fit, level = 0.95)}
	# ��������������������
	if (winDialog("yesno", "������ �������� ������ �������������������� � ������� ����� Breusch-Pagan?") == "YES"){
		ncvTest(fit)}
	#
	sink(file=NULL)
	#
	if (winDialog("yesno", "������ ��������� ������ ���������� ������?") == "YES"){
		x11()
		qqPlot(fit, labels=row.names(work), id.method="identify", simulate=TRUE, main="Q-Q Plot")}
	if (winDialog("yesno", "������ �������� ������ ����������?") == "YES"){
		x11()
		crPlots(fit)}
	if (winDialog("yesno", "������ ��������� ������ ��� ����� Breusch-Pagan?") == "YES"){
		x11()
		spreadLevelPlot(fit)}
	}

#
multiple_linear_regression = function(work){
	#
	target <- choosing_colums_function('�������� ������� ����������', work)
	#
	number_of_variabels <- length(c(colnames(work))) - 1
	#
	vector_of_variabels <- vector()
	#
	vector_of_variabels[1] <- choosing_colums_function('����� ��������� ����������', work)
	#
	for (i in 2:number_of_variabels){
		if (winDialog("yesno", "������ �������� ��� ���� ��������� ����������?") == "YES"){
			#
			vector_of_variabels[i] <- choosing_colums_function('����� ��������� ����������', work)
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