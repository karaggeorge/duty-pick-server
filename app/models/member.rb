class Member < ApplicationRecord
  belongs_to :room

  validates_presence_of :name
end
