# ReactRailsAuth

A Rails generator that scaffolds a complete authentication system for React + Rails API applications with JWT token authentication. Modified rails generate authentication.

## Installation

Add to your Gemfile:
```bash
gem 'react_rails_auth', git: 'https://github.com/ARLocke322/react-rails-auth'
gem 'rack-cors'
gem 'bcrypt'
```

Then run:
```bash
bundle install
```

## Usage

### 1. Create a new Rails API app
```bash
rails new my_app --api
cd my_app
```

### 2. Add the gem and dependencies
```bash
bundle add react_rails_auth --git https://github.com/ARLocke322/react-rails-auth
bundle add rack-cors bcrypt
bundle install
```

### 3. Initialize your React frontend
```bash
bun init frontend
```

### 4. Generate authentication scaffolding
```bash
rails generate react_rails_auth
```

This creates:
- Controllers: `Authentication`, `Sessions`, `Registrations`, `Passwords`
- Models: `User`, `Session`, `Current`
- Migrations: `CreateUsers`, `CreateSessions`
- React components: `LoginForm`, `SignupForm`
- Auth utilities: Zustand store, Zod schemas, API service
- CORS configuration

### 5. Run migrations
```bash
rails db:migrate
```

### 6. Install frontend dependencies
```bash
cd frontend
bun install
```

### 7. Start your servers

In one terminal:
```bash
rails s
```

In another terminal:
```bash
cd frontend
bun dev
```

Your Rails API will run on `http://localhost:3000` and your React app on `http://localhost:5173`.

## API Endpoints

- `POST /v1/registrations` - Create new user account
- `POST /v1/session` - Login
- `DELETE /v1/session` - Logout
- `POST /v1/passwords` - Request password reset
- `PATCH /v1/passwords/:token` - Reset password

## Frontend Structure
```
frontend/src/
├── components/
│   ├── LoginForm.tsx
│   └── SignupForm.tsx
├── hooks/
│   └── useAuthStore.ts
├── schemas/
│   └── auth.ts
├── services/
│   └── auth.ts
├── types/
│   └── api/auth/index.ts
└── utils/
    └── assertions.ts
```
