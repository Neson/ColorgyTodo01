class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def colorgy
    auth = request.env['omniauth.auth']

    @user = User.from_colorgy(auth, current_user)

    if @user.persisted?
      set_flash_message(:notice, :success, kind: 'Colorgy') if is_navigational_format?
      sign_in_and_redirect @user, event: :authentication
    else
      redirect_to root_path
    end
  end

  private

  def new_session_path(_)
    root_path
  end
end
