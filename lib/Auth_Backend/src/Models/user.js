const mongoose = require("mongoose");

const UserSchema = mongoose.Schema({

    full_Name : {
        type : String,
        required : false,
    },

    login_Id : {
        type : String,
        required: true,
    },
    password : {
        type: String,
        required: true,
    }

}, {timestamps : true});

module.exports = mongoose.model("User", UserSchema);