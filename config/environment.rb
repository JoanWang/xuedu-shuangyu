require File.join(File.dirname(__FILE__), 'boot')


RAILS_GEM_VERSION = '2.3.2' unless defined? RAILS_GEM_VERSION

Rails::Initializer.run do |config|
  config.time_zone = 'UTC'
 
  
  config.i18n.default_locale = "zh-CN"
  LOCALES_DIRECTORY = "#{RAILS_ROOT}/config/locales/"
 
  # config/application.rb
  config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
  #语言包
  LANGUAGES = {
    'English' => 'en-GB',
    'Chinese' => 'zh-CN'
  }

  config.gem 'declarative_authorization', :source => 'http://gemcutter.org'
  config.gem 'searchlogic'
  config.gem 'prawn', :version=> '0.6.3'
   
  config.load_once_paths += %W( #{RAILS_ROOT}/lib )
  config.load_paths += Dir["#{RAILS_ROOT}/app/models/*"].find_all { |f| File.stat(f).directory? }
end
