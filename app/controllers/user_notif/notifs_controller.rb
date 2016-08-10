# User notif module
module UserNotif
  # Handles requests about user notifs
  class NotifsController < ApplicationController
    before_action :set_notif
    before_action :authorized?, only: [:read]

    # Sets a user notif as read
    #
    # PUT /user_notif/:id
    def read
      set_notif
      raise ActiveRecord::RecordNotFound.new('Not Found') unless @notif
      raise ActiveRecord::RecordNotFound.new('Not Found') unless @notif
      @notif.update!(unread: false)
      render nothing: true
    end

    private

    # Sets the notif object required by the action
    def set_notif
      @notif = UserNotif::Notif.find(params[:id].to_i)
    end

    # Checks if the user has rights to perform the operation(s)
    def authorized?
      raise ActiveRecord::RecordNotFound.new('Not Found') unless @notif.user.id == current_user.id
    end
  end
end