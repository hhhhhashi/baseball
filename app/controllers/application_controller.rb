class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(Admin)
        admin_members_path
    else
        root_path
    end
  end

  def after_sign_out_path_for(resource)
    root_path
  end



end
