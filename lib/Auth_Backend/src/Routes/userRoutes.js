const express = require("express");
const userRouter = express.Router();
const {Signup,Login} = require("../Controllers/UserController");



userRouter.post("/SignUp",Signup);

userRouter.post("/Login",Login);

module.exports = userRouter;