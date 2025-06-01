class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :require_login
  skip_before_action :require_login, if: :high_voltage_page?

  private

  def high_voltage_page?
    controller_path == 'high_voltage/pages'
  end

  def not_authenticated
    redirect_to login_path
  end
end
