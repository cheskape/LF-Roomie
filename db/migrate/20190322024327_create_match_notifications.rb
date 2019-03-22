class CreateMatchNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :match_notifications do |t|
      t.integer :user2
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
