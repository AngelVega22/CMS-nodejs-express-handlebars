const express = require("express");
const router = express.Router();
const productsController = require('../controllers/productsController')
const { isLoggedIn } = require('../lib/auth');


router.get('/', productsController.list)
router.get('/miList', isLoggedIn, productsController.miList)
router.get('/addProduct', isLoggedIn, (req, res) => {
    res.render('partials/addProduct')
})
router.get('/deleteProducto/:id', isLoggedIn, productsController.deleteProducto)
router.post('/addProducto', isLoggedIn, productsController.addProducto)
module.exports = router;