require "oauth2"
class OklinkOauth

	  ROOT_URL      = 'http://localtest.oklink.com'
      OAUTH2_KEY    = '08bcf461065696964861597d584f19b664d574dceadbd62099d220a229063426'
      OAUTH2_SECRET = '3240c0715fa19a963cc5a09d584b2d3622cb3351a8812e7c545cc0d2e2bc546e'
      CALLBACK_URL  = 'http://localhost:3000/oauth/callback'

      def initialize
          @client = OAuth2::Client.new(OAUTH2_KEY, OAUTH2_SECRET, :site => ROOT_URL, :authorize_url => '/oauth/authorize.do',
                  :token_url => '/oauth/token.do')
      end

      def authorize_url
          return @client.auth_code.authorize_url(:redirect_uri => CALLBACK_URL)
      end

      def token code
      	  @client.auth_code.get_token(code, :redirect_uri => CALLBACK_URL)
      end    
end