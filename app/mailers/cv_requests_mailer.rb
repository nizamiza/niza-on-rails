class CvRequestsMailer < ApplicationMailer
  default from: "cv-requests@niza.cz"

  def request_access(access_request, base_url)
    @access_request = access_request

    set_request_info(access_request)

    @subject = "New CV Request From #{@requester_name}"
    @approval_url = "#{base_url}/cv/#{access_request.id}/approve/#{access_request.approval_token}"
    @base_url = base_url

    mail(to: ENV["CV_REQUESTS_RECIPIENT"], subject: @subject)
  end

  def approve_access(access_request, base_url)
    @access_request = access_request

    set_request_info(access_request)

    @subject = t("cv.approval.email.subject")
    @access_url = "#{base_url}/cv/#{access_request.access_token.token}"
    @base_url = base_url

    mail(to: access_request.email, subject: @subject)
  end

  private

  def set_request_info(access_request)
    @requester_name = access_request.name
    @requester_email = access_request.email
    @message = access_request.message
  end
end
