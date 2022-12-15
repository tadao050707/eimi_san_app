require "csv"

CSV.foreach('db/sample_list2.csv', headers: true) do |row|
  Dog.create(
    name:      row[0,],
    size:      row[1].to_i,
    vehicle:   row[2].to_i,
    cleaning:  row[3].to_i,
    active:    row[4].to_i,
    exercise:  row[5].to_i,
    home:      row[6].to_i,
    house:     row[7].to_i,
    image_url: row[8]
  )
end

users = [
  User.create(
    name: "anndou", 
    email: "anndou@sample.com", 
    password: "anndou"
  ),
  User.create(
    name: "enndou", 
    email: "enndou@sample.com",
    password: "enndou"
  ),
  User.create(
    name: "kikuti", 
    email: "kikuti@sample.com", 
    password: "kikuti"
  ),
  User.create(
    name: "saitou", 
    email: "konndo@sample.com", 
    password: "saitou"
  ),
  User.create(
    name: "saitou", 
    email: "saitou@sample.com", 
    password: "saitou"
  )


UserChoice.create!([
  {
    vehicle: 0,
    cleaning: 0,
    active: 0,
    exercise: 0,
    home: 0,
    house: 0,
    user_id: 1
  },
  {
    vehicle: 1,
    cleaning: 1,
    active: 0,
    exercise: 0,
    home: 0,
    house: 0,
    user_id: 2
  },
  {
    vehicle: 1,
    cleaning: 1,
    active: 1,
    exercise: 1,
    home: 0,
    house: 0,
    user_id: 3
  },
  {
    vehicle: 1,
    cleaning: 1,
    active: 1,
    exercise: 1,
    home: 1,
    house: 0,
    user_id: 4
  },
  {
    vehicle: 1,
    cleaning: 1,
    active: 1,
    exercise: 1,
    home: 1,
    house: 1,
    user_id: 5
  },
])

Favorite.create!([
  {user_id: 1, dog_id: 1},
  {user_id: 2, dog_id: 1},
  {user_id: 3, dog_id: 1},
  {user_id: 4, dog_id: 1},
  {user_id: 5, dog_id: 1},
])