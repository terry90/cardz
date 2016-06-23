class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, prepend: true # Think about replacing this by :null_session (for prod) (Keep prepend (see devise readme rails 5))
end
