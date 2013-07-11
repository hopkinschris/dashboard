class CreateWeights < ActiveRecord::Migration
  def change
    create_table :weights do |t|
      t.decimal :quantity, precision: 4, scale: 1

      t.timestamps
    end
  end
end
