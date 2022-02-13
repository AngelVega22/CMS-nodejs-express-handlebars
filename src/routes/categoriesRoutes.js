const express = require("express");
const router = express.Router();
const { isLoggedIn } = require('../lib/auth');
const pool = require('../connection')
const categoriesController = require('../controllers/categoriesController')

//Listar dashboard de categorias
router.get('/categorias', isLoggedIn, categoriesController.categorias)

//Vista para agregar categoria
router.get('/addCategoria', isLoggedIn, (req, res) => {
    res.render('partials/categorias/addCategoria')
})
//Agregar categoria
router.post('/addCategoria', isLoggedIn, categoriesController.addCategoria)

//Ruta para llamar datos a editar
router.get('/editCategoria/:id', isLoggedIn, categoriesController.editCategorias);

//Editar datos
router.post('/editCategoria/:id', isLoggedIn, categoriesController.editCategoria)

//Agregar imagen
router.post('/uploadFotoCategoria/:id', isLoggedIn, categoriesController.uploadFotoCategoria)

//Eliminar categoria
router.get('/deleteCategoria/:id', isLoggedIn, categoriesController.deleteCategoria)

module.exports = router;