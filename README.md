# Survey Application

A full-stack survey application built with React frontend and Node.js/Express backend.

## Features

- User authentication (login/register)
- Create and manage surveys
- AI-powered question generation based on survey description
- Share surveys via public links
- View and export survey responses
- Responsive design

## Tech Stack

- **Frontend**: React.js
- **Backend**: Node.js, Express.js
- **Database**: MySQL
- **Authentication**: bcryptjs for password hashing

## Local Development

### Prerequisites

- Node.js (v16 or higher)
- MySQL database
- npm or yarn

### Setup

1. **Clone the repository**
   ```bash
   git clone <your-repo-url>
   cd survey
   ```

2. **Backend Setup**
   ```bash
   cd backend
   npm install
   ```

3. **Database Setup**
   - Create a MySQL database named `survey_proj`
   - Create the users table:
   ```sql
   CREATE TABLE users (
     id INT AUTO_INCREMENT PRIMARY KEY,
     username VARCHAR(255) UNIQUE NOT NULL,
     password_hash VARCHAR(255) NOT NULL,
     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
   );
   ```

4. **Environment Variables**
   - Copy `backend/env.example` to `backend/.env`
   - Update the database credentials in `.env`

5. **Start Backend**
   ```bash
   npm start
   ```

6. **Frontend Setup**
   ```bash
   cd ../frontend
   npm install
   ```

7. **Environment Variables**
   - Copy `frontend/env.example` to `frontend/.env`
   - Update `REACT_APP_BACKEND_URL` if needed

8. **Start Frontend**
   ```bash
   npm start
   ```

The application will be available at:
- Frontend: http://localhost:3000
- Backend: http://localhost:3001

## Deployment

### Option 1: Render (Recommended)

#### Backend Deployment

1. **Create a Render account** at https://render.com

2. **Set up MySQL Database**
   - Go to "New" → "PostgreSQL" (Render doesn't have MySQL, but PostgreSQL works)
   - Note down the database URL

3. **Deploy Backend**
   - Go to "New" → "Web Service"
   - Connect your GitHub repository
   - Set the root directory to `backend`
   - Build Command: `npm install`
   - Start Command: `npm start`
   - Add environment variables:
     - `DB_HOST`: Your database host
     - `DB_USER`: Your database username
     - `DB_PASSWORD`: Your database password
     - `DB_NAME`: Your database name
     - `PORT`: 10000 (Render's default)

4. **Deploy Frontend**
   - Go to "New" → "Static Site"
   - Connect your GitHub repository
   - Set the root directory to `frontend`
   - Build Command: `npm install && npm run build`
   - Publish Directory: `build`
   - Add environment variable:
     - `REACT_APP_BACKEND_URL`: Your backend URL (e.g., https://your-backend.onrender.com)

### Option 2: Railway

1. **Create a Railway account** at https://railway.app

2. **Deploy Backend**
   - Connect your GitHub repository
   - Set the service directory to `backend`
   - Add environment variables for database connection

3. **Deploy Frontend**
   - Create a new service
   - Set the service directory to `frontend`
   - Add environment variable for backend URL

### Option 3: Vercel + Railway

1. **Deploy Backend on Railway**
   - Follow Railway deployment steps above

2. **Deploy Frontend on Vercel**
   - Connect your GitHub repository to Vercel
   - Set the root directory to `frontend`
   - Add environment variable for backend URL

## Environment Variables

### Backend (.env)
```
DB_HOST=your-database-host
DB_USER=your-database-user
DB_PASSWORD=your-database-password
DB_NAME=your-database-name
PORT=3001
```

### Frontend (.env)
```
REACT_APP_BACKEND_URL=http://localhost:3001
```

## Database Schema

```sql
CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(255) UNIQUE NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

## API Endpoints

- `POST /login` - User login
- `POST /register` - User registration

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## License

MIT License
