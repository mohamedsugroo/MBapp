class Advert
  include Mongoid::Document
  field :name, type: String
  field :ad_code, type: String
  field :start_date, type: String
  field :end_date, type: String
end
