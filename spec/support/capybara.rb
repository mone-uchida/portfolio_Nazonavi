require 'capybara/rspec'
require 'selenium-webdriver'

RSpec.configure do |config|
  config.before(:each, type: :system) do
    driven_by :remote_chrome
  end

  config.before(:each, type: :system, js: true) do
    driven_by :remote_chrome
  end
end

Capybara.default_driver    = :remote_chrome
Capybara.javascript_driver = :remote_chrome

Capybara.register_driver :remote_chrome do |app|
  caps = ::Selenium::WebDriver::Remote::Capabilities.chrome(
    'goog:chromeOptions' => {
      'args' => [
        'no-sandbox',
        'headless',
        'disable-gpu',
        'window-size=1680,1050',
        'disable-dev-shm-usage'
      ]
    }
  )
  Capybara::Selenium::Driver.new(app, browser: :chrome, capabilities: caps)
end
