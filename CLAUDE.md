# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project overview

Static HTML/CSS portfolio for Jonathan Hernandez Lazcano, a Systems Engineering student at Ibero Puebla. It spans several semesters and subjects (1st through 4th), so project pages are grouped by `materia`, newest semester first. No build tools, no package manager, no framework. Open any `.html` file directly in a browser to preview it — everything must keep working over `file://`, so no ES modules and no `fetch()` for site data.

## Architecture

- `index.html` — landing page (hero, about, featured projects grid, contact)
- `templates/` — one page per project, each linking back to `../index.html`
- `templates/_plantilla-proyecto.html` — the mold for new project pages (not published; leading `_`)
- `assets/js/proyectos.js` — **the project catalog**. Plain `window.PORTAFOLIO` object, no JSON/fetch
- `assets/js/portafolio.js` — renderer that reads the catalog and paints the grids
- `assets/css/styleGeneral.css` — single shared stylesheet for every page (minified; new rules appended readable at the end)
- `assets/images/` — all images referenced across pages
- `tarea1..tarea6/` — original source material (screenshots, videos, the Python script)
- Projects from other repos (React, APIs) are case studies only: excerpts + screenshots here, code stays in its own GitHub repo

## The project catalog (important)

The project grids in `index.html` and `templates/misProyectos.html` are **generated at runtime** from `assets/js/proyectos.js`. Do not hardcode project cards into either page — they were duplicated by hand before and drifted.

Hooks the renderer looks for:

| Attribute | Does |
|---|---|
| `data-proyectos="destacados"` | grid of projects with `destacado: true` |
| `data-proyectos="por-materia"` | one `.section` per materia, each with its grid |
| `data-base` | `""` at repo root, `"../"` inside `templates/` |
| `data-tags="si"` | adds technology chips to each card |
| `data-filtros="tecnologias"` | filter chips built from the catalog's `filtros` array |
| `data-contador="proyectos\|lenguajes\|materias"` | writes the count (keep a static fallback inside the tag) |
| `data-lista="lenguajes"` | fills a `<ul>` from the catalog |
| `data-enlaces="<id>"` | prepends "Ver demo" / "Codigo en GitHub" buttons from that project's `demo`/`repo` fields, keeping any hand-written buttons already inside |

## Adding a project

1. Copy `templates/_plantilla-proyecto.html` to `templates/<nombre>.html`, fill the `[[...]]` placeholders, delete the OPCIONAL blocks that don't apply.
2. Put the cover screenshot in `assets/images/`.
3. Add an entry to the `proyectos` array in `assets/js/proyectos.js`. Paths are always written **from the site root** (`assets/images/x.png`, `templates/y.html`); the renderer prepends `../` when needed.
4. If it uses a technology worth filtering by, add it to `filtros`; if it's a new subject, add it to `materias`.

## Showcasing non-web projects (React, APIs, C++, Python)

The portfolio **presents** projects, it does not host them. Each project page is a case study, not the running app. Three levels of evidence:

1. **Ficha** (always): screenshot + what problem it solves + a 30–60 line commented code excerpt in `<pre class="code-block">` + technologies + GitHub link + what he learned.
2. **Recorded demo**: add a video/GIF in a `.media-card`, for anything that can't run in a browser (C++ and Python console programs).
3. **Live demo**: for deployed projects, an `<iframe>` inside `.demo-frame` plus an "open in new tab" button.

Conventions that follow from that:

- **React projects** are never rebuilt inside the portfolio. They get deployed (Vercel/Netlify/Pages) and embedded via `.demo-frame`, with the key component shown as a code excerpt.
- **API projects (GET/POST)** get the endpoints table + request/response JSON examples from the plantilla's OPCIONAL API block. A live `fetch()` playground can be added per-project when the API is up and sends CORS headers — it must degrade to a canned example response when the request fails.
- Source code is **not** vendored into this repo. Excerpts live in the page, the full code stays on GitHub via the `repo` field.
- Inside `<pre class="code-block">`, escape `<` as `&lt;` and `&` as `&amp;`.

## CSS design system

All styles live in `styleGeneral.css` via CSS custom properties:

```
--bg, --surface, --surface-soft   (backgrounds)
--text, --muted                   (typography)
--primary: #0d9488                (teal — buttons, accents)
--accent: #f43f5e                 (red — task labels, danger)
--gold: #f59e0b                   (orange — AI progress bars)
--line, --shadow                  (borders and elevation)
```

Key layout classes: `.page` (1120px max-width container), `.project-grid` (4-col → 2-col → 1-col responsive), `.content-grid` (main + sidebar), `.section`, `.info-card`, `.media-card`, `.code-block` + `.lang-badge`, `.demo-frame`, `.chip` / `.filtros`, `.card-tags`.

## Subpage conventions

Every page in `templates/` follows this pattern:
- Links stylesheet as `../assets/css/styleGeneral.css`
- Nav bar with `.brand` linking to `../index.html`
- A `.subpage-hero` section with `.back-link`, `.eyebrow` (task label), `h1`, and `.lead`
- Content inside `.page` wrapper
- Both catalog scripts before `</body>` (needed for `data-enlaces` and any other hook)

## Tarea 8 (IA)

`templates/IA.html` loads TensorFlow.js and Teachable Machine from CDN at runtime. The model URL is hardcoded to `https://teachablemachine.withgoogle.com/models/YABicmzt3/`. Webcam access requires HTTPS or localhost; opening the file directly as `file://` may block camera permissions depending on the browser.

## Language

Site content, code comments and commit messages are in Spanish (no accents in most existing copy — match the surrounding text).
