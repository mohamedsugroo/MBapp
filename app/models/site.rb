class Site
  include Mongoid::Document
  field :name, type: String
  field :avatar, type: String
  field :baseUrl, type: String


  def created_at
    "time"
  end
  def updated_at
    "last updated"
  end
end
