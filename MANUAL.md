# Manual do site — Igor Vieira Procópio

Site em HTML puro. Não tem build, não precisa de R/RStudio/Pandoc:
o que está no arquivo `.html` é exatamente o que aparece no ar.

## Estrutura de arquivos

```
igorprocopio/
├── custom.css                    # Todo o estilo visual — EDITE AQUI para mudar cores/layout
├── index.html                    # Página Inicial
├── publicacoes.html              # Artigos publicados
├── textos-para-discussao.html    # Working papers
├── projetos.html                 # Projetos (placeholder por enquanto)
└── assets/
    └── img/                       # Fotos, logo, etc.
```

As quatro páginas repetem o mesmo bloco de navbar + sidebar no topo do
`<body>` — não existe um "template" automático como no rmarkdown, então
uma mudança na navbar ou na sidebar (novo link, novo item de menu) precisa
ser copiada nas 4 páginas manualmente. Como é sempre eu quem mexe nisso,
não é um problema na prática — só documentando para não estranhar depois.

Não tem página de CV por enquanto (foi removida do menu a pedido).

---

## Tarefas comuns

### Ver o site localmente
Abra qualquer `.html` direto no navegador (duplo clique) — sem servidor,
sem comando nenhum.

### Publicar
```bash
git add .
git commit -m "update: descrição da mudança"
git push origin main
```
(Antes disso, se ainda não existe repositório git aqui, é preciso rodar
`git init` e apontar o remote para `igorprocopio.github.io` — isso é feito
uma vez só.)

---

### Adicionar um artigo publicado
Abra `publicacoes.html` e copie o bloco abaixo dentro de `<div class="pub-list">`:

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

### Adicionar um working paper (Texto para Discussão)
Mesmo processo em `textos-para-discussao.html`, usando `badge-wp` no badge:
```html
<span class="badge badge-wp">Em revisão</span>
```
Outros status possíveis: `Em revisão`, `Submetido`, `Aceito`.

### Adicionar uma atualização recente (Inicial)
Em `index.html`, dentro de `<div class="updates">`:
```html
<div class="update">
  Novo working paper: <a href="#">Título</a>, jan. 2026.
</div>
```

---

### Adicionar uma página nova ao menu principal
1. Copie um dos `.html` existentes como ponto de partida (mantém navbar/sidebar/rodapé).
2. Troque o `<title>` e o conteúdo dentro de `<main class="content">`.
3. Em **todas as páginas** (inclusive a nova), adicione dentro de `<div class="navbar-links">`:
   ```html
   <a href="nova-pagina.html">Nome</a>
   ```

---

### Adicionar foto de perfil
1. Salve a foto em `assets/img/foto.jpg`
2. Em cada página, substitua:
   ```html
   <span class="sidebar-initials">IP</span>
   ```
   por:
   ```html
   <img src="assets/img/foto.jpg" alt="Igor Vieira Procópio">
   ```

### Adicionar links de contato na sidebar
Em cada página, descomente as linhas da `sidebar-links`:
```html
<a href="mailto:seuemail@ufjf.br">✉ seuemail@ufjf.br</a>
<a href="https://scholar.google.com/..." target="_blank">Google Scholar</a>
```

### Preencher a página de Projetos
Em `projetos.html`, substitua o parágrafo "Em breve." pelos itens de projeto
— tem um modelo comentado logo acima, no mesmo estilo dos itens de publicação.

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

## O que ficou de fora por enquanto

As páginas do menu "Recursos" (Literatura, Clima, Econometria, Espacial,
Livros R, Shiny, Modelagem) da versão anterior em R não foram trazidas —
estavam em construção. O conteúdo original continua salvo em
`../_antigos/igorprocopio-R/` (projeto R completo, com git) caso quiser
recuperar algo de lá depois.
