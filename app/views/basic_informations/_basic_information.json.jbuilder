json.extract! basic_information, :id, :firstname, :lastname, :profile_pic, :birthday, :address, :sex, :created_at, :updated_at
json.url basic_information_url(basic_information, format: :json)
