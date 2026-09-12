/* ============================================================================
   CATALOGO DE PROYECTOS
   ----------------------------------------------------------------------------
   Este es el UNICO archivo que hay que editar para agregar un proyecto nuevo.
   Las rejillas de index.html y de templates/misProyectos.html se generan solas
   a partir de aqui, y los numeros del inicio se cuentan solos.

   PARA AGREGAR UN PROYECTO:
     1. Copia templates/_plantilla-proyecto.html con un nombre nuevo
        (ej. templates/calculadoraReact.html) y llena los huecos.
     2. Guarda la captura de portada en assets/images/
     3. Agrega una entrada al arreglo "proyectos" de abajo.

   OJO CON LAS RUTAS: siempre se escriben desde la raiz del sitio
   (assets/images/foto.png, templates/pagina.html). El script agrega el "../"
   cuando hace falta.
   ========================================================================== */

window.PORTAFOLIO = {

  /* Se cuentan en el bloque de numeros del inicio y se pintan en la lista de
     "Lo que estoy desarrollando". Agrega uno cuando aprendas algo nuevo. */
  lenguajes: ["HTML", "CSS", "JavaScript", "Python", "C++", "MySQL"],

  /* Botones de filtro del catalogo completo. Un proyecto aparece bajo el filtro
     si el texto esta EXACTAMENTE igual dentro de su lista "tecnologias".
     Deja pocos y utiles: son para navegar, no para presumir. */
  filtros: ["React", "JavaScript", "Python", "C++", "APIs", "Grafos", "ERP", "HTML", "CSS", "IA"],

  /* El catalogo completo se agrupa con estas materias. El "id" es el que se
     usa abajo en cada proyecto. Para una materia nueva, agrega otro objeto. */
  materias: [
    {
      id: "estructura-datos-avanzados",
      nombre: "Estructura de Datos y Algoritmos Avanzados",
      semestre: "4to semestre",
      descripcion: "Algoritmos de grafos aplicados a un problema real: calcular rutas optimas sobre el mapa de Tlaxcala con Dijkstra, A* y k-shortest paths."
    },
    {
      id: "sistemas-informacion",
      nombre: "Sistemas de Informacion",
      semestre: "3er semestre",
      descripcion: "Analisis de sistemas empresariales: como se elige, se cotiza y se implementa un ERP en una empresa real, y como se mide despues si funciono."
    },
    {
      id: "estructura-datos",
      nombre: "Estructura de Datos y Algoritmos",
      semestre: "2do semestre",
      descripcion: "El curso base de estructuras de datos: grafos, pilas y programacion orientada a objetos, aplicados en una app web completa. La version avanzada viene en 4to semestre."
    },
    {
      id: "intro-sistemas",
      nombre: "Introduccion a Sistemas",
      semestre: "1er semestre",
      descripcion: "Tareas y practicas de la materia: desde mi primera pagina web hasta una demo con inteligencia artificial y un backend en Flask."
    },
    {
      id: "programacion-1",
      nombre: "Programacion 1",
      semestre: "1er semestre",
      descripcion: "Ejercicios y proyectos en C++: logica, funciones, programacion orientada a objetos y recursividad."
    }
  ],

  /* Cada proyecto:
       id           nombre corto interno, sin espacios (lo usa data-enlaces)
       materia      el id de la materia a la que pertenece
       etiqueta     lo que aparece en rojo en la tarjeta (ej. "Tarea 1")
       titulo       nombre del proyecto
       resumen      una linea de que es
       imagen       portada de la tarjeta, desde la raiz del sitio
       pagina       a donde lleva la tarjeta, desde la raiz del sitio
       tecnologias  lista que se muestra en el catalogo y alimenta los filtros
       repo         (opcional) link al codigo en GitHub
       demo         (opcional) link al proyecto corriendo en internet
       destacado    true = tambien aparece en la pagina de inicio            */
  proyectos: [
    {
      id: "rutas-optimas",
      materia: "estructura-datos-avanzados",
      etiqueta: "Proyecto final",
      titulo: "Rutas Optimas en Redes Viales",
      resumen: "App que compara Dijkstra, A* y k-shortest paths sobre el mapa real de Tlaxcala.",
      imagen: "assets/images/RutasOptimas.svg",
      pagina: "templates/rutasOptimas.html",
      tecnologias: ["React", "TypeScript", "Python", "FastAPI", "NetworkX", "Docker", "APIs", "Grafos"],
      repo: "https://github.com/ReasonRaven/ProyectoRutasOptimasRedesViales",
      destacado: true
    },
    {
      id: "erp-sap-b1",
      materia: "sistemas-informacion",
      etiqueta: "Caso practico",
      titulo: "Implementacion de un ERP",
      resumen: "Propuesta completa de SAP Business One para una empresa de scooters: RFP, roadmap y KPIs.",
      imagen: "assets/images/ErpSapB1.svg",
      pagina: "templates/erpSapB1.html",
      tecnologias: ["SAP Business One", "ERP", "RFP", "KPIs", "Analisis de procesos"],
      destacado: true
    },
    {
      id: "wicho-tinder",
      materia: "estructura-datos",
      etiqueta: "Proyecto final",
      titulo: "WichoTinder",
      resumen: "Parodia de Tinder para el campus: grafos de amistades, pilas y POO en JavaScript.",
      imagen: "assets/images/WichoTinder.svg",
      pagina: "templates/wichoTinder.html",
      tecnologias: ["JavaScript", "Grafos", "HTML", "CSS", "Canvas", "Python"],
      repo: "https://github.com/ReasonRaven/WichoTinder",
      demo: "https://reasonraven.github.io/WichoTinder/",
      destacado: true
    },
    {
      id: "mi-primera-pagina",
      materia: "intro-sistemas",
      etiqueta: "Tarea 1",
      titulo: "Mi primera pagina",
      resumen: "Presentacion personal con gustos, habilidades y datos de contacto.",
      imagen: "assets/images/SSdemipag.png",
      pagina: "templates/mi_Pagina_WEB.html",
      tecnologias: ["HTML", "CSS"],
      destacado: true
    },
    {
      id: "escaner-koala",
      materia: "intro-sistemas",
      etiqueta: "Tarea 2",
      titulo: "Escaner de objeto",
      resumen: "Modelo 3D de un koala creado con Polycam y publicado en Sketchfab.",
      imagen: "assets/images/poly-snapshot.jpg",
      pagina: "templates/scanerKoala.html",
      tecnologias: ["Polycam", "Sketchfab"],
      destacado: true
    },
    {
      id: "experiencia-vr",
      materia: "intro-sistemas",
      etiqueta: "Tarea 3",
      titulo: "Experiencia VR",
      resumen: "Reporte breve sobre el uso de gafas de realidad virtual.",
      imagen: "assets/images/VR.jpeg",
      pagina: "templates/reporte.html",
      tecnologias: ["Realidad virtual"],
      destacado: true
    },
    {
      id: "frameworks",
      materia: "intro-sistemas",
      etiqueta: "Tarea 4",
      titulo: "Frameworks",
      resumen: "Investigacion de tecnologias usadas por aplicaciones populares.",
      imagen: "assets/images/Frameworks.png",
      pagina: "templates/frameworks.html",
      tecnologias: ["Investigacion"],
      destacado: true
    },
    {
      id: "ahorcado-python",
      materia: "intro-sistemas",
      etiqueta: "Tarea 5",
      titulo: "Ahorcado en Python",
      resumen: "Juego de ahorcado por consola con listas, ciclos y control de vidas.",
      imagen: "assets/images/Ahorcado.png",
      pagina: "templates/ahorcadoPython.html",
      tecnologias: ["Python"],
      destacado: true
    },
    {
      id: "stack-overflow",
      materia: "intro-sistemas",
      etiqueta: "Tarea 6",
      titulo: "Stack Overflow",
      resumen: "Presentacion visual sobre la plataforma Stack Overflow.",
      imagen: "assets/images/StackOverflow.png",
      pagina: "templates/stackOverflow.html",
      tecnologias: ["Investigacion"],
      destacado: true
    },
    {
      id: "platica-modeva",
      materia: "intro-sistemas",
      etiqueta: "Tarea 7",
      titulo: "Platica Modeva",
      resumen: "Resumen de actividades, talleres y vida universitaria.",
      imagen: "assets/images/modeva.png",
      pagina: "templates/platicaModeva.html",
      tecnologias: ["Reporte"],
      destacado: true
    },
    {
      id: "ia-teachable-machine",
      materia: "intro-sistemas",
      etiqueta: "Tarea 8",
      titulo: "IA Teachable Machine",
      resumen: "Demo interactiva de clasificacion con camara e inteligencia artificial.",
      imagen: "assets/images/TeachableMachine.png",
      pagina: "templates/IA.html",
      tecnologias: ["JavaScript", "TensorFlow.js", "Teachable Machine", "IA"],
      destacado: true
    },
    {
      id: "backend-flask",
      materia: "intro-sistemas",
      etiqueta: "Tarea 9",
      titulo: "Backend con Flask",
      resumen: "Servidor web con Python y Flask que sirve el portafolio con rutas dinamicas.",
      imagen: "assets/images/BackendFlask.svg",
      pagina: "templates/backendFlask.html",
      tecnologias: ["Python", "Flask", "APIs", "Jinja2", "Gunicorn", "Render"],
      destacado: true
    },
    {
      id: "programacion-1-cpp",
      materia: "programacion-1",
      etiqueta: "Curso completo",
      titulo: "Programacion 1 — C++",
      resumen: "Proyectos y ejercicios del curso: Ahorcado, POO, recursividad y arreglos.",
      imagen: "assets/images/ProgramacionCpp.svg",
      pagina: "templates/programacion1.html",
      tecnologias: ["C++"],
      destacado: true
    }
  ]
};
