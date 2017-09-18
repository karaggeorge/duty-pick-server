class Member < ApplicationRecord
  belongs_to :room
  belongs_to :user, optional: true

  has_many :picks

  validates_presence_of :name

  before_validation :set_default_name, if: -> { name.nil? && !user.nil? }

  private

  def set_default_name
    self.name ||= "#{user.first_name} #{user.last_name.first}."
  end
end
