class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
    # Log the user in and redirect to the user's show page.
      # flash[:success] = 'Invalid email/password combination'
      log_in user
      remember user
      redirect_to user
    else
    # Create an error message.
      flash[:danger] = 'Invalid email/password combination'
      render :new, status: 422
    end
  end
  def destroy
   log_out if logged_in?
 
   redirect_to root_url
  end
end