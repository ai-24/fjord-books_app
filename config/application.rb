require_relative "boot"
require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BooksApp
  class Application < Rails::Application
    # # I18nライブラリに訳文の探索場所を指示する
    # I18n.load_path += Dir[Rails.root.join('lib', 'locale', '*.{rb,yml}')]

    # アプリケーションでの利用を許可するロケールをホワイトリスト化する
    I18n.available_locales = [:en, :ja ]

    # ロケールを:en以外に変更する
    I18n.default_locale = :ja
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
