class GroupsController < ApplicationController
  before_action :authenticate_request!

  def create
    @usergroup = @current_user.groups.build(usergroup_params)
    if verify_admin && @usergroup.save
      render json: {user_group: @usergroup}, status: :ok
    else
      render json: { errors: usergroup.errors.full_messages }, status: :bad_request
    end
  end

  private
  def verify_admin
    @current_user&.admin.present?
  end

  def usergroup_params
    params.require(:group).permit(:name, :description, :isPublic)
  end
end
