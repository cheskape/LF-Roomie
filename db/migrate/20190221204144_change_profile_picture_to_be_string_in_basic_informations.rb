class ChangeProfilePictureToBeStringInBasicInformations < ActiveRecord::Migration[5.2]
    def change
        change_column :basic_informations, :profile_pic, :string
    end
end
