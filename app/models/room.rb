class Room < ApplicationRecord
  has_many :members, dependent: :destroy

  validates_presence_of :title, :created_by
end
