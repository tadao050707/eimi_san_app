require "csv"

CSV.foreach('db/sample_list.csv', headers: true) do |row|
  Dog.create(
    name: row[0],
    size: row[1],
    vehicle: row[2],
    cleaning: row[3],
    active: row[4],
    exercise: row[5],
    home: row[6],
    house: row[7],
    image_url: row[8]
  )
end