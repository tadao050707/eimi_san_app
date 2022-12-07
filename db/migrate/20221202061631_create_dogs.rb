class CreateDogs < ActiveRecord::Migration[6.1]
  def change
    create_table :dogs do |t|
      t.string :name, null: false
      t.integer :size, null: false
      t.integer :color, null: false
      t.integer :vehicle, null: false
      t.integer :cleaning, null: false
      t.integer :active, null: false
      t.integer :exercise, null: false
      t.integer :home, null: false
      t.integer :house, null: false
      t.string :image_url, null: false

      t.timestamps
    end
  end
end
