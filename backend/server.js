const express = require('express');
const { Pool } = require('pg');
const bcrypt = require('bcryptjs');
const cors = require('cors');
const bodyParser = require('body-parser');

const app = express();
app.use(cors());
app.use(bodyParser.json());

// Database configuration with environment variables
let pool;
if (process.env.DATABASE_URL) {
  // For production (Render, Railway, etc.)
  pool = new Pool({
    connectionString: process.env.DATABASE_URL,
    ssl: { rejectUnauthorized: false }
  });
} else {
  // For local development
  pool = new Pool({
    host: process.env.DB_HOST || 'localhost',
    user: process.env.DB_USER || 'root',
    password: process.env.DB_PASSWORD || '182007',
    database: process.env.DB_NAME || 'survey_proj',
    port: 5432
  });
}

// Create users table if it doesn't exist
const createTableQuery = `
  CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
  );
`;

// Initialize database
pool.query(createTableQuery)
  .then(() => console.log('Database initialized successfully'))
  .catch(err => console.error('Error initializing database:', err));

app.post('/login', async (req, res) => {
  const { username, password } = req.body;
  if (!username || !password) {
    return res.status(400).json({ message: 'Username and password are required.' });
  }
  try {
    const { rows } = await pool.query('SELECT * FROM users WHERE username = $1', [username]);
    console.log('Username from form:', username);
    console.log('Rows from DB:', rows);
    if (rows.length === 0) {
      return res.status(401).json({ message: 'Invalid username or password.' });
    }
    const user = rows[0];
    console.log('Password from form:', password);
    console.log('Hash from DB:', user.password_hash);
    const passwordMatch = await bcrypt.compare(password, user.password_hash);
    console.log('Password match:', passwordMatch);
    if (!passwordMatch) {
      return res.status(401).json({ message: 'Invalid username or password.' });
    }
    // For demo, just return success. In production, use JWT or session.
    res.json({ message: 'Login successful', user: { id: user.id, username: user.username } });
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: 'Server error' });
  }
});

app.post('/register', async (req, res) => {
  const { username, password } = req.body;
  if (!username || !password) {
    return res.status(400).json({ message: 'Username and password are required.' });
  }
  try {
    // Check if username already exists
    const { rows } = await pool.query('SELECT * FROM users WHERE username = $1', [username]);
    if (rows.length > 0) {
      return res.status(409).json({ message: 'Username already exists.' });
    }
    const password_hash = await bcrypt.hash(password, 10);
    await pool.query('INSERT INTO users (username, password_hash) VALUES ($1, $2)', [username, password_hash]);
    res.json({ message: 'Registration successful' });
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: 'Server error' });
  }
});

const PORT = process.env.PORT || 3001;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});