import { drizzle } from "drizzle-orm/postgres-js";
import postgres from "postgres";

const queryClient = postgres(process.env["DATABASE_URL"]);
export const db = drizzle(queryClient);

const result = await db.execute("select 1");
console.log(result);