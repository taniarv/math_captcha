module MathCaptcha
  module ViewHelper

    def show_math_captcha(options = {})
      options = sanitize_options(options)

      #key = visual_captcha_key('captcha')
      # captcha = VisualCaptcha::Captcha.new(number)
      # challenge = captcha.build
      captcha = MathCaptcha::Captcha.new
      challenge = captcha.build_challenge

      session[:captcha] = challenge.encrypted

      render :partial => 'math_captcha/math_captcha', :locals => { :captcha_options =>  options, :challenge => challenge }
    end

    private

      def sanitize_options(options)
        options
      end

      # not used
      # def math_captcha_key(key_name = nil)
      #   if key_name.nil?
      #     session[:captcha] ||= MathCaptcha::Utils.generate_key(session[:id].to_s, 'captcha')
      #   else
      #     MathCaptcha::Utils.generate_key(session[:id].to_s, key_name)
      #   end
      # end
  end
end