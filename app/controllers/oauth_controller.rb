class OauthController < ApplicationController
  def callback
  		code = params[:code]
  		require "#{Rails.root}/lib/oklink_oauth" 
        oauth = OklinkOauth.new
        token = oauth.token code
        # render text: token
  end
end
