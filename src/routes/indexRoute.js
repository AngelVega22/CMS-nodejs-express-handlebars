const express = require("express");
const router = express.Router();
const pool = require("../connection");

// router.get("/", (req, res) => {

//     res.render("index/index");
// });

router.get("/", (req, res) => {
    const categoria = pool.query("SELECT * FROM categoria", (err, categoria) => {
        // console.log(curso)

        if (err) {
            res.json(err);

        } res.render("index/index", {
            data: categoria

        })
    })

})
module.exports = router;
