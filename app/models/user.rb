class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  validates :username, presence: :true, uniqueness: {case_sensitive: false}
  validates :mobile_number, presence: :true, uniqueness: {case_sensitive: false}

  #username may not use '@' symbol
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
  #mobile number format of 09XXXXXXXXX
  validates_format_of :mobile_number, with: /^(09\d{9,9})$/, :multiline => true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attr_writer :login

  #access username, email, and mobile number from login
  def login
    @login || self.username || self.email || self.mobile_number
  end

  def self.find_for_database_authentication(warden_conditions)
    #duplicate warden conditions
    conditions = warden_conditions.dup
    #if the deleted login value is equal to login
    if login = conditions.delete(:login)
      #look for record and return the first record (username and email are case insensitive so use the lower function to make them all lowercase for checking)
      where(conditions).where(["lower(username) = lower(:value) OR mobile_number = :value OR lower(email) = lower(:value)", { :value => login }]).first
    #check if the hash has a username, email, or mobile number key
    elsif conditions.has_key?(:username) || conditions.has_key?(:email) || conditions.has_key?(:mobile_number)
      #get the first record in conditions and return its value
      where(conditions.to_h).first
    end
  end
end
