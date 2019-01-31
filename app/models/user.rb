class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  #require username presense, uniqueness, and case insensitivity
  validates :username, presence: :true, uniqueness: {case_sensitive: false}
  validates :mobile_number, presence: :true, uniqueness: {case_sensitive: false}

  #username may not use '@' symbol
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attr_writer :login

  #access username, email, and mobile number from login
  def login
    @login || self.username || self.email || self.mobile_number
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["username = :value OR mobile_number = :value OR lower(email) = lower(:value)", { :value => login }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email) || conditions.has_key?(:mobile_number)
      where(conditions.to_h).first
    end
  end
end
