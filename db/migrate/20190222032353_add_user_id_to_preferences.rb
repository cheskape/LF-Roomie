class AddUserIdToPreferences < ActiveRecord::Migration[5.2]
  def change
      add_column :preferences, :user_id, :integer
  end
end
