# encoding: UTF-8
require "math_captcha/version"
require "math_captcha/engine"

module MathCaptcha
  autoload :ViewHelper, 'math_captcha/view'
  autoload :ControllerHelpers, 'math_captcha/controller'
  autoload :Utils, 'math_captcha/utils'

  class Challenge
    attr_accessor :question, :answer, :encrypted, :options

    def initialize(question, answer, encrypted, options=nil)
      @question = question
      @answer = answer
      @encrypted = encrypted
      @options = options
    end
  end

  class Captcha
    def	initialize
      @numbers = [0,1,2,3,4,5,6,7,8,9]
      @numbers_alpha = {
        'es' => {
	  0 => 'cero',
	  1 => 'uno', 
	  2 => 'dos',
	  3 => 'tres',
	  4 => 'cuatro',
	  5 => 'cinco',
	  6 => 'seis',
	  7 => 'siete',
	  8 => 'ocho', 
	  9 => 'nueve'
        },
	'eu' => {
	  0 => 'huts',
    1 => 'bat',
    2 => 'bi',
    3 => 'hiru',
    4 => 'lau',
	  5 => 'bost',
	  6 => 'sei',
	  7 => 'zazpi',
   	8 => 'zortzi',
	  9 => 'bederatzi'	  
	},
	'en' => {
	  0 => 'zero',
	  1 => 'one',
	  2 => 'two',
	  3 => 'three',
	  4 => 'four',
	  5 => 'five',
	  6 => 'six',
	  7 => 'seven',
	  8 => 'eight',
	  9 => 'nine'
	}
      }

  # temporary remove division operation

  @ops = {
  'es' => {
	  '+' => 'más',
	  '-' => 'menos',
	  '*' => 'por'
        },
	'eu' => {
	  '+' => 'gehi',
	  '-' => 'ken',
	  '*' => 'bider'
	},
	'en' => {
	  '+' => 'plus',
	  '-' => 'minus',
	  '*' => 'times'
	}
      }
    end
    
    def locale
      return @locale unless @locale.nil?    
      @locale = I18n.locale.to_s || I18n.default_locale.to_s || 'es'
    end	    

    def	build_challenge(options={})
      # loop to prevent negative numbers
      begin 
        digit1 = @numbers[rand(9)]
        digit2 = @numbers[rand(9)]
        op = @ops[locale].keys[rand(3)]
      
        value = eval("#{digit1}#{op}#{digit2}")
      end while value < 0
      
      encrypted = MathCaptcha::Utils.generate_key(value)
      question = "#{@numbers_alpha[locale][digit1]} #{@ops[locale][op]} #{@numbers_alpha[locale][digit2]}"
      challenge = Challenge.new(question, value, encrypted, options)

      return challenge
    end
  end
end
