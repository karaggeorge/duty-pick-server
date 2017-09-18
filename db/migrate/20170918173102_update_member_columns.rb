class UpdateMemberColumns < ActiveRecord::Migration[5.1]
  def change
    add_reference :members, :user, index: true
  end
end
