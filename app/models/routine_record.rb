class RoutineRecord < ApplicationRecord
  belongs_to :my_routine
  belongs_to :user
end
