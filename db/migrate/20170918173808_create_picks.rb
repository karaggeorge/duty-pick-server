class CreatePicks < ActiveRecord::Migration[5.1]
  def change
    create_table :picks do |t|
      t.references :member, foreign_key: true
      t.references :date, foreign_key: true
      t.boolean :confirmed, default: false

      t.timestamps
    end
  end
end
