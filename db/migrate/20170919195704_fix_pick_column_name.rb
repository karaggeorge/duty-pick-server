class FixPickColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :picks, :date_id, :duty_id
  end
end
