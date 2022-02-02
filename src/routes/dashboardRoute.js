const express = require("express");
const router = express.Router();
const { isLoggedIn } = require('../lib/auth');
const pool = require('../connection')


router.get('/dashboard', isLoggedIn, async (req, res) => {
    res.render('dashboard/dashboard');
});

router.post('/upload/:id', isLoggedIn, (req, res) => {

    if (req.files) {
        console.log(req.files)
        var file = req.files.file
        var filename = file.name
        console.log(filename)

        file.mv('./src/public/uploads/' + filename, function (err) {
            if (err) {
                res.send(err)
            } else {
                const { id } = req.params;
                const foto = "/uploads/" + filename
                console.log(foto)
                pool.query('UPDATE user set foto = ? WHERE id = ?', [foto, id])
                res.redirect('/dashboard');

            }
        })
    }
})

module.exports = router;