files <- c("./talks/data_analyses.Rmd",
           "./talks/data_analyses_practice.Rmd",
           "./talks/data_analyses_supp.Rmd")

# purrr::walk(files, rmarkdown::render, output_format = "html_document")

for (f in files) rmarkdown::render(f)

files_html <- str_replace_all(files, ".Rmd", ".html")

purrr::walk(c(files,files_html), fs::file_copy,
            new_path = "docs/talks/", overwrite = TRUE)
