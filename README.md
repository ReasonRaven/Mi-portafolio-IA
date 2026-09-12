# Portafolio de Jonathan Hernandez Lazcano

Portafolio web con las tareas y proyectos que he hecho en la carrera de Ingenieria
en Sistemas Computacionales en la Ibero Puebla. Va del 1er al 4to semestre: desde mi
primera pagina en HTML hasta una app con React y una API en Python que calcula rutas
optimas sobre el mapa real de Tlaxcala.

Es un sitio estatico: solo HTML, CSS y JavaScript. Sin frameworks, sin npm y sin
paso de compilacion.

## Como verlo

Clona el repositorio y abre `index.html` con doble clic. No hace falta servidor:

```bash
git clone git@github.com:ReasonRaven/Mi-portafolio-IA.git
cd Mi-portafolio-IA
open index.html        # en Windows: start index.html
```

Todo funciona con `file://`, por eso el catalogo de proyectos es un objeto de
JavaScript y no un JSON con `fetch`.

Unica excepcion: la demo de IA (`templates/IA.html`) usa la camara, y el navegador
suele pedir HTTPS o localhost para darle permiso. Para esa pagina conviene levantar
un servidor local:

```bash
python3 -m http.server 8000
# luego abre http://localhost:8000/templates/IA.html
```

## Estructura

```
index.html              Pagina de inicio (hero, sobre mi, destacados, contacto)
templates/              Una pagina por proyecto
  _plantilla-proyecto.html   Molde para paginas nuevas (no se publica)
  misProyectos.html          Catalogo completo con filtros
assets/
  css/styleGeneral.css  Hoja de estilos compartida por todo el sitio
  js/proyectos.js       Catalogo de proyectos (el archivo que se edita)
  js/portafolio.js      Renderiza las rejillas a partir del catalogo
  images/               Portadas y capturas
  videos/               Demos grabadas
tarea1..tarea6/         Material original de las tareas de 1er semestre
SistemasBasesDeDatos/   Scripts SQL, esquemas, triggers y procedures
SistemasInformacion/    Documentos del caso de ERP (RFP y presentacion)
```

## El catalogo de proyectos

Las rejillas de `index.html` y de `templates/misProyectos.html` **se generan solas**
al cargar la pagina, a partir del arreglo `proyectos` de
[`assets/js/proyectos.js`](assets/js/proyectos.js). Tambien salen de ahi los filtros
por tecnologia, la lista de lenguajes y los contadores del inicio.

No hay que escribir tarjetas a mano en el HTML: antes estaban duplicadas en las dos
paginas y terminaron diciendo cosas distintas.

En el mismo archivo vive el arreglo `extracurriculares` (talleres, grupos
estudiantiles), que se pinta en su propia seccion con `data-extras="lista"`.

### Agregar un proyecto

1. Copia `templates/_plantilla-proyecto.html` con un nombre nuevo y llena los huecos
   marcados con `[[...]]`; borra los bloques OPCIONAL que no apliquen.
2. Guarda la captura de portada en `assets/images/`.
3. Agrega una entrada al arreglo `proyectos` en `assets/js/proyectos.js`. Las rutas
   siempre se escriben desde la raiz del sitio (`assets/images/foto.png`,
   `templates/pagina.html`); el script agrega el `../` cuando hace falta.
4. Si usa una tecnologia con la que valga la pena filtrar, agregala a `filtros`; si
   es una materia nueva, agregala a `materias`.

## Materias

| Semestre | Materia |
|---|---|
| 4to | Estructura de Datos y Algoritmos Avanzados |
| 4to | Sistemas de Bases de Datos |
| 3er | Sistemas de Informacion |
| 2do | Estructura de Datos y Algoritmos |
| 1er | Introduccion a Sistemas |
| 1er | Programacion 1 |

## Proyectos destacados

- **Rutas Optimas en Redes Viales** — compara Dijkstra, A\* y k-shortest paths sobre
  el mapa real de Tlaxcala. React, FastAPI y NetworkX.
  [Codigo](https://github.com/ReasonRaven/ProyectoRutasOptimasRedesViales)
- **Bases de Datos con MySQL** — 33 scripts: diagramas ER, normalizacion, consultas,
  12 triggers y 15 stored procedures.
- **Implementacion de un ERP** — propuesta de SAP Business One para una empresa de
  scooters: RFP, roadmap y KPIs.
- **WichoTinder** — parodia de Tinder para el campus con grafos, pilas y POO en
  JavaScript. [Demo](https://reasonraven.github.io/WichoTinder/) ·
  [Codigo](https://github.com/ReasonRaven/WichoTinder)
- **IA con Teachable Machine** — clasificacion de imagenes en vivo con la camara,
  usando TensorFlow.js.

El catalogo completo esta en `templates/misProyectos.html`.

## Nota sobre los proyectos de otros repos

El portafolio **presenta** los proyectos, no los hospeda. Los que viven en su propio
repositorio (React, APIs, C++) aparecen aqui como caso de estudio: capturas, un
fragmento comentado del codigo, las tecnologias, que problema resuelven y el link a
GitHub. El codigo completo se queda en su repositorio.

## Contacto

- Correo institucional: 200417@iberopuebla.mx
- Correo personal: jonathan23_09@outlook.com
- GitHub: [@ReasonRaven](https://github.com/reasonraven)
