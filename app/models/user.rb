class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :posts

  mount_uploader :avatar, AvatarUploader

  validates :name, :dob, :gender, presence: true

  # Devise parameter sanitizer
  # before_save :configure_permitted_parameters

  private

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :dob, :gender])
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:name, :dob, :gender])
  # end
end