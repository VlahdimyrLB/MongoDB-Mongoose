# exit Mongosh
appdb> exit

# start Mongosh
PS C:\Users\Dodi> mongosh
Current Mongosh Log ID: 66811c818c7c908a0acc8987
Connecting to:          mongodb://127.0.0.1:27017/?directConnection=true&serverSelectionTimeoutMS=2000&appName=mongosh+2.2.10

appdb> exit
PS C:\Users\Dodi> mongosh
Current Mongosh Log ID: 66811d2bd311d7ef74cc8987
Connecting to:          mongodb://127.0.0.1:27017/?directConnection=true&serverSelectionTimeoutMS=2000&appName=mongosh+2.2.10
Using MongoDB:          7.0.12
Using Mongosh:          2.2.10

For mongosh info see: https://docs.mongodb.com/mongodb-shell/

------
   The server generated these startup warnings when booting
   2024-06-30T16:43:37.265+08:00: Access control is not enabled for the database. Read and write access to data and configuration is unrestricted
------

# to use database or create new database using "use"
test> use appdb
switched to db appdb

# to show databases
appdb> show dbs
admin   40.00 KiB
appdb   40.00 KiB
config  60.00 KiB

# INSERT COMMANDS
# Insert One Document
appdb> db.users.insertOne({name: "Shar"})
{
  acknowledged: true,
  insertedId: ObjectId('6681293fd311d7ef74cc8992')
}

# Insert Many Documents at once
appdb> db.users.insertMany([{name: "Jill"}, {name: "Jack"}])
{
  acknowledged: true,
  insertedIds: {
    '0': ObjectId('66811e7ed311d7ef74cc898a'),
    '1': ObjectId('66811e7ed311d7ef74cc898b')
  }
}

