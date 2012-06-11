require "test_helper"
require "borderline"
require "geocoder"

module BorderLine
  class GeocodeTest < Minitest::Unit::TestCase
    def test_haversine_distance
      distance = Geocode.haversine_distance(32.6455704, -115.4453421, 32.6789476, -115.4988834)
      assert distance, "#{distance.inspect}"
      print "#{distance['mi']}\n#{distance['km']}\n#{distance['ft']}\n#{distance['m']}"
    end
    
    def test_fetch_location
      result = Geocoder.search "201.166.59.175"
      assert_operator result.length, :>, 0
      print "#{result.to_yaml}\n\n\n"
    end
  end
end