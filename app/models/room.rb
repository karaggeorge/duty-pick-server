class Room < ApplicationRecord
  has_many :members, dependent: :destroy
  belongs_to :moderator, class_name: "User"
  belongs_to :picking_member, class_name: "Member", optional: true

  validates_presence_of :title, :created_by

  before_validation :set_default_moderator

  private

  def set_default_moderator
    self.moderator ||= User.find(created_by)
  end
end
