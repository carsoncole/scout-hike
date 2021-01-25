class UsersController < Clearance::UsersController
  before_action :require_login, except: %i[new create]

  def create
    super
  end

  def user_params
    params.require(:user).permit(:email, :password, :screenname, :unit_id)
  end
end
