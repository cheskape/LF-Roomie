class BasicInformation < ApplicationRecord
    belongs_to :user
    #mount the uploader
    mount_uploader :profile_pic, ProfilePicUploader
end
