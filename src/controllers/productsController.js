const controller = {};
const pool = require('../connection')

//listar ARTISTAS
controller.list = (req, res) => {
    const producto = pool.query("SELECT * FROM user where is_superuser= 0 and is_artist = 1 ", (err, producto) => {
        if (err) {
            res.json(err);
        }
        res.render("index/index", {
            data: producto,
        });
    });
};
//Listar productos en el dashboard
controller.miList = async (req, res) => {
    const data = await pool.query("SELECT * FROM producto WHERE id_user =? ", [req.user.id]);
    res.render('partials/productos/miList', { data })
}
//Eliminar producto/servicio
controller.deleteProducto = async (req, res) => {
    const { id } = req.params;
    await pool.query('DELETE FROM producto WHERE ID = ?', [id]);

    res.redirect('/miList');
};

//Agregar producto/servicio
controller.addProducto = async (req, res) => {
    const { nombre_artista, descripcion, genero, url_img, precio } = req.body;
    const newProduct = {
        nombre_artista,
        descripcion,
        url_img,
        genero,
        precio,
        id_user: req.user.id
    };

    await pool.query('INSERT INTO producto set ?', [newProduct]);
    res.redirect('/miList');
}

//Editar producto
controller.updateProducto = async (req, res) => {
    const { id } = req.params;
    const { nombre_artista, descripcion, genero, url_img, precio } = req.body;
    const newProduct = {
        nombre_artista, descripcion, genero, url_img, precio
    };
    await pool.query('UPDATE producto set ? WHERE id = ?', [newProduct, id]);
    res.redirect('/miList');
}




module.exports = controller;
