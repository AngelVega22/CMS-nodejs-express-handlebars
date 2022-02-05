const express = require("express");
const router = express.Router();
const { isLoggedIn } = require('../lib/auth');
const pool = require('../connection')
const adminController = require('../controllers/adminController')

router.get('/dashboard', isLoggedIn, async (req, res) => {
    res.render('dashboard/dashboard');
});

router.get('/adminPublicaciones', isLoggedIn, adminController.adminPublicaciones)

router.post('/upload/:id', isLoggedIn, adminController.upload)



module.exports = router;