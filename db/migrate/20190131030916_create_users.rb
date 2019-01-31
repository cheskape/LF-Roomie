class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :mobile_number

      t.timestamps
    end
    add_index :users, :username, unique: true
    add_index :users, :mobile_number, unique: true
  end
end
