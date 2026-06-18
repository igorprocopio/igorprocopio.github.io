# deploy.R — Renderiza o site e sobe para o GitHub Pages
# Rode este script no console do RStudio: source("deploy.R")

# 1. Renderiza todos os arquivos .Rmd -> pasta docs/
rmarkdown::render_site()

# 2. Sobe para o GitHub
msg <- paste0("update: ", format(Sys.time(), "%Y-%m-%d %H:%M"))

system("git add docs/")
system(paste0('git commit -m "', msg, '"'))
system("git push")

message("Pronto! Site publicado em https://igorprocopio.github.io")
