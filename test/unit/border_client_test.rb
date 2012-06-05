require 'minitest/autorun'
require 'borderline'

module BorderLine
  class ClientTest < MiniTest::Unit::TestCase
    def test_client
      response = Client.fetch "http://apps.cbp.gov/bwt/bwt.xml"
      assert_operator response.length, :>, 0
    end
  end
  
  class GeocodeTest < MiniTest::Unit::TestCase
    def test_geolocator
      data =  Geocode.fecth_location '201.166.59.175'
      assert data, "Data is not nil."
    end
  end
end