class Date < ApplicationRecord
  belongs_to :room
  has_many :picks

  validates_presence_of :date
end
