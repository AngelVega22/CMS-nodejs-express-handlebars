const express = require('express');
const router = express.Router();
const { isLoggedIn } = require('../lib/auth');
const pool = require('../connection')
const coursesController = require('../controllers/coursesController')

//**/===Rutas publicas======== */

//Listar todos los cursos
router.get('/cursos', coursesController.cursos)

//Cursos en promoción
router.get('/promociones', coursesController.promos)

//Listar cursos por categoria
router.get('/cursos-categoria/:id', coursesController.cursosXcategoria)

//Detalle de curso
router.get('/detalle-curso/:id_c', coursesController.detalleCurso)

//**/===Rutas privadas======== */

//Listar todos cursos para administrar
router.get('/admin-cursos', isLoggedIn, coursesController.adminCursos)

//Ruta para litar cursos por categoria
router.get('/cursos/:id', isLoggedIn, coursesController.listCourses)

//Vista para agregar curso 
router.get('/addCurso/:id', isLoggedIn, (req, res) => {
    const { id } = req.params;
    res.render('partials/cursos/addCurso', { id: id })
})
//Agregar curso
router.post('/addCurso/:id', isLoggedIn, coursesController.addCurso)

//Ruta para llamar datos a editar
router.get('/editCurso/:id_c', isLoggedIn, coursesController.editCurso);

//Editar datos
router.post('/editCurso/:id_c', isLoggedIn, coursesController.editCursos)

//Agregar imagen
router.post('/uploadFotoCurso/:id_c', isLoggedIn, coursesController.uploadFotoCurso)

//Eliminar curso
router.get('/deleteCurso/:id', isLoggedIn, coursesController.deleteCurso)



module.exports = router;