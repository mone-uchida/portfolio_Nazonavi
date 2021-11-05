require 'selenium-webdriver'
require 'capybara/rspec'

RSpec.configure do |config|
  config.before(:each, type: :system) do
    driven_by :rack_test
    Capybara.server_host = IPSocket.getaddress(Socket.gethostname)
    Capybara.server_port = 3300
    Capybara.app_host = "http://#{Capybara.server_host}:#{Capybara.server_port}"
  end

  config.before(:each, type: :system, js: true) do
    driven_by :remote_chrome
    Capybara.server_host = IPSocket.getaddress(Socket.gethostname)
    Capybara.server_port = 3300
    Capybara.app_host = "http://#{Capybara.server_host}:#{Capybara.server_port}"
  end
end

Capybara.register_driver :remote_chrome do |app|
  url = 'http://chrome:4444/wd/hub'
  caps = ::Selenium::WebDriver::Remote::Capabilities.chrome(
    'goog:chromeOptions' => {
      'args' => [
        'no-sandbox',
        'headless',
        'disable-gpu',
        'window-size=1680,1050'
      ]
    }
  )
  Capybara::Selenium::Driver.new(app, browser: :remote, url: url, capabilities: caps)
end

Capybara.javascript_driver = :selenium_chrome_headless