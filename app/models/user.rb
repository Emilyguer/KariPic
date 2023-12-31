class User < ApplicationRecord
# Include default devise modules. Others available are:
# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
#Ralaciones
        has_many :photos

        mount_uploader :photo, PhotoUploader

        enum role: [:normal, :admin]
end
