class UserFormProgressNotif < UserNotif::Notif
  FIELDS = %w(first_name last_name address birthday country postal_code avatar.present? city phone_number)

  def email?
    false
  end

  def get_percent
    target.completion_percentage
  end

  def template_name
    'user_form_progress_notif'
  end

  def email_options
    # TODO: Add this I18n key in your yml and add options or delete the method if you want to keep default values
    super({
              subject: I18n.t('notif.user_form_progress.subject')
          })
  end

  def target_class
    User
  end
end
