const mongoose = require('mongoose')
const User = require("./User")

mongoose.connect("mongodb://localhost/testdb") // db connection

// CREATE A NEW USER

// const user = new User({name: "Vlahd"})
// user.save().then(()=> console.log("User Save")) 
// save() to save the user to the db

// instead of using Promises we can use Async/Await

// Example 1
const run = async () => {
// First Apporach by instantiating and save()
    // const user = new User({name: "Vlahd"})
    // await user.save()
    
// Second Approach using Create
    const user = await User.create({name: "Vlahd"})
    user.name = "Sally" // use to update
    await user.save() // save update to database
    console.log(user)
}
// run()

// Example 2
// use try catch for errors
const test = async () => {
    try {
    const user = await User.create({
        name: "Shar",
        age: 22,
        email: "shar@gmail.com",
        hobbies: ["Singing", "Playing", "F"],
        address: {
            street: "Main Street"
        }
    })
    console.log(user);
    } catch (error) {
        console.log(error.message); 
        // ex. User validation failed: age: Cast to Number failed for value "wsdasdsa" (type string) at path "age"
    }
}
// test()

// Example 3 - QUERIES
const que = async () => {
    try {
        // const user = await User.find({name: "Shar"})
        // const user = await User.findOne({name: "Shar"}) 
        // const user = await User.exists({name: "Shar"}) // if user exists
        const user = await User.findById("6682815c62975aabf56031aa")
        // const user = await User.deleteOne({name: "Shar"}) 
        // const user = await User.deleteMany({name: "Shar"}) 
        console.log(user);
    } catch (error) {
        console.log(error.message);
    }
}
// que()


const ries = async () => {
    try {
        // queries using where() and equals()
        // const user = await User.where("name").equals("Shar")
        // chained query
         const user = await User.where("age") 
            .lt(30)
            .where("name")
            .equals("Shar")
            .limit(2)
            .select("name") // get only this field
         console.log(user);
    } catch (error) {
        console.log(error.message);
    }
}
// ries()

const comp = async () => {
     try {
         const user = await User.where("age") 
            .lt(30)
            .where("name")
            .equals("Shar")
            .limit(1)
            .populate("bestFriend") // Populate replaces IDs in your document with the actual documents they refer to from other collections.

            // created a new user with bestfriend using their object id
            // user[0].bestFriend = "668286e73cbe1330e15ac4f6"
            // await user[0].save();
         console.log(user);
    } catch (error) {
        console.log(error.message);
    }
}

comp()