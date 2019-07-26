require "base64"
require "report_builder"
require "date"

Before do
  page.current_window.resize_to(1440, 900)
  #page.driver.browser.manage.window.maximize
  @rest_list_page = RestaurantListPage.new
  @rest_page = RestaurantPage.new
  @order_page = OrderPage.new
end

Before("@bread_bakery") do
  visit "/restaurants/bread-bakery/menu"
end

Before("@green_food") do
  visit "/restaurants/green-food/menu"
end

After do |scenario|
  #if scenario.failed?
  #shot_file = page.save_screenshot("log/screenshot.png")
  #shot_b64 = Base64.encode64(File.open(shot_file, "rb").read)
  #embed(shot_b64, "image/png", "Screenshot") # Cucumber anexa o screenshot no report

  screenshot = page.save_screenshot("log/screenshots/#{scenario.__id__}.png")
  embed(screenshot, "image/png", "Screenshot")
  #end
end

at_exit do
  t = Time.now
  data_teste = t.strftime("%d/%m/%Y %H:%M:%S")
  @infos = {
    "Autor" => "Lucas Donato",
    "Ambiente" => "Homologação",
    "Data do Teste" => data_teste,
  }

  ReportBuilder.configure do |config|
    config.input_path = "log/report.json"
    config.report_path = "log/report"
    config.report_types = [:html]
    config.report_title = "Enjoeat - Restaurantes"
    config.additional_info = @infos
    config.color = "cyan"
  end
  ReportBuilder.build_report
end
