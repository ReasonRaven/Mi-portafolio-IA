# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project overview

Static HTML/CSS portfolio for Jonathan Hernandez Lazcano, a first-semester university student. No build tools, no package manager, no framework. Open any `.html` file directly in a browser to preview it.

## Architecture

- `index.html` — main landing page (hero, about, projects grid, contact sections)
- `templates/` — one subpage per task (tarea 1–8), each linking back to `../index.html`
- `assets/css/styleGeneral.css` — single shared stylesheet used by every page (minified, one line)
- `assets/css/styleTarea*.css` — per-task overrides (not all tasks have one)
- `assets/images/` — all images referenced across pages
- `tarea5/ejemAhorcado.py` — Python hangman script (standalone, no web connection)

## CSS design system

All styles live in `styleGeneral.css` via CSS custom properties:

```
--bg, --surface, --surface-soft   (backgrounds)
--text, --muted                   (typography)
--primary: #166a70                (teal — buttons, accents)
--accent: #c7364f                 (red — task labels, danger)
--gold: #e0a72e                   (orange — AI progress bars)
--line, --shadow                  (borders and elevation)
```

Key layout classes: `.page` (1120px max-width container), `.project-grid` (4-col → 2-col → 1-col responsive), `.content-grid` (main + sidebar), `.section`, `.info-card`, `.media-card`.

## Subpage conventions

Every subpage in `templates/` follows this pattern:
- Links stylesheet as `../assets/css/styleGeneral.css`
- Nav bar with `.brand` linking to `../index.html`
- A `.subpage-hero` section with `.back-link`, `.eyebrow` (task label), `h1`, and `.lead`
- Content inside `.page` wrapper

When adding a new task page, copy the structure from an existing template like `templates/stackOverflow.html`.

## Tarea 8 (IA)

`templates/IA.html` loads TensorFlow.js and Teachable Machine from CDN at runtime. The model URL is hardcoded to `https://teachablemachine.withgoogle.com/models/YABicmzt3/`. Webcam access requires HTTPS or localhost; opening the file directly as `file://` may block camera permissions depending on the browser.

## Language

Content and commit messages are in Spanish.
