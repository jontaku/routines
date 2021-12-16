class CreateRoutines < ActiveRecord::Migration[6.0]
  def change
    create_table :routines do |t|

      t.references :user, null: false, foreign_key: true
      t.string :title, null: false
      t.string :continued_time, null: false
      t.text :introduction, null: false
      t.text :result, null: false
      t.timestamps
    end
  end
end