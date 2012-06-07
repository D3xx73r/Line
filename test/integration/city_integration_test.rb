require "test_helper"
require "city_factory"

describe "City integration" do
  include FactoryGirl::Syntax::Methods
  it "shows the city's name" do
    city = create(:city)
    port = create(:port, city_id: city)
    visit city_path(city)
    page.text.must_include "Mexicali"
  end
end