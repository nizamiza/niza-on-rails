class AccessRequestController < ApplicationController
  def create
    kind = params[:kind]
    name = params[:name]
    email = params[:email]
    message = params[:message]

    if kind.nil? or name.nil? or email.nil?
      raise ActiveRecord::RecordInvalid
    end

    requester = { name: name, email: email, message: message }
    access_request = AccessRequest.create(kind: kind, requester: requester)

    if access_request.nil?
      raise ActiveRecord::RecordInvalid
    end

    CvRequestMailer.request_access(access_request).deliver_now

    flash[:notice] = "Your request has been sent."
  end
end
