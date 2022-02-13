const controller = {};
const pool = require('../connection')


//Listar todos los cursos
controller.cursos = async (req, res) => {
    const cursos = await pool.query("SELECT * FROM curso INNER JOIN categoria ON curso.id_categoria = categoria.id", (err, cursos) => {
        // console.log(cursos)

        if (err) {
            res.json(err);

        } res.render("partials/cursos/cursosPublic", {
            data: cursos

        })
    })
}
//Listar todos los cursos para administrar
controller.adminCursos = async (req, res) => {
    const cursos = await pool.query("SELECT * FROM  curso INNER JOIN categoria ON curso.id_categoria = categoria.id ", (err, cursos) => {
        // console.log(cursos)
        if (err) {
            res.json(err);

        } res.render("partials/cursos/adminCursos", {
            data: cursos

        })
    })
}

//Listar cursos de una categoria
controller.listCourses = async (req, res) => {
    const { id } = req.params;
    const curso = await pool.query('SELECT * FROM curso INNER JOIN categoria ON curso.id_categoria = categoria.id WHERE id_categoria = ?', [id]);
    // console.log(curso)
    res.render('partials/cursos/cursos', { curso: curso, id: id })
}
// Agregar curso
controller.addCurso = async (req, res) => {
    const { id } = req.params
    const { nombre_c, descripcion_c, precio, duracion, horario, inicio, estado_curso } = req.body;
    const addCurso = {
        nombre_c,
        descripcion_c,
        precio,
        duracion,
        horario,
        inicio,
        estado_curso,
        id_categoria: id
    };
    await pool.query('INSERT INTO curso set ?', [addCurso]);
    res.redirect('/cursos/' + id);
}

//Llamar datos para editar
controller.editCurso = async (req, res) => {
    const { id_c } = req.params;
    const data = await pool.query('SELECT * FROM curso  WHERE id_c = ?', [id_c]);
    // console.log(data)

    res.render('partials/cursos/editCurso', { data: data[0] })
}

//Actualizar datos de categoria
controller.editCursos = async (req, res) => {
    const { id_c } = req.params;
    const { nombre_c, descripcion_c, precio, horario, duracion, inicio, estado_curso, is_promo } = req.body;
    const updatedCurso = {
        nombre_c, descripcion_c, precio, horario, duracion, inicio, estado_curso, is_promo
    };
    await pool.query('UPDATE curso set ? WHERE id_c = ?', [updatedCurso, id_c]);
    console.log(req.body)
    res.redirect('/editCurso/' + id_c);
}

controller.uploadFotoCurso = (req, res) => {
    const { id_c } = req.params;
    if (req.files) {
        console.log(req.files)
        var file = req.files.file
        var filename = file.name
        console.log(filename)

        file.mv('./src/public/uploads/' + filename, function (err) {
            if (err) {
                res.send(err)
            } else {
                const { id_c } = req.params;
                const foto_c = "/uploads/" + filename
                // console.log(foto)
                // // console.log(" el id_c" + id_c)
                pool.query('UPDATE curso set foto_c = ? WHERE id_c = ?', [foto_c, id_c])
                res.redirect('/editCurso/' + id_c);


            }
        })
    } else {
        res.redirect('/editCurso/' + id_c);

        // res.json("error. debe introducir una foto")
    }
}


//Eliminar curso
controller.deleteCurso = async (req, res) => {
    const { id } = req.params;
    // const id_category = await pool.query('SELECT id_categoria FROM curso where id_c = ?', [id])

    await pool.query('DELETE FROM curso WHERE id_c = ?', [id]);


    res.redirect('/categorias');
}

//listar promociones
controller.promos = async (req, res) => {
    const cursos = await pool.query("SELECT * FROM curso INNER JOIN categoria ON curso.id_categoria = categoria.id", (err, cursos) => {
        // console.log(cursos)

        if (err) {
            res.json(err);

        } res.render("partials/cursos/promos", {
            data: cursos

        })
    })
}

module.exports = controller;
