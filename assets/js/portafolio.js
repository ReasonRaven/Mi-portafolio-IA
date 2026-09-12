/* ============================================================================
   RENDERIZADOR DEL PORTAFOLIO
   ----------------------------------------------------------------------------
   Lee assets/js/proyectos.js y pinta las tarjetas. No hay que tocar este
   archivo para agregar proyectos, solo el catalogo.

   Como se usa en el HTML:

     <div class="project-grid" data-proyectos="destacados" data-base=""></div>
         -> rejilla con los proyectos marcados como destacado (pagina de inicio)

     <div data-proyectos="por-materia" data-base="../" data-tags="si"></div>
         -> una seccion por materia, cada una con su rejilla (catalogo completo)
            data-tags="si" agrega las etiquetas de tecnologia en cada tarjeta

     <div class="filtros" data-filtros="tecnologias"></div>
         -> botones para filtrar las rejillas de ESA pagina por tecnologia

     <strong data-contador="proyectos"></strong>
         -> numero de proyectos (tambien "lenguajes" y "materias")

     <ul class="skill-list" data-lista="lenguajes"></ul>
         -> lista de lenguajes del catalogo

     <ul class="extras" data-extras="lista"></ul>
         -> lista de actividades extracurriculares

     <ul class="extras" data-certificaciones="lista"></ul>
         -> lista de certificaciones

     <div class="enlaces" data-enlaces="backend-flask"></div>
         -> botones "Ver demo" y "Codigo en GitHub" de ese proyecto, tomando
            los campos demo/repo del catalogo. Si el proyecto no tiene esos
            campos, respeta los botones que ya estuvieran escritos adentro.

   data-base es el prefijo para llegar a la raiz del sitio:
     ""     si el HTML esta en la raiz (index.html)
     "../"  si el HTML esta dentro de templates/
   ========================================================================== */

