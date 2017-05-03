class User::RegistrationsController < Devise::RegistrationsController
  
  def type_user
    
  end

  protected

  def after_inactive_sign_up_path_for(resource)
    new_user_session_url # Or :prefix_to_your_route
  end
end