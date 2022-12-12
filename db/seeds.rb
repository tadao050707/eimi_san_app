require "csv"

CSV.foreach('db/sample_list2.csv', headers: true) do |row|
  Dog.create(
    name:      row[0],
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