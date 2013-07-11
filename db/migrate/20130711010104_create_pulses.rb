class CreatePulses < ActiveRecord::Migration
  def change
    create_table :pulses do |t|
      t.integer :rate

      t.timestamps
    end
  end
end
