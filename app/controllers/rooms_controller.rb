class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :update, :destroy]

  def index
    json_response(user_rooms)
  end

  def create
    @room = current_user.rooms.create!(room_params)
    json_response(@room, :created)
  end

  def show
    json_response(@room)
  end

  def update
    @room.update(room_params)
    head :no_content
  end

  def destroy
    @room.destroy
    head :no_content
  end

  private

  def room_params
    params.permit(:title)
  end

  def set_room
    @room = Room.find(params[:id])
  end

  def user_rooms
    {
      rooms: current_user.rooms,
      member_rooms: current_user.member_rooms
    }
  end
end
