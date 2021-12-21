class CreateRoutineRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :routine_records do |t|

      t.references :user, null: false, foreign_key: true
      t.references :my_routine, null: false, foreign_key: true
      t.datetime :start_time, null: false
      t.timestamps
    end
  end
end
