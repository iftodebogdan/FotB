class RegistrationsController < Devise::RegistrationsController
  def after_sign_up_path_for(resource)
    "/profiles/#{current_user.id}/edit"
  end
end