(function () {
  "use strict";

  var datos = window.PORTAFOLIO;
  if (!datos) {
    console.error("No se encontro assets/js/proyectos.js");
    return;
  }

  /* Tecnologia seleccionada en los filtros. "" significa "Todos". */
  var filtroActivo = "";

  function esc(texto) {
    return String(texto == null ? "" : texto)
      .replace(/&/g, "&amp;")
      .replace(/</g, "&lt;")
      .replace(/>/g, "&gt;")
      .replace(/"/g, "&quot;");
  }

  function cada(lista, fn) {
    Array.prototype.forEach.call(lista, fn);
  }

  /* --- Tarjetas ---------------------------------------------------------- */

  /* Cuantas etiquetas se ven en la tarjeta. El resto se resume en un "+N";
     las demas siguen contando para los filtros. */
  var MAX_ETIQUETAS = 4;

  function etiquetasTecnologia(p) {
    var tecnologias = p.tecnologias || [];
    if (!tecnologias.length) { return ""; }

    var html = tecnologias.slice(0, MAX_ETIQUETAS).map(function (t) {
      return '<span class="card-tag">' + esc(t) + '</span>';
    }).join("");

    var ocultas = tecnologias.length - MAX_ETIQUETAS;
    if (ocultas > 0) {
      html += '<span class="card-tag mas">+' + ocultas + '</span>';
    }
    return '<div class="card-tags">' + html + '</div>';
  }

  function tarjeta(p, base, conTags) {
    return '<a class="project-card" href="' + esc(base + p.pagina) + '">' +
      '<img src="' + esc(base + p.imagen) + '" alt="' + esc(p.titulo) + '" loading="lazy">' +
      '<div class="project-card-content">' +
      (p.etiqueta ? '<small>' + esc(p.etiqueta) + '</small>' : '') +
      '<h3>' + esc(p.titulo) + '</h3>' +
      '<p>' + esc(p.resumen) + '</p>' +
      (conTags ? etiquetasTecnologia(p) : '') +
      '</div></a>';
  }

  function rejilla(lista, base, conTags) {
    return lista.map(function (p) { return tarjeta(p, base, conTags); }).join("");
  }

  function vacio() {
    return '<p class="sin-resultados">No tengo proyectos con esa tecnologia todavia.</p>';
  }

  /* --- Filtrado ---------------------------------------------------------- */

  function pasaFiltro(p) {
    if (!filtroActivo) { return true; }
    return (p.tecnologias || []).indexOf(filtroActivo) !== -1;
  }

  function seccionMateria(materia, base, conTags) {
    var lista = datos.proyectos.filter(function (p) {
      return p.materia === materia.id && pasaFiltro(p);
    });
    if (!lista.length) { return ""; }

    return '<section class="section">' +
      '<div class="section-heading"><div>' +
      '<p class="eyebrow">' + esc(materia.semestre) + '</p>' +
      '<h2>' + esc(materia.nombre) + '</h2>' +
      '</div><p>' + esc(materia.descripcion) + '</p></div>' +
      '<div class="project-grid">' + rejilla(lista, base, conTags) + '</div>' +
      '</section>';
  }

  function pintar(caja) {
    var base = caja.getAttribute("data-base") || "";
    var modo = caja.getAttribute("data-proyectos");
    var conTags = caja.getAttribute("data-tags") === "si";

    if (modo === "por-materia") {
      var secciones = datos.materias.map(function (m) {
        return seccionMateria(m, base, conTags);
      }).join("");
      caja.innerHTML = secciones || vacio();
      return;
    }

    var lista = datos.proyectos;
    if (modo === "destacados") {
      lista = lista.filter(function (p) { return p.destacado; });
    }
    lista = lista.filter(pasaFiltro);
    caja.innerHTML = lista.length ? rejilla(lista, base, conTags) : vacio();
  }

  function pintarProyectos() {
    cada(document.querySelectorAll("[data-proyectos]"), pintar);
  }

  /* --- Botones de filtro ------------------------------------------------- */

  function boton(texto, valor) {
    var activa = (filtroActivo === valor);
    return '<button type="button" class="chip' + (activa ? " activa" : "") +
      '" data-valor="' + esc(valor) + '" aria-pressed="' + activa + '">' +
      esc(texto) + '</button>';
  }

  function pintarFiltros(caja) {
    var opciones = datos.filtros || [];
    caja.innerHTML = boton("Todos", "") + opciones.map(function (f) {
      return boton(f, f);
    }).join("");
  }

  function conectarFiltros(caja) {
    caja.addEventListener("click", function (evento) {
      var btn = evento.target.closest ? evento.target.closest(".chip") : null;
      if (!btn) { return; }
      filtroActivo = btn.getAttribute("data-valor") || "";
      cada(document.querySelectorAll("[data-filtros]"), pintarFiltros);
      pintarProyectos();
    });
  }

  /* --- Numeros, listas y enlaces ----------------------------------------- */

  function contar(nodo) {
    var que = nodo.getAttribute("data-contador");
    if (datos[que] && typeof datos[que].length === "number") {
      nodo.textContent = datos[que].length;
    }
  }

  function pintarLista(nodo) {
    var arreglo = datos[nodo.getAttribute("data-lista")];
    if (!arreglo || !arreglo.length) { return; }
    nodo.innerHTML = arreglo.map(function (x) {
      return '<li>' + esc(x) + '</li>';
    }).join("");
  }

  function pintarEnlaces(caja) {
    var id = caja.getAttribute("data-enlaces");
    var proyecto = null;
    datos.proyectos.forEach(function (p) { if (p.id === id) { proyecto = p; } });
    if (!proyecto) {
      console.warn('data-enlaces="' + id + '" no existe en el catalogo');
      return;
    }
    var html = "";
    if (proyecto.demo) {
      html += '<a class="button" href="' + esc(proyecto.demo) +
        '" target="_blank" rel="noopener">Ver demo en vivo</a>';
    }
    if (proyecto.repo) {
      html += '<a class="button secondary" href="' + esc(proyecto.repo) +
        '" target="_blank" rel="noopener">Codigo en GitHub</a>';
    }
    /* Se agregan ANTES de los botones que la pagina ya tenga escritos a mano,
       para no borrarlos. */
    if (html) { caja.insertAdjacentHTML("afterbegin", html); }
  }

  /* --- Actividades extracurriculares ------------------------------------ */

  function actividad(e, base) {
    var nombre = e.pagina
      ? '<a href="' + esc(base + e.pagina) + '">' + esc(e.titulo) + '</a>'
      : esc(e.titulo);
    return '<li class="extra">' +
      '<div class="extra-meta">' +
      '<span class="extra-periodo">' + esc(e.periodo) + '</span>' +
      (e.semestre ? '<span class="extra-semestre">' + esc(e.semestre) + '</span>' : '') +
      (e.tipo ? '<span class="card-tag">' + esc(e.tipo) + '</span>' : '') +
      '</div>' +
      '<div class="extra-cuerpo">' +
      '<h3>' + nombre +
      (e.enCurso ? ' <span class="extra-activo">En curso</span>' : '') + '</h3>' +
      '<p>' + esc(e.descripcion) + '</p>' +
      (e.constancia
        ? '<p class="extra-nota">' + esc(e.constancia) +
          (e.constanciaUrl
            ? ' <a href="' + esc(base + e.constanciaUrl) +
              '" target="_blank" rel="noopener">Ver constancia</a>'
            : '') + '</p>'
        : '') +
      '</div></li>';
  }

  function pintarActividades(caja) {
    var base = caja.getAttribute("data-base") || "";
    var lista = datos.extracurriculares || [];
    caja.innerHTML = lista.map(function (e) { return actividad(e, base); }).join("");
  }

  /* --- Certificaciones --------------------------------------------------- */

  /* Reusa las clases .extra* de las actividades: son la misma forma, una
     columna con la fecha a la izquierda y el cuerpo a la derecha. */
  function certificacion(c) {
    return '<li class="extra">' +
      '<div class="extra-meta">' +
      '<span class="extra-periodo">' + esc(c.anio) + '</span>' +
      '<span class="extra-semestre">' + esc(c.emisor) + '</span>' +
      (c.tipo ? '<span class="card-tag">' + esc(c.tipo) + '</span>' : '') +
      '</div>' +
      '<div class="extra-cuerpo">' +
      '<h3>' + esc(c.titulo) + '</h3>' +
      '<p>' + esc(c.descripcion) + '</p>' +
      '</div></li>';
  }

  function pintarCertificaciones(caja) {
    var lista = datos.certificaciones || [];
    caja.innerHTML = lista.map(certificacion).join("");
  }

  /* --- Arranque ---------------------------------------------------------- */

  function iniciar() {
    cada(document.querySelectorAll("[data-filtros]"), function (caja) {
      pintarFiltros(caja);
      conectarFiltros(caja);
    });
    pintarProyectos();
    cada(document.querySelectorAll("[data-contador]"), contar);
    cada(document.querySelectorAll("[data-lista]"), pintarLista);
    cada(document.querySelectorAll("[data-enlaces]"), pintarEnlaces);
    cada(document.querySelectorAll("[data-extras]"), pintarActividades);
    cada(document.querySelectorAll("[data-certificaciones]"), pintarCertificaciones);
  }

  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", iniciar);
  } else {
    iniciar();
  }
})();
