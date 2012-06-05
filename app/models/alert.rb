class Alert < ActiveRecord::Base
  attr_accessible :alert_time, :user_id
  belongs_to :user
end
