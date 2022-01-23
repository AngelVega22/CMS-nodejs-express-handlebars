const express = require("express");
const router = express.Router();
const authController = require("../controllers/authController");
const { check, validationResult } = require("express-validator");
const passport = require("passport");
const { isNotLoggedIn, isLoggedIn } = require('../lib/auth');
const pool = require('../connection');

//METODOS GET
router.get("/signup", isNotLoggedIn, (req, res) => {
  res.render("auth/signup");
});
router.get("/signin", isNotLoggedIn, (req, res) => {
  res.render("auth/signin");
});
//METODO SIGNUP
router.post(
  "/signup",
  [
    check("first_name").not().isEmpty().withMessage("First name is required"),
    check("last_name").not().isEmpty().withMessage("Last name is required"),
    check("user_name").not().isEmpty().withMessage("Username is required"),
    check("email")
      .not()
      .isEmpty()
      .isEmail()
      .withMessage("Email is required")
      .isEmail()
      .withMessage("Invalid Email"),
    check("password").not().isEmpty().withMessage("Password is required"),
  ],
  (req, res, next) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      res.render("auth/signup", { data: req.body, errors: errors.array() });
    } else {
      next();
    }
  },
  passport.authenticate("local.signup", {
    successRedirect: "/dashboard",
    failureRedirect: "/signup",
  })
);
//METODO SIGNIN
router.post(
  "/signin",
  [

    check("email")
      .not()
      .isEmpty()
      .isEmail()
      .withMessage("Email is required")
      .isEmail()
      .withMessage("Invalid Email"),
    check("password").not().isEmpty().withMessage("Password is required"),
  ],
  (req, res, next) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      res.render("auth/signin", { data: req.body, errors: errors.array() });
    } else {
      next();
    }
  },
  passport.authenticate("local.signin", {
    successRedirect: "/dashboard",
    failureRedirect: "/signin",
  })
);

router.get('/logout', (req, res) => {
  req.logOut();
  res.redirect('/')
})

//=================//
router.post('/editUser/:id', isLoggedIn, authController.updateUser);

module.exports = router;
