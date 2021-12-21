class CreateMyRoutines < ActiveRecord::Migration[6.0]
  def change
    create_table :my_routines do |t|

      t.string :routine_name, null: false
      t.text :my_routine_content
      t.text :reason
      t.text :effect
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
