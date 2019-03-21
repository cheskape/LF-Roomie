class RemoveUser1FromMatches < ActiveRecord::Migration[5.2]
  def change
    remove_column :matches, :user1, :integer
  end
end
