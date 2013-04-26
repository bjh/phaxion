require 'active_support'
require 'active_support/core_ext/string'

module Phaxion
    include HTTMultiParty

    @@api_url = 'https://api.phaxio.com/v1'

    def self.url(api_method)
      "#{@@api_url}/#{api_method.to_s}"
    end

    def self.renamer(method)
      method.to_s.camelize(:lower)
    end

    def self.method_missing(method, *args, &block)
      if method.to_sym == :fax
        method = :send
      end

      method = renamer(method)
      post(url(method), query: Hash[*args].merge({api_key: api_key, api_secret: api_secret}))
    end

    def self.direct(method, *args)
      post(url(renamer(method)), query: Hash[*args].merge({api_key: api_key, api_secret: api_secret}))
    end

    def self.configuration
      yield(self) if block_given?
    end

    module Configuration
      attr_accessor :api_key, :api_secret
    end

    extend Configuration
end
