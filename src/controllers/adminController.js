const controller = {};
const pool = require('../connection')

//Subir imagenes
controller.upload = (req, res) => {

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
    } else {
        res.redirect('/dashboard');
    }

}

//Listas publicaciones

controller.adminPublicaciones = async (req, res) => {
    const data = await pool.query("SELECT * FROM curso INNER JOIN user ON curso.id_user = user.id ");
    res.render('partials/admin/adminPublicaciones', { data })
}



module.exports = controller;
