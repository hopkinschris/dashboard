class AddUserRefToSteps < ActiveRecord::Migration
  def change
    add_reference :steps, :user, index: true
  end
end
