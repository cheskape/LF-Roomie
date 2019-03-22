class CreateSwipes < ActiveRecord::Migration[5.2]
  def change
    create_table :swipes do |t|
      t.integer :swipee
      t.boolean :direction
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
