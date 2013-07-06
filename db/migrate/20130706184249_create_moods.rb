class CreateMoods < ActiveRecord::Migration
  def change
    create_table :moods do |t|
      t.string  :title
      t.integer :sub_type

      t.timestamps
    end
  end
end
