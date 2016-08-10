# Helpers relative to home
module HomeHelper
  # Tell devise to use this resource for the form (landing page)
  def resource
    @user
  end

  # Tell devise the resource name
  def resource_name
    :user
  end

  # Attempt to find the mapped route for devise
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
