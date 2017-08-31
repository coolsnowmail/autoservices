require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Autoservices
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # config.action_mailer.delivery_method = :smtp
    # config.action_mailer.smtp_settings = {
    #  :address              => "smtp.gmail.com",
    #  :port                 => 587,
    #  :user_name            => "cool.snow.mail@gmail.com",
    #  :password             => "89272755555",
    #  :authentication       => "plain",
    # :enable_starttls_auto => true
    # }

    # config.action_mailer.smtp_settings = { address: 'localhost',
    #                                      port: 1025 }
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
