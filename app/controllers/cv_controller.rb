class CvController < ApplicationController
  def index
    @requests_disabled = ENV["CV_REQUESTS_DISABLED"] == "true"
  end

  def show
    token = params[:token]

    if token.empty?
      raise ActiveRecord::RecordNotFound
    end

    db_token = AccessToken.find_by(token: token)

    if db_token.nil? or not db_token.cv? or db_token.expires_at < Time.now
      raise ActiveRecord::RecordNotFound
    end

    contact_info = ContactInfo.first

    if contact_info.nil?
      raise ActiveRecord::RecordNotFound
    end

    @token = token
    @contact_info = contact_info

    # delete token and access request
    db_token.destroy
  end

  def approve
    id = params[:id]
    token = params[:token]

    if id.empty? or token.empty?
      raise ActiveRecord::RecordNotFound
    end

    access_request = AccessRequest.find_by(id: id)

    if access_request.nil? or not access_request.cv? or access_request.approval_token != token
      raise ActiveRecord::RecordNotFound
    end

    begin
      access_token = AccessToken.create!(kind: :cv, expires_at: 7.day.from_now)

      access_request.update!(access_token: access_token)
      CvRequestsMailer.approve_access(access_request, request.base_url).deliver_now

      flash[:success] = t("cv.approval.success")
    rescue => e
      if Rails.env.development?
        raise e
      end

      flash[:alert] = t("cv.approval.error")
    ensure
      redirect_to root_path
    end
  end
end
