class AddRemoveProfilePicToBasicInformations < ActiveRecord::Migration[5.2]
  def change
    add_column :basic_informations, :remove_profile_pic, :string
  end
end
