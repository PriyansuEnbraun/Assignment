const express = require("express");
const userRouter = express.Router();
const {Signup,Login,SignUpPsql,LoginPsql} = require("../Controllers/UserController");



userRouter.post("/SignUp",SignUpPsql);

userRouter.post("/Login",LoginPsql);





module.exports = userRouter;