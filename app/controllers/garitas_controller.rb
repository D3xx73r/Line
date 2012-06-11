require 'borderline'

class GaritasController < ApplicationController
  def index
    #Fetch user location
    data = BorderLine::Geocode.fetch_location "201.166.59.175"
    geoip = data[0].data
    
    #Get all border cities
    cities = City.all
    
    #Determine closest border cities from user
    closest_city = BorderLine::Geocode.get_closest_cities_from_user cities, geoip
    if closest_city
      @found_city = true
      port_string = ""
      
      #Get city's ports
      ports = closest_city.ports
      
      #Put the request URL together with port number
      ports.each do |port|
        port_string += port.port_number+","
      end
      
      #Request port data based on the closest city
      xml = BorderLine::Client.fetch_borders "http://apps.cbp.gov/bwt/customize_rss.asp?portList=#{port_string}&lane=all&action=rss&f=html"
      
      #Parse the returned XML
      ports_data = BorderLine::Client.parse_xml xml
      raise ports_data.inspect
    else
      @found_city = false
    end
  end
end
