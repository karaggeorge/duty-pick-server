class User < ApplicationRecord
  has_secure_password

  has_many :rooms, foreign_key: :created_by
  has_many :members

  validates_presence_of :first_name, :last_name, :email, :password_digest, :title

  def member_rooms
    members.map do |member|
      member.room
    end
  end
end
