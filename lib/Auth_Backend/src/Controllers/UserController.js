const userModel = require("../Models/user");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");

const Signup = async (req,res)=>{

    //existingUserCheck
    //HashedPassword
    //UserCreation
    //TokenGenerate

    const {FullName,LoginId,password} = req.body;
    try {

        const existingUser = await userModel.findOne({login_Id : LoginId});
        if(existingUser){
            return res.status(400).json({message: "Login Id is already taken!!"});
        }

        const hashedPassword = await bcrypt.hash(password, 10);

        const result = await userModel.create({
            
            full_Name: FullName, 
            login_Id: LoginId,
            password: hashedPassword

        });

        const token = jwt.sign({login : result.login_Id, id : result._id }, process.env.SECRET_KEY,{expiresIn:"1h"});
        res.status(201).json({ message: "User created successfully" });
        
    } catch (error) {
        console.log(error);
        res.status(500).json({message: "Something went wrong"});
    }

}

const Login = async(req,res)=>{

    //checking user
    //matching password with existing user's password

    
    const {LoginId,password} = req.body;

    try {

        const existingUser = await userModel.findOne({login_Id : LoginId});
        if(!existingUser){
            return res.status(404).json({message: "User Not Found!!"});
        }

        const matchPassword = await bcrypt.compare(password,existingUser.password);

        if(!matchPassword){
            return res.status(400).json({message:"Invalid Credentials!!"})
        }

        const token = jwt.sign({login : existingUser.login_Id, id : existingUser._id }, process.env.SECRET_KEY);
        res.status(201).json({ token });
        
    } catch (error) {
        console.log(error);
        res.status(500).json({message: "Something went wrong"});
    }

}

module.exports={Signup,Login};