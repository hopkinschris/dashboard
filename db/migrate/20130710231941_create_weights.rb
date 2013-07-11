class CreateWeights < ActiveRecord::Migration
  def change
    create_table :weights do |t|
      t.float :quantity

      t.timestamps
    end
  end
end
