class CvRequestMailer < ApplicationMailer
  default from: "cv-request@niza.cz"

  def request_access(access_request)
    @access_request = access_request

    requester = @access_request.requester
    subject = "New CV request from #{requester[:name]}"

    @requester_name = requester[:name]
    @requester_email = requester[:email]
    @message = requester[:message]

    mail(to: ENV["CV_REQUEST_RECIPIENT"], subject: subject)
  end
end
