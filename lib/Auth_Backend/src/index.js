const express = require("express");
const app = express();
const UserData = require("./UserData.json");
const userRouter = require("./Routes/userRoutes");
const dotenv = require("dotenv");
const mongoose = require("mongoose");

dotenv.config();

app.use(express.json());

app.use("/users", userRouter);

app.post("/", (req,res)=>{
    res.status(200).send("Authentication Backend");
});

const PORT = process.env.PORT || 5000;

mongoose.connect(process.env.MONGO_URL)
.then(() => {
    app.listen(PORT, () => {
        console.log("Server started on port no. " + PORT);
    });
})
.catch((error) => {
    console.log("Error connecting to MongoDB:", error.message);
});
