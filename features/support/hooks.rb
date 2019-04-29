

Before do
  page.current_window.resize_to(1440, 900)

  @rest_list_page = RestaurantListPage.new
  @rest_page = RestaurantPage.new
end

Before("@bread_bakery") do
  visit "/restaurants/bread-bakery/menu"
end
