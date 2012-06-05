class Port < ActiveRecord::Base
  attr_accessible :city_id, :port_number, :title
  belongs_to :city
end
