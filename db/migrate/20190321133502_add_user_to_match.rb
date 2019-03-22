class AddUserToMatch < ActiveRecord::Migration[5.2]
  def change
    add_reference :matches, :user, foreign_key: true
  end
end
