class SessionsController < ApplicationController
  protected
  def after_sign_out_path_for(resource)
   new_user_session_path
  end
end
