class CreateSleeps < ActiveRecord::Migration
  def change
    create_table :sleeps do |t|
      t.integer :light_sleep
      t.integer :deep_sleep
      t.integer :quality

      t.timestamps
    end
  end
end
