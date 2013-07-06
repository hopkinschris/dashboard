class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :location
      t.integer :age
      t.string :gender
      t.string :height

      t.timestamps
    end
  end
end
