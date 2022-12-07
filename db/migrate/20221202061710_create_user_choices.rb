class CreateUserChoices < ActiveRecord::Migration[6.1]
  def change
    create_table :user_choices do |t|
      t.integer :vehicle, null: false
      t.integer :cleaning, null: false
      t.integer :active, null: false
      t.integer :exercise, null: false
      t.integer :home, null: false
      t.integer :house, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
