class SessionsController < Clearance::SessionsController

  def create
    user = User.find_by(screenname: params[:session][:email])
    params[:session][:email] = user.email if user
    super
  end
end
