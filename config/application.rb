require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Knq
  class Application < Rails::Application
    config.lograge.enabled = true
    config.lograge.formatter = Lograge::Formatters::Logstash.new

    config.lograge.custom_options = lambda do |event|
      opts = {
        params: event.payload[:params],
        time:  %Q('#{event.time}'),
        remote_ip: event.payload[:ip],
        request_url: event.payload[:request_url],
        app_name: "#{Rails.application.class.parent_name.underscore.dasherize}-#{Rails.env}"
      }
      if event.payload[:exception]
        quoted_stacktrace = %Q('#{Array(event.payload[:stacktrace]).to_json}')
        opts[:stacktrace] = quoted_stacktrace
      end
      opts
    end
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de


    # For Foundation 5
    config.assets.precompile += %w( vendor/modernizr )

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
    config.secret_key_base = ENV['SECRET_TOKEN']
  end
end
