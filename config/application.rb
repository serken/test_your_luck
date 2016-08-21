require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

APP_CONFIG_PATH = File.expand_path('../application_config.yml', __FILE__)
APP_CONFIG      = YAML.load_file(APP_CONFIG_PATH)

module TestYourLuck
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.autoload_paths += %W(#{config.root}/lib)

  end

  def self.config
    @config ||= Hashie::Mash.new(APP_CONFIG)
  end
end
