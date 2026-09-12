/* ============================================================================
   MODO OSCURO
   ----------------------------------------------------------------------------
   Se carga en el <head> de TODAS las paginas y a proposito SIN defer: el tema
   tiene que quedar puesto antes del primer pintado, o al entrar en modo oscuro
   se alcanza a ver un parpadeo blanco.

   El tema vive en el atributo data-tema del <html> ("claro" u "oscuro"). La
   paleta oscura esta al final de styleGeneral.css, bajo [data-tema="oscuro"].

   El boton no se escribe en el HTML de cada pagina: este mismo archivo lo
   inserta en la barra de navegacion, asi solo hay un lugar que mantener.
   ========================================================================== */
(function () {
  "use strict";

  var CLAVE = "tema";
  var raiz = document.documentElement;

  /* Abrir el sitio como archivo (file://) hace que localStorage truene en
     algunos navegadores, asi que leer y escribir van protegidos. Sin
     localStorage el tema igual funciona, nada mas no se recuerda. */
  function leerGuardado() {
    try {
      return localStorage.getItem(CLAVE);
    } catch (e) {
      return null;
    }
  }

  function guardar(tema) {
    try {
      localStorage.setItem(CLAVE, tema);
    } catch (e) {
      /* sin permiso para guardar: el tema dura lo que dure la pagina */
    }
  }

  function aplicar(tema) {
    raiz.setAttribute("data-tema", tema);
  }

  /* Siempre arranca en claro, aunque el sistema este en oscuro: el portafolio
     se ve como esta diseñado y quien prefiera oscuro lo prende con el boton.
     La unica excepcion es que ya lo haya prendido antes en este navegador. */
  aplicar(leerGuardado() === "oscuro" ? "oscuro" : "claro");

  var SOL = '<svg class="icono-sol" viewBox="0 0 24 24" width="18" height="18" fill="none"' +
    ' stroke="currentColor" stroke-width="2" stroke-linecap="round" aria-hidden="true">' +
    '<circle cx="12" cy="12" r="4.2"/><path d="M12 2.2v2.1M12 19.7v2.1M4.6 4.6l1.5 1.5' +
    'M17.9 17.9l1.5 1.5M2.2 12h2.1M19.7 12h2.1M4.6 19.4l1.5-1.5M17.9 6.1l1.5-1.5"/></svg>';

  var LUNA = '<svg class="icono-luna" viewBox="0 0 24 24" width="18" height="18" fill="none"' +
    ' stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"' +
    ' aria-hidden="true"><path d="M20.8 13.1A8.6 8.6 0 1 1 10.9 3.2a6.8 6.8 0 0 0 9.9 9.9z"/></svg>';

  function ponerBoton() {
    var barra = document.querySelector(".navbar-custom");
    if (!barra || barra.querySelector(".tema-toggle")) return;

    var boton = document.createElement("button");
    boton.type = "button";
    boton.className = "tema-toggle";
    boton.innerHTML = SOL + LUNA;

    function describir() {
      var texto = raiz.getAttribute("data-tema") === "oscuro"
        ? "Cambiar a modo claro"
        : "Cambiar a modo oscuro";
      boton.setAttribute("aria-label", texto);
      boton.setAttribute("title", texto);
    }

    boton.addEventListener("click", function () {
      var nuevo = raiz.getAttribute("data-tema") === "oscuro" ? "claro" : "oscuro";
      aplicar(nuevo);
      guardar(nuevo);
      describir();
    });

    describir();

    /* Va junto a los demas enlaces; si la pagina no los tuviera, al final de
       la barra. */
    (barra.querySelector(".nav-links") || barra).appendChild(boton);
  }

  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", ponerBoton);
  } else {
    ponerBoton();
  }
})();
