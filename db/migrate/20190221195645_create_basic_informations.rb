class CreateBasicInformations < ActiveRecord::Migration[5.2]
  def change
    create_table :basic_informations do |t|
      t.integer :user_id
      t.string :firstname
      t.string :lastname
      t.text :profile_pic
      t.string :birthday
      t.text :address
      t.string :sex

      t.timestamps
    end
  end
end
