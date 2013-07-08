class CreateCalories < ActiveRecord::Migration
  def change
    create_table :calories do |t|
      t.integer :quantity

      t.timestamps
    end
  end
end
