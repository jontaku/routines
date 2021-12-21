class MyRoutinesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create]

  def index
    @my_routines = MyRoutine.where(user_id: current_user.id)
    @routine_records = RoutineRecord.where(user_id: current_user.id)
  end

  def new
    @my_routine = MyRoutine.new
  end

  def create
    @my_routine = MyRoutine.new(my_routine_params)
    if @my_routine.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def my_routine_params
    params.require(:my_routine).permit(:routine_name, :my_routine_content, :reason, :effect).merge(user_id: current_user.id)
  end
end
