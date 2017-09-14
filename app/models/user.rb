class User < ApplicationRecord
  has_secure_password

  has_many :rooms, foreign_key: :created_by
  validates_presence_of :first_name, :last_name, :email, :password_digest, :title
end
