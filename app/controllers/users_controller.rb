class UsersController < Clearance::UsersController
  before_action :require_login, except: %i[new create]

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to edit_user_path(notice: 'Successfully updated User')
    else
      puts @user.errors.full_messages
      render :edit
    end
  end

  def create
    super
  end

  def user_params
    params.require(:user).permit(:email, :password, :screenname, :unit_id)
  end
end
