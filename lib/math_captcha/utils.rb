require 'digest/sha1'

module MathCaptcha #:nodoc
  module Utils #:nodoc
    def self.generate_key(*args)
      args << 'math-captcha'
      Digest::SHA1.hexdigest(args.join)
    end
  end
end

