# This notification show the user profile completion percentage.
class UserFormProgressNotif < UserNotif::Notif
  # Fields used to calculate the user profile completion percentage
  FIELDS = %w(first_name last_name address birthday country postal_code avatar.present? city phone_number)

  # Whether or not the notif should send an email at its creation
  def email?
    false
  end

  # Returns the user profile completion percentage
  def get_percent
    target.completion_percentage
  end

  # Returns the template name that should be use to display the notif
  def template_name
    'user_form_progress_notif'
  end

  # Additional email options
  def email_options
    # TODO: Add this I18n key in your yml and add options or delete the method if you want to keep default values
    super({
              subject: I18n.t('notif.user_form_progress.subject')
          })
  end

  # Target class of the notification
  def target_class
    User
  end
end
