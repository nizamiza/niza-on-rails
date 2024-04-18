class CvController < ApplicationController
  def show
    token = params[:token]

    if token.empty?
      raise ActiveRecord::RecordNotFound
    end

    db_token = AccessToken.find_by(token: token)

    if db_token.nil? or not db_token.cv? or db_token.expires_at < Time.now
      raise ActiveRecord::RecordNotFound
    end

    @token = token

    # invalidate token
    db_token.update(expires_at: Time.now)
  end
end
