const controller = {};
const pool = require('../connection')

//listar categorias
controller.categorias = async (req, res) => {
    // console.log("categorias")
    const categoria = await pool.query('SELECT * FROM categoria', (err, categoria) => {
        if (err) {
            res.json(err);
        }
        res.render("partials/categorias/categorias", {
            data: categoria
        })

    })
}


//Agregar categoria
controller.addCategoria = async (req, res) => {
    const { nombre, descripcion } = req.body;
    const newCategoria = {
        nombre,
        descripcion,

    };

    await pool.query('INSERT INTO categoria set ?', [newCategoria]);
    res.redirect('/categorias');
}

//Llamar datos para editar
controller.editCategorias = async (req, res) => {
    const { id } = req.params;
    const categorias = await pool.query('SELECT * FROM categoria  WHERE id = ?', [id]);
    // console.log(categorias)
    res.render('partials/categorias/editCategoria', { data: categorias[0] })
}


//Actualizar datos de categoria
controller.editCategoria = async (req, res) => {
    const { id } = req.params;
    const { nombre, descripcion, estado_categoria } = req.body;
    const updatedCategoria = {
        nombre, descripcion, estado_categoria
    };
    await pool.query('UPDATE categoria set ? WHERE id = ?', [updatedCategoria, id]);
    // console.log(req.body)
    res.redirect('/editCategoria/' + id);
}
//Agregar imagen para categoria
controller.uploadFotoCategoria = (req, res) => {
    const { id } = req.params;

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
                console.log(" el id" + id)
                pool.query('UPDATE categoria set foto = ? WHERE id = ?', [foto, id])
                res.redirect('/editCategoria/' + id);


            }
        })
    } else {
        res.redirect('/editCategoria/' + id);

        // res.json("error. debe introducir una foto")
    }
}

//Eliminar categoria
controller.deleteCategoria = async (req, res) => {
    const { id } = req.params;
    await pool.query('DELETE FROM categoria WHERE ID = ?', [id]);
    res.redirect('/categorias');
}



module.exports = controller;
