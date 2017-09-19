class RenameDate < ActiveRecord::Migration[5.1]
  def self.up
    rename_table :dates, :duties
  end

  def self.down
    rename_table :duties, :dates
  end
end
