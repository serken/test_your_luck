class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  rescue_from Exception do |exception|
    redirect_to root_path, flash: { danger: exception }
  end

end
