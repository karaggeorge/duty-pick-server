class AddColumns < ActiveRecord::Migration[5.1]
  def change
    add_column :rooms, :active, :boolean, default: false
    add_reference :rooms, :picking_member, references: :members, index: true
    add_reference :rooms, :moderator, references: :users, index: true
  end
end
