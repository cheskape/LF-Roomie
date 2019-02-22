class CreateJoinTableUsersPreferences < ActiveRecord::Migration[5.2]
    def change
        create_join_table :users, :preferences do |t|
            t.index :user_id
            t.index :preference_id
        end
    end
end
