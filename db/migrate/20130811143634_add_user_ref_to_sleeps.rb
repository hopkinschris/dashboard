class AddUserRefToSleeps < ActiveRecord::Migration
  def change
    add_reference :sleeps, :user, index: true
  end
end
