module Phaxion
    include HTTMultiParty

    @@api_url = 'https://api.phaxio.com/v1'
    @@api_methods = [
      :send,
      :testReceive
    ]

    def self.url(api_method)
      "#{@@api_url}/#{api_method}"
    end

    def self.respond_to?(method)
      @@api_methods.include?(method.to_sym)
    end

    def self.method_missing(method, *args, &block)
      if method.to_sym == :fax
        method = :send
      end

      if not @@api_methods.include? method.to_sym
        return super
      end

      # puts "url: #{url(method)}"
      # puts "query: #{Hash[*args].merge({api_key: api_key, api_secret: api_secret})}"
      post(url(method), query: Hash[*args].merge({api_key: api_key, api_secret: api_secret}))
    end

    def self.configuration
      yield(self) if block_given?
    end

    module Configuration
    	attr_accessor :api_key, :api_secret
    end

    extend Configuration
end
