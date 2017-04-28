type_of_user_cluster <- function(work) {
	menu_items <- c('������� ������������','�������')
	menu_form = menu(menu_items, graphics=T, title='�������� ��� ��� ������������')
	if (menu_form == 1) {cluster_analys_user(work)}
	else {cluster_analys_expert(work)}
}

##���������� ������
cluster_analys_expert <- function(work) {
	menu_items <- c('1','2','3', '4', '5', '6', '7')
	menu_form = menu(menu_items, graphics=T, title='�������� ���-�� ���������')
	ind = menu_form
	first_param <- choosing_colums_function('�������� 1-�� ����������', work)
	#�������� ��������� ���������� � ������� ������� ������ ���������� ����������� ����
	second_param <- choosing_colums_function('�������� 2-�� ����������', work)
	#������� �� ��������� ���������� �������, ��� �� ���������� �������� � ������� boxplot
	columns <- as.formula(paste(first_param, second_param, sep="~"))
	x <- work[,c(first_param, second_param)]
	cl <- kmeans(x, ind)
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
	if (winDialog("yesno", "������ ��������� ������ ��� ����������� �������������?") == "YES"){
		model_for_saving <- c(first_param, second_param, ind, xlab, ylab, main)
		save(model_for_saving, file = "./Scripts/clustering_models/cluster_analys.rda")}
	plot(x, col = cl$cluster, xlab=xlab, ylab=ylab, main=main)
}

cluster_analys_user <- function(work) {
	menu_items <- list.files(path ='./Scripts/clustering_models')
	if (length(menu_items) == 0) {
		winDialog("ok", "������� ������ ����������� ������� ����������! �������� �� � ������ ��������.")
		return()
	}
	#������� ����������� ���� ��� ������ ��������
	menu_form = menu(menu_items, graphics=T, title='�������� ������ ��� �������')
	load(paste('./Scripts/clustering_models/', menu_items[menu_form], sep=''))
	x <- work[,c(model_for_saving[1], model_for_saving[2])]
	cl <- kmeans(x, strtoi(model_for_saving[3]))
	plot(x, col = cl$cluster, xlab=model_for_saving[4], ylab=model_for_saving[5], main=model_for_saving[6])
}