class User < ActiveRecord::Base

  has_many :production_records, inverse_of: :user

  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :rememberable, :trackable, :validatable
end
