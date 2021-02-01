# Excel Files
# install.packages('readxl')
# install.packages('openxlsx')
# install.packages('xlsx')
library(openxlsx)
library(xlsx)

print(
  excel_sheets('Sample-Sales-Data.xlsx')
)

df <- read.xlsx('Sample-Sales-Data.xlsx', sheetName = 'Sheet1')

print(
  head(df)
)

print(
  sum(df$Value)
)

#entire.workbook <- lapply(excel_sheets("Sample-Sales-Data.xlsx"), 
#                          read_excel, 
#                          path = "Sample-Sales-Data.xlsx")

write.xlsx(mtcars, "output_example.xlsx")
