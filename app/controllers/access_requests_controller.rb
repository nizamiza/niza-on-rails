class AccessRequestsController < ApplicationController
  def create
    kind = params[:kind]
    name = params[:name]
    email = params[:email]
    message = params[:message]

    if kind.empty? or name.empty? or email.empty?
      raise ActiveRecord::RecordInvalid
    end

    begin
      access_request = AccessRequest.create!(
        kind: kind.to_sym,
        name: name,
        email: email,
        message: message,
      )

      CvRequestsMailer.request_access(access_request, request.base_url).deliver_now
      flash[:success] = t("cv.request_form.success")
    rescue => e
      if Rails.env.development?
        raise e
      end

      puts "Failed to send CV request email: #{e}"
      flash[:alert] = t("cv.request_form.error")
    ensure
      redirect_to request.referrer
    end
  end
end
