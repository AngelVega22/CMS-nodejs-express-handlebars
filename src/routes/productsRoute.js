const express = require("express");
const pool = require("../connection");
const router = express.Router();
const productsController = require('../controllers/productsController')
const { isLoggedIn } = require('../lib/auth');


router.get('/', productsController.list)
router.get('/miList', isLoggedIn, productsController.miList)
router.get('/detalles/:id', async (req, res) => {
    const { id } = req.params;
    const producto = await pool.query('SELECT * FROM producto INNER JOIN user ON producto.id_user = user.id WHERE id_user = ?', [id]);
    // console.log(producto)
    res.render('partials/productos/detalles', { producto: producto })
})

router.get('/addProduct', isLoggedIn, (req, res) => {
    res.render('partials/addProduct')
})

router.get('/editProduct/:id', isLoggedIn, async (req, res) => {
    const { id } = req.params;
    const productos = await pool.query('SELECT * FROM producto WHERE id = ?', [id]);
    res.render('partials/editProduct', { producto: productos[0] })
})
router.post('/editProduct/:id', isLoggedIn, productsController.updateProducto)
router.get('/deleteProducto/:id', isLoggedIn, productsController.deleteProducto)
router.post('/addProducto', isLoggedIn, productsController.addProducto)

module.exports = router;