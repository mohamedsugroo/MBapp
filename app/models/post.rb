class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveModel::Validations
  field :title, type: String
  field :content, type: String
  field :featuredmedia, type: String
  field :post_type, type: String
  field :source_link, type: String
  field :site_id, type: String
  field :author_name, type: String
  field :author_avatar, type: String
  field :tags
  field :author_avatars
  field :author, type: String
  field :created_at, type: String
  field :updated_at, type: String

  index({ title: 1 }, { unique: true })

  before_create :created_at_fix
  before_update :updated_at_fix

  def created_at_fix
    self.created_at = Time.now
  end
  def updated_at_fix
    self.pdated_at = Time.now
  end

  def sites
    Site.where(id: self.site_id)
  end
  
  
end
