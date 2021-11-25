const connection = require('./db-config');
require('dotenv').config();
const express = require('express');
const app = express();
const port = process.env.PORT || 5000;

const bcrypt = require('bcrypt');
const saltRounds = 10;
const session = require('express-session');
const { response } = require('express');

// connection

connection.connect((err) => {
  if (err) {
    console.error('error connecting: ' + err.stack);
  } else {
    console.log(
      'connected to database with threadId :  ' + connection.threadId
    );
  }
});

// middleware

app.use(express.json());
app.use(
  session({
    secret: 'keyboard cat',
    resave: false,
    saveUninitialized: true,
    cookie: {
      // 24 hours
      expires: 1000 * 60 * 60 * 24,
      sameSite: 'strict',
    },
  })
);

// routes
// initial check if logged in
app.get('/login', (req, res) => {
  if (req.session.user) {
    console.log('logged in user: ', req.session.user);
    res.status(200).send({
      loggedIn: true,
      userName: req.session.user[0].name,
      userId: req.session.user[0].id,
    });
  } else {
    console.log('not logged in');
    res.status(401).send({ loggedIn: false });
  }
});

// register
app.post('/register', (req, res) => {
  const name = req.body.name;
  const password = req.body.password;

  connection.query(
    'SELECT * FROM users WHERE name = ?;',
    name,
    (err, result) => {
      if (err) {
        res
          .status(400)
          .send({ message: 'Sorry, something went wrong', error: err });
      }

      if (result.length > 0) {
        res
          .status(401)
          .send({ userCreated: false, message: 'Username already exists' });
      } else {
        bcrypt.hash(password, saltRounds, (err, hashedPw) => {
          if (err) {
            console.log(err);
          }
          connection.query(
            'INSERT INTO users (name, password) VALUES (?,?)',
            [name, hashedPw],
            (err, response) => {
              if (err) {
                res
                  .status(400)
                  .send({ message: 'Sorry, something went wrong', error: err });
              }
              if (response.affectedRows === 1) {
                res
                  .status(200)
                  .send({ userCreated: true, message: 'User created' });
              }
            }
          );
        });
      }
    }
  );
});

// login
app.post('/login', (req, res) => {
  const name = req.body.name;
  const password = req.body.password;

  connection.query(
    'SELECT * FROM users WHERE name = ?;',
    name,
    (err, result) => {
      if (err) {
        res
          .status(400)
          .send({ message: 'Sorry, something went wrong', error: err });
      }

      if (result.length > 0) {
        bcrypt.compare(password, result[0].password, (error, response) => {
          if (error) {
            res
              .status(401)
              .send({ message: 'Sorry, something went wrong', error: error });
          }
          if (response) {
            req.session.user = result;
            console.log(req.session.user);
            res
              .status(200)
              .send({ loggedIn: true, message: 'Login successful' });
          } else {
            res
              .status(401)
              .send({ loggedIn: false, message: 'Wrong password' });
          }
        });
      } else {
        res.status(401).send({ message: "User doesn't exist" });
      }
    }
  );
});

// logout
app.get('/logout', (req, res) => {
  if (req.session) {
    console.log('destroying session');
    req.session.destroy((err) => {
      if (err) {
        res.status(401).send({ sessionDestroyed: false });
        console.log('Unable to log out');
      } else {
        console.log('Logout successful');
        res.status(200).send({ sessionDestroyed: true });
      }
    });
  }
});

// search
app.get('/users/search', (req, res) => {
  let instrument = req.query.instrument;
  let city = req.query.city;
  let genre = req.query.genre;
  let user_name = req.query.user_name;
  let skill_level = req.query.level;
  let sql = "SELECT * FROM user u, profiles p, music_samples m, instrument i, genre g, follow f"
  if (req.query.instrument) {
    sql += " WHERE color=?";
    sqlValues.push(req.query.color);

  if (instrument) {
    connection.query(
      'SELECT id FROM instruments WHERE instrument = ?;',
      instrument,
      (err, response) => {
        //
      }
    );
  }
});

// listen
app.listen(port, () => console.log(`Server listening on Port ${port}`));
