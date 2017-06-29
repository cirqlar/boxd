class RegistrationsController < Devise::RegistrationsController
 
  def destroy
    resource.soft_delete
    Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
    set_flash_message :notice, :destroyed if is_flashing_format?
    yield resource if block_given?
    respond_with_navigational(resource){ redirect_to after_sign_out_path_for(resource_name) }
    render 'destroyed'
  end

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :current_password)
  end

  protected
  def after_inactive_sign_up_path_for(resource)
    new_user_confirmation_path
  end

  protected
  def after_update_path_for(resource)
    dashboard_path
  end



end
