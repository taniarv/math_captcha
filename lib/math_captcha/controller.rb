module MathCaptcha
  module ControllerHelpers
    def math_captcha_valid?
      return true if Rails.env.test?
      if params["captcha-value"]
        session_challenge = session[:captcha]
        crypted_challenge = MathCaptcha::Utils.generate_key(params['captcha-value'])
        result = crypted_challenge === session_challenge
        pr "result #{result}"
        return result
      else
        return false
      end
    end
  end
end