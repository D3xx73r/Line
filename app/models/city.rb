class City < ActiveRecord::Base
  attr_accessible :country_code, :latitude, :longitude, :name, :state, :ports_attributes
  has_many :ports, dependent: :destroy
  accepts_nested_attributes_for :ports
  validates :country_code, :latitude, :longitude, :name, :state, presence: true
end
