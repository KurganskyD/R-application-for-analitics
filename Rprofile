# ��������� ����� � ������ ������� ����������
# options(papersize="a4")
# options(editor="notepad")
# options(pager="internal")

# set the default help type
# options(help_type="text")
  options(help_type="html")

# set a site library
# .Library.site <- file.path(chartr("\\", "/", R.home()), "site-library")

# set a CRAN mirror
 local({r <- getOption("repos")
       r["CRAN"] <- "https://cran.gis-lab.info/"
       options(repos=r)})

.First <- function(){
print("������ ���� !!!")
w1 <- "������� �����: "
w1[2] <- getwd()
w2 <- "���������: "
w2[2] <- getOption("encoding")
w3 <- "��������� �����:"
w3[2] <- as.character(Sys.time())
grit <- list(w1, w2, w3)
p <- function(x) print(paste(x, collapse = ""))
w <- lapply(grit, p)
case <- menu(c("�� ��������", "������", "���������"), graphics = T, title = "���������� ��������")
switch(case-1, print(dir(getwd(), all.files = T)), print (dir(getwd(), all.files = T, full.names = T, recursive = T, ignore.case = FALSE,
                                  include.dirs = T, no.. = FALSE)))
}

.Last <- function(){
print("���������� !!!")
w1 <- "��������� �����:"
w2 <- as.character(Sys.time())
cat(w1, w2, sep = "")
}