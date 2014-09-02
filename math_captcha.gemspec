# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'math_captcha/version'

Gem::Specification.new do |spec|
  spec.name          = "math_captcha"
  spec.version       = MathCaptcha::VERSION
  spec.authors       = ["Tania Rubio"]
  spec.email         = ["tania@efaber.net"]
  spec.summary       = %q{Add math_captcha in forms to prevent spammers}
  spec.description   = %q{Simple lib to generate a math_captcha to prevent spammers in form. Supports localization.}
  spec.homepage      = "http://toadd.mathcaptcha.com"
  spec.license       = "MIT"

  # spec.files         = `git ls-files -z`.split("\x0")
  spec.files         = Dir["{lib}/**/*"] + ["LICENSE.txt", "README.md"]
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 0"
end
