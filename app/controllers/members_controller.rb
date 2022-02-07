class MembersController < ApplicationController
  before_action :authenticate_request!
  
  def create
    @member = Member.new(member_params) if @current_user&.admin.present?
    if @member.save
      render json: {status: 'User Joined the Group successfully'}, status: :created
    else
      render json: { errors: @member.errors.full_messages }, status: :bad_request
    end
  end

  def destroy
    @member = Member.find_by(user_id: params[:user_id], group_id: params[:group_id])
    @member.destroy
    render json: {status: "You left the Group."}, status: :ok
  end

  private
  def member_params
    params.require(:member).permit(:group_id, :user_id)
  end
end
