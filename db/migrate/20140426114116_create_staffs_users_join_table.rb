class CreateStaffsUsersJoinTable < ActiveRecord::Migration
  def change
    create_join_table :stuffs, :users do |t|
      # t.index [:staff_id, :user_id]
      # t.index [:user_id, :staff_id]
    end
  end
end
