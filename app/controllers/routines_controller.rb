class RoutinesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @routines = Routine.all
    if user_signed_in?
      @my_routines = MyRoutine.where(user_id: current_user.id)
    end
  end

  def new
    @routine = Routine.new
  end

  def create
    @routine = Routine.new(routine_params)
    if @routine.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def routine_params
    params.require(:routine).permit(:title, :continued_time, :introduction, :result).merge(user_id: current_user.id)
  end
end
