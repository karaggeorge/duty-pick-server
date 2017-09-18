class CreateDates < ActiveRecord::Migration[5.1]
  def change
    create_table :dates do |t|
      t.date :date
      t.references :room, foreign_key: true
      t.integer :slots

      t.timestamps
    end
  end
end
