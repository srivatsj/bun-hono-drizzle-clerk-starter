# Starter kit for Bun and Hono

  ### Tech Stack
  
  - [Bun](https://bun.sh/) is an all-in-one JavaScript runtime & toolkit designed for speed, complete with a bundler, test runner, and Node.js-compatible package manager.
  - [Hono](https://hono.dev/) is an web application framework built on Web Standards and supports any JavaScript runtime.  
  - [Drizzle](https://orm.drizzle.team/) is a lightweight and performant TypeScript ORM.
  - [Clerk](https://clerk.com/) is a comprehensive User Management Platform.
  - Drizzle ORM connects to a PostgreSQL database that is running in a Docker container.

### Auth Setup

Generate SessionToken for an registered Clerk user:
 - To add a new user, go to the "Users" tab in the Clerk Dashboard and follow the instructions to create a new user account.
 - Generate a new session for a user registered within Clerk. See the [Clerk API documentation](https://clerk.com/docs/reference/backend-api/tag/Sessions#operation/createSession) on creating sessions.
 - Generate a session token for the session ID created in the previous step. See the [Clerk API documentation](https://clerk.com/docs/reference/backend-api/tag/Sessions#operation/CreateSessionToken) on creating session tokens.
 - Duplicate the `.env.example` file and rename the copy to `.env`.  Then, within the .env file, replace the placeholders for `CLERK_PUBLISHABLE_KEY` and `CLERK_SECRET_KEY` with the actual values found in your Clerk dashboard.

Test Auth protected endpoint

```sh
curl -H "Authorization: Bearer CLERK_SESSION_TOKEN" http://localhost:3000/testAuth
```

### Database Schema Setup

Add your Drizzle schema files under server/db/schema directory.  

Test endpoint for Database connectivity

```sh
curl http://localhost:3000/testDatabase
```
  

<a href="https://idx.google.com/new?template=https://github.com/srivatsj/bun-hono-drizzle-clerk-starter">
  <img height="32" alt="Try in IDX" src="https://cdn.idx.dev/btn/try_dark_32.svg">
</a>
