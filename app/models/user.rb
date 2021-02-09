class User < ApplicationRecord
  has_and_belongs_to_many :roles
  has_many :clients

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
