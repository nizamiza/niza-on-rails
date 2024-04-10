class ErrorsController < ApplicationController
  before_action :set_locale_from_uri

  def not_found
  end

  def internal_server_error
  end

  private

  def set_locale_from_uri
    locale = request.env["REQUEST_URI"].split("/")[1]

    if locale.present? and I18n.available_locales.include?(locale.to_sym)
      I18n.locale = locale
    end
  end
end
