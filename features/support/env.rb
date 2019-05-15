require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'

@browser = ENV['BROWSER']
@ambiente = ENV['AMBIENTE']

Capybara.configure do |config|
  case @browser
  when 'chrome'
    @driver = :selenium_chrome
  when 'firefox'
    @driver = :selenium
  when 'chrome_headless'
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
  config.default_max_wait_time = 10
end
