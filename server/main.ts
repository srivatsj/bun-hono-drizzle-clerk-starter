import { Hono } from "hono";
import { db } from "./db";
import { clerkMiddleware } from '@hono/clerk-auth'
import { getUserId } from "./middleware/clerk";

const app = new Hono();

app.use('/testAuth', clerkMiddleware())

app.get("/", (c) => {
  return c.text(`Hello Hono!`);
});

app.get("/testDatabase", async (c) => {
  const result = await db.execute("select 1");
  return c.json({status: 'Connected to Database'});
});

app.get("/testAuth", getUserId, (c) => {
  return c.text(`Hello Hono! from ${c.get("userId")}`);
});

export default app;
