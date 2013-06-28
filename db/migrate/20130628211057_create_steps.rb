class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.integer :quantity

      t.timestamps
    end
  end
end
