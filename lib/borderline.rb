require 'nokogiri'
require 'net/http'
require 'open-uri'
require 'geocoder'

module BorderLine
  class Client
    def self.fetch_borders uri
      uri_data = URI.parse uri
      response = Net::HTTP.get_response(uri_data)
      response.body
    end

    def self.parse_xml xml
      border_line_array = []
      x = 0
      doc = Nokogiri::XML(xml) do |config|
        config.strict.noent
      end
      ports = Nokogiri::XML::Reader(doc.xpath('//port').to_s)
      ports.each do |port|
        #TODO get text from port node
      end
    end
  end

  class Geocode
    def self.fecth_location ip
      data = Geocoder.search ip
    end

    def haversine_distance( lat1, lon1, lat2, lon2 )
      # PI = 3.1415926535
      RAD_PER_DEG = 0.017453293  #  PI/180

      # the great circle distance d will be in whatever units R is in

      Rmiles = 3956           # radius of the great circle in miles
      Rkm = 6371              # radius in kilometers...some algorithms use 6367
      Rfeet = Rmiles * 5282   # radius in feet
      Rmeters = Rkm * 1000    # radius in meters

      distances = Hash.new   
      
      dlon = lon2 - lon1
      dlat = lat2 - lat1

      dlon_rad = dlon * RAD_PER_DEG 
      dlat_rad = dlat * RAD_PER_DEG

      lat1_rad = lat1 * RAD_PER_DEG
      lon1_rad = lon1 * RAD_PER_DEG

      lat2_rad = lat2 * RAD_PER_DEG
      lon2_rad = lon2 * RAD_PER_DEG

      a = (Math.sin(dlat_rad/2))**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * (Math.sin(dlon_rad/2))**2
      c = 2 * Math.atan2( Math.sqrt(a), Math.sqrt(1-a))

      dMi = Rmiles * c          # delta between the two points in miles
      dKm = Rkm * c             # delta in kilometers
      dFeet = Rfeet * c         # delta in feet
      dMeters = Rmeters * c     # delta in meters

      distances["mi"] = dMi
      distances["km"] = dKm
      distances["ft"] = dFeet
      distances["m"] = dMeters
      
      distances
    end
  end
end