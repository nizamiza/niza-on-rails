class AccessRequestsController < ApplicationController
  def create
    kind = params[:kind]
    name = params[:name]
    email = params[:email]
    message = params[:message]

    if kind.nil? or name.nil? or email.nil?
      raise ActiveRecord::RecordInvalid
    end

    access_request = AccessRequest.new(
      kind: kind.to_sym,
      name: name,
      email: email,
      message: message,
    )

    unless access_request.save
      if Rails.env.development?
        raise access_request.errors.full_messages.join(", ")
      end

      raise ActiveRecord::RecordInvalid
    end

    begin
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
