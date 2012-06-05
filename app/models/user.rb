class User < ActiveRecord::Base
  attr_accessible :email, :phone, :twitter
  has_many :alerts
end
