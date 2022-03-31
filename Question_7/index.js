var express = require("express");
var app = express();
var bodyParser = require("body-parser");

const { engine } = require("express-handlebars");

//route modules
var ticket = require("./routes/Ticket");
//port
const port = process.env.PORT || 8000;

app.use(bodyParser.urlencoded({ extended: false }));
app.engine("handlebars", engine());
app.set("view engine", "handlebars");
app.use(bodyParser.json());
app.use((req, res, next) => {
  res.setHeader("Access-Control-Allow-Origin", "*"); // Token
  res.setHeader(
    "Access-Control-Allow-Methods",
    "GET, POST, OPTIONS, PUT, PATCH, DELETE"
  );
  if (req.method === "OPTIONS") {
    res.setHeader(
      "Access-Control-Allow-Headers",
      "Origin, X-Requested-With, Content-Type, Accept, X-Access-Token"
    );
    return res.status(200).json({});
  }
  next();
});

const defaultRoutes = [
  {
    path: "/ticket",
    route: ticket,
  },
];

defaultRoutes.forEach((e) => {
  app.use(e.path, e.route);
});

app.listen(port, (req, res) => {
  console.log("Server is Running on Port 8000");
});
