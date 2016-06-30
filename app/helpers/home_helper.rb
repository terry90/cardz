module HomeHelper
  def resource # Tell devise to use this resource for the form (landing page)
    @user
  end

  def resource_name
    :user
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
