class ApplicationController < ActionController::Base
  around_action :switch_locale
  before_action :set_env_vars

  def set_env_vars
    @cv_requests_disabled = ENV["CV_REQUESTS_DISABLED"] == "true"
  end

  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  def default_url_options
    { locale: I18n.locale }
  end
end
