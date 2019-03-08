class CreateJoinTableUsersBasicInformations < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :basic_informations do |t|
      t.index :user_id
      t.index :basic_information_id
    end
  end
end
