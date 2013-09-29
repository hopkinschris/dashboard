class AddUserRefToCalories < ActiveRecord::Migration
  def change
    add_reference :calories, :user, index: true
  end
end
