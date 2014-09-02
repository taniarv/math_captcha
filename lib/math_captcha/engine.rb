require 'rails'
require 'math_captcha'

module MathCaptcha
  class Engine < ::Rails::Engine
    config.after_initialize do
      ActionView::Base.send(:include, MathCaptcha::ViewHelper)
    end
  end
end