require "test_helper"
require "city_factory"

describe City do
  include FactoryGirl::Syntax::Methods
  
  it "Stores a new city with corresponding ports" do
    city = create(:city)
    port = create(:port, city_id: city)
    city.wont_be_nil
    port.wont_be_nil
    puts "City: #{city.inspect} \n Ports: #{port.inspect}"
  end
end