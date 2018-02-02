# This file should contain all the record creation needed to seed the database with it k= s default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
def create_user name
  User.create(name:name, password: '123456', email: "#{name}@gmail.com")
end

create_user 'livia'
create_user 'jatoba'
create_user 'xandi'
create_user 'gabe'
create_user 'berta'
create_user 'maris'
create_user 'jatoba'
create_user 'lobao'
create_user 'diego'
create_user 'rachid'
create_user 'valter'
create_user 'arthur'
create_user 'danilo'
create_user 'anderson'
create_user 'rominie'
create_user 'lucas'
create_user 'julio'
create_user 'denis'
