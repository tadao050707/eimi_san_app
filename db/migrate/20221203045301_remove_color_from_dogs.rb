class RemoveColorFromDogs < ActiveRecord::Migration[6.1]
  def change
    remove_column :dogs, :color, :integer
  end
end
