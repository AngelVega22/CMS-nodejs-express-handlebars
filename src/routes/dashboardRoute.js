const express = require("express");
const router = express.Router();
const { isLoggedIn } = require('../lib/auth');

router.get('/dashboard', isLoggedIn, async (req, res) => {
    res.render('dashboard/dashboard');
});

module.exports = router;