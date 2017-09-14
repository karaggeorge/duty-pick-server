class MembersController < ApplicationController
  before_action :set_room
  before_action :set_member, only: [:show, :update, :destroy]

  def index
    json_response(@room.members)
  end

  def show
    json_response(@member)
  end

  def create
    @member = @room.members.create!(member_params)
    json_response(@member, :created)
  end

  def update
    @member.update(member_params)
    head :no_content
  end

  def destroy
    @member.destroy
    head :no_content
  end

  private

  def member_params
    params.permit(:name, :order)
  end

  def set_room
    @room = Room.find(params[:room_id])
  end

  def set_member
    @member = @room.members.find_by!(id: params[:id]) if @room
  end
end
