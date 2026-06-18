# Manual do site — Igor Vieira Procópio

## Estrutura de arquivos

```
igorprocopio/
├── _site.yml          # Configuração do site (output, CSS, includes)
├── _in_header.html    # Fontes Google (carregado no <head>)
├── _before_body.html  # Navbar + sidebar — EDITE AQUI para mudar menu ou dados pessoais
├── _after_body.html   # Rodapé + JavaScript
├── custom.css         # Todo o estilo visual — EDITE AQUI para mudar cores/layout
│
├── index.Rmd          # Página Home
├── research.Rmd       # Artigos publicados
├── working-papers.Rmd # Working papers
├── cv.Rmd             # Curriculum Vitae
│
├── literatura.Rmd     # Recursos: literatura
├── climate.Rmd        # Recursos: clima
├── sites_econometria.Rmd
├── espacial.Rmd
├── livrosR.Rmd
├── shiny.Rmd
├── modelagem.Rmd
│
├── deploy.R           # Script para renderizar e publicar
└── docs/              # Site gerado (não edite manualmente)
```

---

## Tarefas comuns

### Publicar o site
No console do RStudio:
```r
source("deploy.R")
```

### Só renderizar (sem publicar)
```r
rmarkdown::render_site()
```
O resultado fica em `docs/index.html` — abra no navegador para visualizar.

---

### Adicionar um artigo publicado
Abra `research.Rmd` e copie o bloco abaixo dentro de `<div class="pub-list">`:

```html
<div class="pub-item">
  <span class="pub-n">2.</span>
  <div>
    <p class="pub-title">
      <a href="https://doi.org/..." target="_blank">Título do artigo</a>
    </p>
    <p class="pub-meta">
      Procópio, I. V.; Coautor A<br>
      <em>Nome da Revista</em>, 2025
    </p>
    <div class="pub-badges">
      <span class="badge badge-pub">Publicado</span>
      <a href="link-do-pdf" class="pub-link" target="_blank">PDF</a>
      <a href="https://doi.org/..." class="pub-link" target="_blank">DOI</a>
    </div>
  </div>
</div>
```

### Adicionar um working paper
Mesmo processo em `working-papers.Rmd`, usando `badge-wp` no badge:
```html
<span class="badge badge-wp">Em revisão</span>
```
Outros status possíveis: `Em revisão`, `Submetido`, `Aceito`.

### Adicionar uma atualização recente (Home)
Em `index.Rmd`, dentro de `<div class="updates">`:
```html
<div class="update">
  Novo working paper: <a href="#">Título</a>, jan. 2026.
</div>
```

---

### Adicionar uma página nova ao menu principal
1. Crie o arquivo `nova-pagina.Rmd`
2. Em `_before_body.html`, adicione dentro de `<div class="navbar-links">`:
   ```html
   <a href="nova-pagina.html">Nome</a>
   ```

### Adicionar um link ao submenu Recursos
Em `_before_body.html`, dentro de `<div class="nav-dropdown-menu">`:
```html
<a href="nova-pagina.html">Nome</a>
```

---

### Adicionar foto de perfil
1. Salve a foto em `assets/img/foto.jpg`
2. Em `_before_body.html`, substitua:
   ```html
   <span class="sidebar-initials">IP</span>
   ```
   por:
   ```html
   <img src="assets/img/foto.jpg" alt="Igor Vieira Procópio">
   ```

### Adicionar links de contato na sidebar
Em `_before_body.html`, descomente as linhas da sidebar-links:
```html
<a href="mailto:seuemail@ufjf.br">✉ seuemail@ufjf.br</a>
<a href="https://scholar.google.com/..." target="_blank">Google Scholar</a>
```

### Adicionar CV em PDF
1. Salve o PDF em `assets/cv.pdf`
2. Em `cv.Rmd`, substitua "Em breve." por:
   ```markdown
   [⬇ Download CV (PDF)](assets/cv.pdf){target="_blank"}
   ```

---

### Mudar as cores do site
Abra `custom.css` e edite as variáveis no topo:
```css
:root {
  --blue:        #1a4d7a;  /* cor principal: navbar, links */
  --blue-dark:   #0C2F50;  /* títulos */
  --blue-light:  #E6F1FB;  /* fundos suaves */
  --blue-mid:    #378ADD;  /* bordas de destaque */
  --blue-border: #85B7EB;  /* bordas de tags */
}
```

---

## Configuração inicial do git (feita uma vez)

No terminal do RStudio (aba Terminal):
```bash
git init
git remote add origin https://github.com/igorprocopio/igorprocopio.github.io.git
git add .
git commit -m "init"
git push -u origin main
```

Depois, no GitHub: **Settings → Pages → Branch: main → Folder: /docs → Save**

A partir daí, `source("deploy.R")` cuida de tudo.
