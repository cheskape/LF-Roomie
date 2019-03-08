class CreateNameAndProfilePictures < ActiveRecord::Migration[5.2]
  def change
    create_table :name_and_profile_pictures do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.string :profile_picture

      t.timestamps
    end
  end
end