# Show Documents of a Collection(users)
appdb> db.users.find()
[
  { _id: ObjectId('66811ced8c7c908a0acc8988'), name: 'John' },
  { _id: ObjectId('66811d53d311d7ef74cc8988'), name: 'Vlahd' },
  {
    _id: ObjectId('66811e1cd311d7ef74cc8989'),
    name: 'Sally',
    age: 42,
    address: { street: 'North St' },

# Insert Many Documents with nested columns
appdb> db.users.insertMany([    { name: "Alice", age: 30, hobbies: ["reading", "hiking", "coding"] },    { name: "Bob", age: 25, hobbies: ["gaming", "cooking", "cycling"] },    { name: "Charlie", age: 35, hobbies: ["photography", "traveling", "swimming"] },    { name: "Diana", age: 28, hobbies: ["painting", "running", "yoga"] }])
{
  acknowledged: true,
  insertedIds: {
    '0': ObjectId('66811fd8d311d7ef74cc898c'),
    '1': ObjectId('66811fd8d311d7ef74cc898d'),
    '2': ObjectId('66811fd8d311d7ef74cc898e'),
    '3': ObjectId('66811fd8d311d7ef74cc898f')
  }
}

# Show Documents of a Collection(users)
appdb> db.users.find()
[
  { _id: ObjectId('66811ced8c7c908a0acc8988'), name: 'John' }, 
  { _id: ObjectId('66811d53d311d7ef74cc8988'), name: 'Vlahd' },
  {
    _id: ObjectId('66811e1cd311d7ef74cc8989'),
    name: 'Sally',
    age: 42,
    address: { street: 'North St' },
    hobbies: [ 'Playing', 'Dancing', 'Singing' ]


# QUERIES

# to limit
appdb> db.users.find().limit(2)
[
  { _id: ObjectId('66811ced8c7c908a0acc8988'), name: 'John' },
  { _id: ObjectId('66811d53d311d7ef74cc8988'), name: 'Vlahd' }
]

# to sort use 1 for ASC, -1 for DESC
appdb> db.users.find().sort({name: -1}).limit(2)
[
  { _id: ObjectId('66811d53d311d7ef74cc8988'), name: 'Vlahd' },
  {

# Not Equal 
appdb> db.users.find({name: {$ne: "Sally"}})
[
  { _id: ObjectId('66811ced8c7c908a0acc8988'), name: 'John' }, 

# Greater Than
appdb> db.users.find({age: {$gt: 30}})
[
  {

# IN use array here to specify list
appdb> db.users.find({name: {$in: ["Vlahd", "Sally"]}})
[
  { _id: ObjectId('66811d53d311d7ef74cc8988'), name: 'Vlahd' },
  {
    _id: ObjectId('66811e1cd311d7ef74cc8989'),
    name: 'Sally',
    age: 42,
    address: { street: 'North St' },
    hobbies: [ 'Playing', 'Dancing', 'Singing' ]
  }
]

# Not In
appdb> db.users.find({name: {$nin: ["Vlahd", "Sally"]}})
[
  { _id: ObjectId('66811ced8c7c908a0acc8988'), name: 'John' },
  { _id: ObjectId('66811e7ed311d7ef74cc898a'), name: 'Jill' },
  { _id: ObjectId('66811e7ed311d7ef74cc898b'), name: 'Jack' },
  {
    _id: ObjectId('66811fd8d311d7ef74cc898c'),
    name: 'Alice',
    age: 30,
    hobbies: [ 'reading', 'hiking', 'coding' ]
  },
  {
    _id: ObjectId('66811fd8d311d7ef74cc898d'),
    name: 'Bob',
    age: 25,
    hobbies: [ 'gaming', 'cooking', 'cycling' ]
  },
  {
    _id: ObjectId('66811fd8d311d7ef74cc898e'),
    name: 'Charlie',
    age: 35,
    hobbies: [ 'photography', 'traveling', 'swimming' ]
  },
  {
    _id: ObjectId('66811fd8d311d7ef74cc898f'),
    name: 'Diana',
    age: 28,
    hobbies: [ 'painting', 'running', 'yoga' ]
  },
  {
    _id: ObjectId('66812744d311d7ef74cc8990'),
    name: 'Tom',
    balance: 100,
    debt: 200
  },
  {
    _id: ObjectId('66812744d311d7ef74cc8991'),
    name: 'Kristian',
    balance: 20,
    debt: 0
  },
  { _id: ObjectId('6681293fd311d7ef74cc8992'), name: 'Shar' }
]

# Exists = check if the COLUMN exist not the VALUE itself
appdb> db.users.find({age: {$exists: true}})
[
  {
    _id: ObjectId('66811e1cd311d7ef74cc8989'),  
    name: 'Sally',
    age: 42,
    address: { street: 'North St' },
    hobbies: [ 'Playing', 'Dancing', 'Singing' ]
  },
  {
    _id: ObjectId('66811fd8d311d7ef74cc898c'),  
    name: 'Alice',
    age: 30,
    hobbies: [ 'reading', 'hiking', 'coding' ]
  },
  {
    _id: ObjectId('66811fd8d311d7ef74cc898d'),
    name: 'Bob',
    age: 25,
    hobbies: [ 'gaming', 'cooking', 'cycling' ]
  },
  {
    _id: ObjectId('66811fd8d311d7ef74cc898e'),
    name: 'Charlie',
    age: 35,
    hobbies: [ 'photography', 'traveling', 'swimming' ]
  },
  {
    _id: ObjectId('66811fd8d311d7ef74cc898f'),
    name: 'Diana',
    age: 28,
    hobbies: [ 'painting', 'running', 'yoga' ]
  }
]

# Greater Than Equal to && Less Than Equal to
appdb> db.users.find({age: {$gte: 25, $lte: 40}})
[
  {
    _id: ObjectId('66811fd8d311d7ef74cc898c'), 
    name: 'Alice',
    age: 30,
    hobbies: [ 'reading', 'hiking', 'coding' ] 
  },
  {
    _id: ObjectId('66811fd8d311d7ef74cc898d'), 
    name: 'Bob',
    age: 25,
    hobbies: [ 'gaming', 'cooking', 'cycling' ]
  },
  {
    _id: ObjectId('66811fd8d311d7ef74cc898e'), 
    name: 'Charlie',
    age: 35,
    hobbies: [ 'photography', 'traveling', 'swimming' ]
  },
  {
    _id: ObjectId('66811fd8d311d7ef74cc898f'),
    name: 'Diana',
    age: 28,
    hobbies: [ 'painting', 'running', 'yoga' ]
  }
]

# Greater Than Equal to && Less Than Equal to with specification where name is Bob
appdb> db.users.find({age: {$gte: 25, $lte: 40}, name: "Bob"})
[  
  {
    _id: ObjectId('66811fd8d311d7ef74cc898d'),
    name: 'Bob',
    age: 25,
    hobbies: [ 'gaming', 'cooking', 'cycling' ]
  }
]

# AND if both condition is true
appdb> db.users.find({$and: [{age: 30}, {name: "Alice"}] })
[  
  {
    _id: ObjectId('66811fd8d311d7ef74cc898c'),
    name: 'Alice',
    age: 30,
    hobbies: [ 'reading', 'hiking', 'coding' ]
  }
]

# OR if one condition is true
appdb>  db.users.find({$or: [{age: {$gte: 30}}, {name: "Alice"}] })
[  
  {
    _id: ObjectId('66811e1cd311d7ef74cc8989'),
    name: 'Sally',
    age: 42,
    address: { street: 'North St' },
    hobbies: [ 'Playing', 'Dancing', 'Singing' ]
  },
  {
    _id: ObjectId('66811fd8d311d7ef74cc898c'),
    name: 'Alice',
    age: 30,
    hobbies: [ 'reading', 'hiking', 'coding' ]
  },
  {
    _id: ObjectId('66811fd8d311d7ef74cc898e'),
    name: 'Charlie',
    age: 35,
    hobbies: [ 'photography', 'traveling', 'swimming' ]
  }
]

# NOT = specify not
appdb> db.users.find({age: {$not: {$lte: 30}}})
[
  { _id: ObjectId('66811ced8c7c908a0acc8988'), name: 'John' },
  { _id: ObjectId('66811d53d311d7ef74cc8988'), name: 'Vlahd' },
  {
    _id: ObjectId('66811e1cd311d7ef74cc8989'),
    name: 'Sally',
    age: 42,
    address: { street: 'North St' },
    hobbies: [ 'Playing', 'Dancing', 'Singing' ]
  },
  { _id: ObjectId('66811e7ed311d7ef74cc898a'), name: 'Jill' },
  { _id: ObjectId('66811e7ed311d7ef74cc898b'), name: 'Jack' },
  {
    _id: ObjectId('66811fd8d311d7ef74cc898e'),
    name: 'Charlie',
    age: 35,
    hobbies: [ 'photography', 'traveling', 'swimming' ]
  }
]

# Insert Many for new example
appdb> db.users.insertMany([{name: "Tom", balance: 100, debt: 200}, {name: "Kristian", balance: 20, debt: 0}])
{
  acknowledged: true,
  insertedIds: {
    '0': ObjectId('66812744d311d7ef74cc8990'),
    '1': ObjectId('66812744d311d7ef74cc8991')
  }
}

# Expression = use to compare columns (if debt is greater than balance)
appdb> db.users.find({$expr: {$gt: ["debt", "balance"]}})
[
  { _id: ObjectId('66811ced8c7c908a0acc8988'), name: 'John' },
  { _id: ObjectId('66811d53d311d7ef74cc8988'), name: 'Vlahd' },
  {
    _id: ObjectId('66811e1cd311d7ef74cc8989'),
    name: 'Sally',
    age: 42,
    address: { street: 'North St' },
    hobbies: [ 'Playing', 'Dancing', 'Singing' ]
  },
  { _id: ObjectId('66811e7ed311d7ef74cc898a'), name: 'Jill' },
  { _id: ObjectId('66811e7ed311d7ef74cc898b'), name: 'Jack' },
  {
    _id: ObjectId('66811fd8d311d7ef74cc898c'),
    name: 'Alice',
    age: 30,
    hobbies: [ 'reading', 'hiking', 'coding' ]
  },
  {
    _id: ObjectId('66811fd8d311d7ef74cc898d'),
    name: 'Bob',
    age: 25,
    hobbies: [ 'gaming', 'cooking', 'cycling' ]
  },
  {
    _id: ObjectId('66811fd8d311d7ef74cc898e'),
    name: 'Charlie',
    age: 35,
    hobbies: [ 'photography', 'traveling', 'swimming' ]
  },
  {
    _id: ObjectId('66811fd8d311d7ef74cc898f'),
    name: 'Diana',
    age: 28,
    hobbies: [ 'painting', 'running', 'yoga' ]
  },
  {
    _id: ObjectId('66812744d311d7ef74cc8990'),
    name: 'Tom',
    balance: 100,
    debt: 200
  },
  {
    _id: ObjectId('66812744d311d7ef74cc8991'),
    name: 'Kristian',
    balance: 20,
    debt: 0
  }
]

# Correct Way than above: use $ to access specific columns instead of values
appdb> db.users.find({$expr: {$gt: ["$debt", "$balance"]}})
[  
  {
    _id: ObjectId('66812744d311d7ef74cc8990'),
    name: 'Tom',
    balance: 100,
    debt: 200
  }
]

# Dot Notation to a nested column
appdb> db.users.find({"address.street": "North St"})
[  
  {
    _id: ObjectId('66811e1cd311d7ef74cc8989'),
    name: 'Sally',
    age: 42,
    address: { street: 'North St' },
    hobbies: [ 'Playing', 'Dancing', 'Singing' ]
  }
]

# Find One Document
appdb> db.users.findOne({age: {$lte: 40}})
{
  _id: ObjectId('66811fd8d311d7ef74cc898c'),
  name: 'Alice',
  age: 30,
  hobbies: [ 'reading', 'hiking', 'coding' ]
}

# Count Documents
appdb> db.users.countDocuments({age: {$lte: 40}})
4


# UPDATE COMMANDS

# Update One document always use $set
appdb>  db.users.updateOne({age: 42}, {$set: {age:40}})
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 0,
  modifiedCount: 0,
  upsertedCount: 0
}
appdb> db.users.findOne({age: 40})
{
  _id: ObjectId('66811e1cd311d7ef74cc8989'),  
  name: 'Sally',
  age: 40,
  address: { street: 'North St' },
  hobbies: [ 'Playing', 'Dancing', 'Singing' ]
}

# Update by _id is common
appdb> db.users.updateOne({_id: ObjectId("66811e1cd311d7ef74cc8989")}, {$set: {name: "Sally Mi"}})
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 1,
  upsertedCount: 0
}
appdb> db.users.find({_id: ObjectId("66811e1cd311d7ef74cc8989")})
[  
  {
    _id: ObjectId('66811e1cd311d7ef74cc8989'),
    name: 'Sally Mi',
    age: 40,
    address: { street: 'North St' },
    hobbies: [ 'Playing', 'Dancing', 'Singing' ]
  }
]

# Update one and increment the value using $inc
appdb> db.users.updateOne({_id: ObjectId("66811e1cd311d7ef74cc8989")}, {$inc: {age: 3}})
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 1,
  upsertedCount: 0
}
appdb> db.users.find({_id: ObjectId("66811e1cd311d7ef74cc8989")})
[
  {
    _id: ObjectId('66811e1cd311d7ef74cc8989'),  
    name: 'Sally Mi',
    age: 43,
    address: { street: 'North St' },
    hobbies: [ 'Playing', 'Dancing', 'Singing' ]
  }
]

# Rename a column uisng $rename
appdb> db.users.updateOne({_id: ObjectId("66811e1cd311d7ef74cc8989")}, {$rename: {name: "firstName"}})
{
  acknowledged: true,
  insertedId: null,  
  matchedCount: 1,   
  modifiedCount: 1,  
  upsertedCount: 0   
}
appdb> db.users.find({_id: ObjectId("66811e1cd311d7ef74cc8989")})
[
  {
    _id: ObjectId('66811e1cd311d7ef74cc8989'),   
    age: 43,
    address: { street: 'North St' },
    hobbies: [ 'Playing', 'Dancing', 'Singing' ],
    firstName: 'Sally Mi'
  }
]

# Unset a column using $unset = this means deleting the column
appdb> db.users.updateOne({_id: ObjectId("66811e1cd311d7ef74cc8989")}, {$unset: {age: ""}})
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 1,
  upsertedCount: 0
}
appdb> db.users.find({_id: ObjectId("66811e1cd311d7ef74cc8989")})
[  
  {
    _id: ObjectId('66811e1cd311d7ef74cc8989'),
    address: { street: 'North St' },
    hobbies: [ 'Playing', 'Dancing', 'Singing' ],
    firstName: 'Sally Mi'
  }
]

# Push a data to column which is an array 
appdb> db.users.updateOne({_id: ObjectId("66811e1cd311d7ef74cc8989")}, {$push: {hobbies: "Swimming"}})
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 1,
  upsertedCount: 0
}
appdb> db.users.find({_id: ObjectId("66811e1cd311d7ef74cc8989")})
[  
  {
    _id: ObjectId('66811e1cd311d7ef74cc8989'),
    address: { street: 'North St' },
    hobbies: [ 'Playing', 'Dancing', 'Singing', 'Swimming' ],
    firstName: 'Sally Mi'
  }
]

# Update Many = this selects all the data which has address and unsets their address or remove all address columns
appdb> db.users.updateMany({address: {$exists: true}}, {$unset: {address: ""}})
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 1,
  upsertedCount: 0
}
appdb> db.users.find()
[
  { _id: ObjectId('66811ced8c7c908a0acc8988'), name: 'John' },
  { _id: ObjectId('66811d53d311d7ef74cc8988'), name: 'Vlahd' },
  {
    _id: ObjectId('66811e1cd311d7ef74cc8989'),
    hobbies: [ 'Playing', 'Dancing', 'Singing', 'Swimming' ],
    firstName: 'Sally Mi'
  },
  { _id: ObjectId('66811e7ed311d7ef74cc898a'), name: 'Jill' },
  { _id: ObjectId('66811e7ed311d7ef74cc898b'), name: 'Jack' },
  {
    _id: ObjectId('66811fd8d311d7ef74cc898c'),
    name: 'Alice',
    age: 30,
    hobbies: [ 'reading', 'hiking', 'coding' ]
  },
  {
    _id: ObjectId('66811fd8d311d7ef74cc898d'),
    name: 'Bob',
    age: 25,
    hobbies: [ 'gaming', 'cooking', 'cycling' ]
  },
  {
    _id: ObjectId('66811fd8d311d7ef74cc898e'),
    name: 'Charlie',
    age: 35,
    hobbies: [ 'photography', 'traveling', 'swimming' ]
  },
  {
    _id: ObjectId('66811fd8d311d7ef74cc898f'),
    name: 'Diana',
    age: 28,
    hobbies: [ 'painting', 'running', 'yoga' ]
  },
  {
    _id: ObjectId('66812744d311d7ef74cc8990'),
    name: 'Tom',
    balance: 100,
    debt: 200
  },
  {
    _id: ObjectId('66812744d311d7ef74cc8991'),
    name: 'Kristian',
    balance: 20,
    debt: 0
  },
  { _id: ObjectId('6681293fd311d7ef74cc8992'), name: 'Shar' }
]

# Replace one = replace the whole document columns with the new columns and data provided
# replace where age equal 30 and replace them with name "John" - this delete all other columns related to the document
appdb> db.users.replaceOne({age: 30}, {name: "John"})
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 1,
  upsertedCount: 0
}
appdb> db.users.find({name: "John"})
[
  { _id: ObjectId('66811ced8c7c908a0acc8988'), name: 'John' },
  { _id: ObjectId('66811fd8d311d7ef74cc898c'), name: 'John' }
]

# DELETE COMMANDS

# DELETE ONE ex. delete record where name is = John
appdb> db.users.deleteOne({name: "John"})
{ acknowledged: true, deletedCount: 1 }

# DELETE MANY ex. delete record where age doesnt exist
appdb> db.users.deleteMany({age: {$exists: false}})
{ acknowledged: true, deletedCount: 8 }
appdb> db.users.find()
[
  {
    _id: ObjectId('66811fd8d311d7ef74cc898d'), 
    name: 'Bob',
    age: 25,
    hobbies: [ 'gaming', 'cooking', 'cycling' ]
  },
  {
    _id: ObjectId('66811fd8d311d7ef74cc898e'),
    name: 'Charlie',
    age: 35,
    hobbies: [ 'photography', 'traveling', 'swimming' ]
  },
  {
    _id: ObjectId('66811fd8d311d7ef74cc898f'),
    name: 'Diana',
    age: 28,
    hobbies: [ 'painting', 'running', 'yoga' ]
  }
]