# This file should contain all the record creation needed to seed the database with it k= s default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.create(name:"Valter")
user2 = User.create(name: "Van")
task = Task.create(title:"criar o arquivo seed")
session_vote = SessionVote.create
session_vote.tasks = [task, Task.create(title:"hello darkness my old friend")]
session_vote.users = [user1, user2]
vote = Vote.create(vote:4, session_vote:session_vote, task:task, user:user1)
vote = Vote.create(vote:8, session_vote:session_vote, task:task, user:user2)
