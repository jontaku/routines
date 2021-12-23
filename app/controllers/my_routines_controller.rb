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

  def edit
    my_routine = MyRoutine.find(params[:id])
    redirect_to root_path unless current_user.id == my_routine.user.id
    @my_routine = MyRoutine.find(params[:id])
  end

  def update
    @my_routine = MyRoutine.find(params[:id])
    if @my_routine.update(my_routine_params)
      redirect_to my_routine_path(@my_routine.id)
    else
      render :edit
    end
  end

  def destroy
    my_routine = MyRoutine.find(params[:id])
    my_routine.destroy
    redirect_to root_path
  end

  def show
    @my_routine = MyRoutine.find(params[:id])
  end

  private

  def my_routine_params
    params.require(:my_routine).permit(:routine_name, :my_routine_content, :reason, :effect).merge(user_id: current_user.id)
  end
end
