class AddUserRefToPulses < ActiveRecord::Migration
  def change
    add_reference :pulses, :user, index: true
  end
end
