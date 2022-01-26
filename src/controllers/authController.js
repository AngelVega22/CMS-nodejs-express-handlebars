const controller = {};
const pool = require('../connection')

//Editar usuario
controller.updateUser = async (req, res) => {

    const { id } = req.params;
    const { first_name, last_name, email, user_name } = req.body;
    const updatedUser = {
        first_name, last_name, email, user_name
    };

    await pool.query('UPDATE user set ? WHERE id = ?', [updatedUser, id]);
    res.redirect('/dashboard');
}

controller.adminUsuarios = async (req, res) => {


    const data = await pool.query("SELECT * FROM user where is_superuser = 0 ", [req.user.id]);
    res.render('partials/adminUsuarios', { data })
}

module.exports = controller;
