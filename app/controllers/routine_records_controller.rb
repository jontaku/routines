class RoutineRecordsController < ApplicationController

  def new
  end

  def create
    @routine_record = RoutineRecord.new(routine_record_params)
    @routine_record.start_time = Time.now
    @routine_record.save
    redirect_to my_routines_path
  end

  private

  def routine_record_params
    params.permit(:start_time).merge(user_id: current_user.id, my_routine_id: params[:my_routine_id])
  end
end
