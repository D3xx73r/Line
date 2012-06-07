require "test_helper"
require "borderline"

module BorderLine
  class GeocodeTest < Minitest::Unit::TestCase
    def test_haversine_distance
      distance = Geocode.haversine_distance(32.6455704, -115.4453421, 32.6789476, -115.4988834)
      assert distance, "#{distance.inspect}"
      print "#{distance['mi']}\n #{distance['km']}\n #{distance['ft']}\n #{distance['m']}"
    end
  end
end