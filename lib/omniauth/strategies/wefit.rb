require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class WeFit < ::OmniAuth::Strategies::OAuth2
      option :name, 'wefit'

      option :client_options, {
        site: 'https://auth.wefit.io',
        authorize_url: 'https://auth.wefit.io/oauth/authorize',
        token_url: 'https://auth.wefit.iot/oauth/token'
      }

      uid { raw_info['id'] }

      info do
        prune!({
          name: raw_info['name'],
          email: raw_info['email']
        })
      end

      extra do
        hash = {}
        hash['raw_info'] = raw_info unless skip_info?
        prune! hash
      end

      def raw_info
        @raw_info ||= access_token.get('me').parsed || {}
      end

      protected

      def prune!(hash)
        hash.delete_if do |_, value|
          prune!(value) if value.is_a?(Hash)
          value.nil? || (value.respond_to?(:empty?) && value.empty?)
        end
      end
    end
  end
end