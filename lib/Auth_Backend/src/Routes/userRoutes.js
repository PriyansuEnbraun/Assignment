const express = require("express");
const userRouter = express.Router();
const {Signup,Login,SignUpPsql,LoginPsql,forgotPassword} = require("../Controllers/UserController");



userRouter.post("/SignUp",SignUpPsql);

userRouter.post("/Login",LoginPsql);

userRouter.post("/ForgotPassword",forgotPassword);



module.exports = userRouter;