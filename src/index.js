const express = require("express");
const { engine } = require("express-handlebars");
const passport = require("passport");
const path = require("path");
const session = require("express-session");
const MySQLStore = require('express-mysql-session');
const { database } = require("./config");
//Inicializar
const app = express();
require("./lib/passport");
//Settings
app.set("port", process.env.PORT || 4000);
app.set("views", path.join(__dirname, "views"));
app.engine(
  ".hbs",
  engine({
    defaultLayout: "main",
    layoutsDir: path.join(app.get("views"), "layouts"),
    partialsDir: path.join(app.get("views"), "partials"),
    extname: ".hbs",
  })
);
app.set("view engine", ".hbs");

//Middlewares

app.use(express.urlencoded({ extended: false }));
app.use(
  session({
    secret: "cookie_secret",
    resave: false,
    saveUninitialized: false,
    name: "cookie_name",
    proxy: true,
    store: new MySQLStore(database)
  })
);
app.use(passport.initialize());
app.use(passport.session());
app.use((req, res, next) => {
  app.locals.user = req.user;
  app.locals.res = res;
  next();
})
//Routes
app.use(require('./routes/dashboardRoute'));
app.use(require("./routes/indexRoute"));
app.use(require("./routes/authRoute"));

app.use(express.static(path.join(__dirname, "public")));
//Starting
app.listen(app.get("port"), () => {
  console.log("Server is in port", app.get("port"));
});
