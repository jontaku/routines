class RoutinesController < ApplicationController
  def index
    @routines = Routine.all
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
