class API::DatesController < ApplicationController
  before_action :set_room
  before_action :set_date, only: [:show, :update, :destroy]

  def index
    json_response(@room.dates)
  end

  def show
    json_response(@date)
  end

  def create
    @date = @room.dates.create!(date_params)
    json_response(@date, :created)
  end

  def update
    @date.update(date_params)
    head :no_content
  end

  def destroy
    @date.destroy
    head :no_content
  end

  private

  def date_params
    params.permit(:date)
  end

  def set_room
    @room = Room.find(params[:room_id])
  end

  def set_date
    @date = @room.dates.find_by!(id: params[:id]) if @room
  end
end
