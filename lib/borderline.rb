require 'nokogiri'
require 'net/http'
require 'open-uri'
require 'geocoder'
require 'json'

module BorderLine
  class Client
    def self.fetch_borders uri
      uri_data = URI.parse uri
      response = Net::HTTP.get_response(uri_data)
      response.body
    end

    def self.parse_xml xml
      doc = Nokogiri::XML.parse(xml)
      reader = Nokogiri::XML::Reader(doc.xpath('//item').to_s)
      reader.each do |node|
        puts node.value
      end
    end
  end

  class Geocode
    # PI = 3.1415926535
    RAD_PER_DEG = 0.017453293  #  PI/180

    # the great circle distance d will be in whatever units R is in
    Rkm = 6371              # radius in kilometers
    
    def self.fetch_location ip
      data = Geocoder.search ip
    end

    def self.haversine_distance( lat1, lon1, lat2, lon2 )
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

      dKm = Rkm * c             # delta in kilometers
    end
    
    def self.get_closest_cities_from_user cities, geoip
      cities.each do |city|
        distance = self.haversine_distance(city.latitude.to_f, city.longitude.to_f, geoip['latitude'].to_f, geoip['longitude'].to_f)
        if distance <= 5.0
          return city
        end
      end
    end
  end
end