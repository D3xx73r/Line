FactoryGirl.define do
  factory :city do |c|
    c.name 'Mexicali'
    c.latitude '32.6455704'
    c.longitude '-115.4453421'
    c.country_code 'MX'
    c.state 'Baja California'
  end
  
  factory :port do |p|
    p.port_number "250301"
    p.title "Calexico - East"
    p.association :city_id, factory: :city
  end
end