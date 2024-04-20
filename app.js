const express = require('express');
const path = require('path');
const bcrypt = require("bcrypt");
const session = require('express-session');
const MemoryStore = require('memorystore')(session);
const con = require('./config/db');

const app = express();

// set the public folder
app.use('/public', express.static(path.join(__dirname, 'public')));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
// for session
app.use(session({
    cookie: { maxAge: 24 * 60 * 60 * 1000 }, //1 day in millisec
    secret: 'mysecretcode',
    resave: false,
    saveUninitialized: true,
    // config MemoryStore here
    store: new MemoryStore({
        checkPeriod: 24 * 60 * 60 * 1000 // prune expired entries every 24h
    })
}));

// ------------- Create hashed password --------------
app.get("/password/:pass", function (req, res) {
    const password = req.params.pass;
    const saltRounds = 10;    //the cost of encrypting see https://github.com/kelektiv/node.bcrypt.js#a-note-on-rounds
    bcrypt.hash(password, saltRounds, function (err, hash) {
        if (err) {
            return res.status(500).send("Hashing error");
        }
        res.send(hash);
    });
});

// ------------- get orders and order details --------------
app.get('/user/booking', function (req, res) {
    const sql = `
    SELECT roombooking.*, users.Username 
    FROM roombooking 
    INNER JOIN users ON roombooking.UserID = users.UserID 
    WHERE roombooking.UserID=?
`;
    con.query(sql, [req.session.userID], function (err, results) {
        if (err) {
            console.error(err);
            return res.status(500).send("Database server error");
        }
        res.json(results);
    });
});

// user Hitosry
app.get('/user/history', function(req, res){
    res.sendFile(path.join(__dirname, 'views/historyUser.html'));
});

// staff Hitosry
app.get('/staff/history', function(req, res){
    res.sendFile(path.join(__dirname, 'views/historyStaff.html'));
});

// approver Hitosry
app.get('/approver/history', function(req, res){
    res.sendFile(path.join(__dirname, 'views/historyApprover.html'));
});
// ------------- get user info --------------
app.get('/userInfo', function (req, res) {
    res.json({ "userID": req.session.userID, "username": req.session.username });
});

// ---------- login -----------
app.post('/login', function (req, res) {
    const { username, password } = req.body;
    const sql = "SELECT UserID, Password, RoleID FROM users WHERE Username = ?";
    con.query(sql, [username], function (err, results) {
        if (err) {
            console.error(err);
            return res.status(500).send("Database server error");
        }
        if (results.length != 1) {
            return res.status(401).send("Wrong username");
        }
        // check password
        bcrypt.compare(password, results[0].Password, function (err, same) {
            if (err) {
                res.status(500).send("Server error");
            }
            else if (same) {
                // remember user
                req.session.userID = results[0].UserID;
                req.session.username = username;
                req.session.role = results[0].RoleID;
                // role check
                if (results[0].RoleID == 1) {
                    // admin
                    res.send('/user/history');
                }
                else if (results[0].RoleID == 2) {
                    // user
                    res.send('/staff/history');
                }
                else if (results[0].RoleID == 3) {
                    // user
                    res.send('/approver/history');
                }
            }
            else {
                res.status(401).send("Wrong password");
            }
        });
    });
});

// ------------- Logout --------------
app.get("/logout", function (req, res) {
    //clear session variable
    req.session.destroy(function (err) {
        if (err) {
            console.error(err);
            res.status(500).send("Cannot clear session");
        }
        else {
            res.redirect("/");
        }
    });
});

// ------------ root service ----------
app.get('/', function (_req, res) {
    res.sendFile(path.join(__dirname, 'views/login.html'));
});

const PORT = 8000;
app.listen(PORT, function () {
    console.log('Server is runnint at port ' + PORT);
});