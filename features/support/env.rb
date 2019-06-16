require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'pry'
#binding.pry para debugar
@browser = ENV['BROWSER']
@ambiente = ENV['AMBIENTE']

Capybara.configure do |config|
  case @browser
  when 'chrome'
    @driver = :selenium_chrome
  when 'firefox'
    @driver = :selenium
  when 'chrome_headless'
    Capybara.register_driver :selenium_chrome_headless do |app|
      chrome_options =  Selenium::WebDriver::Chrome::Options.new.tap do |options|
          options.add_argument "--headless"
          options.add_argument "--disable-gpu"
          options.add_argument "--no-sandbox"
          options.add_argument "--disable-site-isolation-trials"
      end
      Capybara::Selenium::Driver.new(app, browser: :chrome, options: chrome_options)
    end
      @driver = :selenium_chrome_headless    
  when 'firefox_headless'
    @driver = :selenium_headless
  end

#define se o teste será rodado em ambiente de produção ou homologação#
  case @ambiente
    when 'producao'
      @host = 'https://enjoeat-sp4.herokuapp.com'
    when 'homologacao'
      @host = 'https://enjoeat-sp3.herokuapp.com'
  end

  config.default_driver = @driver
  # config.app_host = "https://enjoeat-sp4.herokuapp.com"
  config.app_host = @host
  config.default_max_wait_time = 20
end
