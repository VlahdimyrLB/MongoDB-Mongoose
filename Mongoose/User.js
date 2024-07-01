const mongoose = require("mongoose"); // Import Mongoose library

// rather than nesting object create a new Schema and reference it
const addressSchema = new mongoose.Schema({
    street: String,
    city: String,
})

// Define a schema for the user collection with name and age fields
const userSchema = new mongoose.Schema({
    name: String,
    age:{
        type: Number,
        min: 1,
        max: 100,

        // custom valdiation
        validate: {
            validator: v => v % 2 === 0, // checks if number is even
            message: props => `${props.value} is not an even number`
        }
    },

    // we can add validations here just use curlies {type:type, validations:validations}
    email: {
        type: String,
        required: true, // this must be required
        lowercase: true, // sets the input to lowercase automatically
        minLength: 8, // minimum of 8 characters
    },
    createdAt: {
        type: Date,
        immutable: true, // dont allow changes 
        default: () => Date.now(), // set a default
    },
    updatedAt:{
        type: Date,
        default: () => Date.now(), 
    },
    bestFriend: {
        type: mongoose.SchemaTypes.ObjectId, // reference on another object base on ID
        ref: "User" // ref = where does the ObjectId referenced to ex. ObjectId from User model
    },
    hobbies: [String],
    address: addressSchema
});

// Export a model name User based on the userSchema to interact with the 'users' collection
module.exports = mongoose.model("User", userSchema);

// NOTE: Mongoose will automatically create a MongoDB collection with a lowercase, pluralized version of your model name.