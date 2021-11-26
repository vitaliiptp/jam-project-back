const connection = require('./db-config');
require('dotenv').config();
const express = require('express');
const app = express();
const port = process.env.PORT || 8000;

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
      userName: req.session.user[0].user_name,
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
    'SELECT * FROM users WHERE user_name = ?;',
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
            'INSERT INTO users (user_name, password) VALUES (?,?)',
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
    'SELECT * FROM users WHERE user_name = ?;',
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

// set profile page
app.post('/users', (req, res) => {
  let { userId, city, email, phone, level, genre, instrument, bio } = req.body;
  console.log(req.body);
  connection.query(
    'INSERT INTO profiles (user_id, city, contact_mail, contact_phone, skill_level, genre, instrument, biography) VALUES (?,?,?,?,?,?,?,?)',
    [userId, city, email, phone, level, genre, instrument, bio],
    (err, response) => {
      console.log(err);
      if (err) {
        res
          .status(400)
          .send({ message: 'Sorry, something went wrong', error: err });
      }
      if (response.affectedRows > 0) {
        res
          .status(200)
          .send({ profileCreated: true, message: 'Profile created' });
      }
    }
  );
});

// search
app.get('/users/search', (req, res) => {
  let instrument = req.query.instrument;
  let city = req.query.city;
  let genre = req.query.genre;
  let user_name = req.query.user_name;
  let skill_level = req.query.level;
  let sql =
    'SELECT * FROM profiles INNER JOIN users WHERE profiles.user_id = users.id';
  let sqlValues = [];
  console.log(req.query);
  if (instrument) {
    sql += ' AND instrument=?';
    sqlValues.push(instrument);
  }
  if (city) {
    sql += ' AND city=?';
    sqlValues.push(city);
  }
  if (genre) {
    sql += ' AND genre=?';
    sqlValues.push(genre);
  }
  if (user_name) {
    sql += ' AND user_name=?';
    sqlValues.push(skill_level);
  }
  if (skill_level) {
    sql += ' AND skill_level=?';
    sqlValues.push(skill_level);
  }
  console.log(sql);
  connection.query(sql, sqlValues, (err, result) => {
    if (err) {
      res.status(500).send('Errror retrieving data from database');
    } else if (result[0] === undefined) {
      res.status(200).send('Cannot find user');
    } else {
      res.status(200).json(result);
    }
  });
});
//get all users
app.get('/users',(req,res) => {
  connection.query("SELECT p.user_id, u.user_name, p.city,p.contact_mail,p.skill_level,p.instrument,p.genre,p.contact_phone,p.picture FROM profiles p JOIN users u ON p.user_id = u.id",
  (err, result) => {
    if (err) {
      res.status(500).send('Errror retrieving data from database');
    } else if (result[0] === undefined) {
      res.status(400).send('Cannot find users');
    } else {
      res.status(200).json(result);
    }
  }
  )
  
})

// search user's location
app.get('/users/location', (req, res) => {
  connection.promise().query('SELECT p.picture, p.city, p.user_id, p.contact_mail, p.genre, p.skill_level, p.music_sample, p.latitude, p.longitude, u.user_name FROM profiles AS p LEFT JOIN users AS u ON u.id = p.user_id')
      .then((result) => {
        if(result[0].length) res.status(200).json(result[0]);
        else res.status(404).send('user not found')
      }).catch((err) => {
    res.status(500).send(`${err}: Error retrieving data from database`);
  });
});
// listen
app.listen(port, () => console.log(`Server listening on Port ${port}`));
