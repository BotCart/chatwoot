class Api::V1::ProfilesController < Api::BaseController
  before_action :set_user

  def show
    render partial: 'api/v1/models/user.json.jbuilder', locals: { resource: @user }
  end

  def update
    @user.update!(profile_params)
  end

  private

  def set_user
    @user = current_user
  end

  def profile_params
    params.require(:profile).permit(
      :availability,
      :avatar,
      :display_name,
      :email,
      :name,
      :password_confirmation,
      :password
    )
  end
end
