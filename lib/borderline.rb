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
        
      end
    end
  end

  class Geocode
    def self.fecth_location ip
      data = Geocoder.search ip
    end
  end
end