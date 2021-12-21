class MyRoutine < ApplicationRecord
  belongs_to :user
  has_many :routine_records
end
