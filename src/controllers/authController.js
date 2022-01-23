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

module.exports = controller;
