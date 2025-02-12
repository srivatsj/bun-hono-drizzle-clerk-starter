import { getAuth } from "@hono/clerk-auth";
import { createMiddleware } from "hono/factory";
import { HTTPException } from "hono/http-exception";

type Env = {
    Variables: {
        userId: string;
    };
};
  
export const getUserId = createMiddleware<Env>(async (c, next) => {
    const auth = getAuth(c)

    if (!auth?.userId) {
        throw new HTTPException(401, { message: "Unauthorized" });
    }

    c.set("userId", auth.userId)
    await next();
});

export default getUserId;