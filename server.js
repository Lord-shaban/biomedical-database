const express = require('express');
const mysql = require('mysql2');
const cors = require('cors');

const app = express();
const port = 3000;

app.use(cors());
app.use(express.json());

// الاتصال بقاعدة البيانات
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',      // ضع اسم المستخدم الخاص بـ MySQL (غالباً root)
    password: 'root',      // ضع كلمة المرور (غالباً فارغة في XAMPP)
    database: 'Biomedical'
});

db.connect((err) => {
    if (err) {
        console.error('Database connection failed: ' + err.stack);
        return;
    }
    console.log('Connected to MySQL Database successfuly.');
});

// المسارات (Endpoints) لاجلب البيانات
app.get('/api/authors', (req, res) => {
    db.query('SELECT * FROM Author', (err, results) => {
        if (err) res.status(500).json({ error: true, message: err.message });
        else res.json(results);
    });
});

app.get('/api/research', (req, res) => {
    db.query('SELECT * FROM Research', (err, results) => {
        if (err) res.status(500).json({ error: true, message: err.message });
        else res.json(results);
    });
});

app.get('/api/journals', (req, res) => {
    db.query('SELECT * FROM Journal', (err, results) => {
        if (err) res.status(500).json({ error: true, message: err.message });
        else res.json(results);
    });
});

app.get('/api/publishers', (req, res) => {
    db.query('SELECT * FROM Publisher', (err, results) => {
        if (err) res.status(500).json({ error: true, message: err.message });
        else res.json(results);
    });
});

app.listen(port, '0.0.0.0', () => {
    console.log(`Server running at http://127.0.0.1:${port}`);
});