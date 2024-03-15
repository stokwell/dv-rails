class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :user_inputs
  has_many :user_translations

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    unless user
      password = Devise.friendly_token[0,20]
      user = User.create!(
        email: data['email'],
        password: password,
        password_confirmation: password
      )
    end
    user
  end

  private

  def full_name
    firt_name + " " + last_name
  end
end
