const controller = {};
const pool = require('../connection')

//Editar usuario
controller.updateUser = async (req, res) => {
    const { id } = req.params;
    const { first_name, last_name, email, user_name, foto } = req.body;
    const updatedUser = {
        first_name, last_name, email, user_name, foto
    };
    await pool.query('UPDATE user set ? WHERE id = ?', [updatedUser, id]);
    res.redirect('/dashboard');
}
//Listar usuarios
controller.adminUsuarios = async (req, res) => {
    const data = await pool.query("SELECT * FROM user where is_superuser = 0 ", [req.user.id]);
    res.render('partials/admin/adminUsuarios', { data })
}

//Eliminar usuarios
controller.deleteUsuarios = async (req, res) => {
    const { id } = req.params;
    await pool.query('DELETE FROM user WHERE ID = ?', [id]);
    res.redirect('/adminUsuarios');
}


controller.editUsuarios = async (req, res) => {
    const { id } = req.params;
    const user = await pool.query('SELECT * FROM user  WHERE id = ?', [id]);
    // console.log(user)
    res.render('partials/admin/editUsuarios', { user: user[0] })
}
module.exports = controller;
