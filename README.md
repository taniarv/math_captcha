# Math_captcha

Math_captcha helps you generating localized captchas for forms. It presents a simple math operation that should be performed by user in order to ensure she is a human. 

This Gem is strongly inspired in visualcaptcha gem (https://github.com/kimenye/visualcaptcha)

## Installation

Add this line to your application's Gemfile:

    gem 'math_captcha'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install math_captcha

## Setup

After installation, follow these simple steps to setup the plugin. The setup will depend on the version of rails your application is using.

    $ rails generate math_captcha

## Usage

###Controller Based

In the view file within the form tags add this code

    <%= show_math_captcha %>

Add the following line in the file "app/controllers/application.rb"

    ApplicationController < ActionController::Base
        include MathCaptcha::ControllerHelpers
    end

### I18n

math_captcha currently supports I18n for English (en), Spanish (es) and Basque (eu). 
It defaults to I18n.locale or Spanish.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
