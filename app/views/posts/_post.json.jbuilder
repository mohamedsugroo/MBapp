json.extract! post, :id, :title, :featuredmedia, :post_type, :tags, :author_avatars, :author, :source_link, :site_id, :created_at, :updated_at, :content
json.url post_url(post, format: :json)

json.sites post.sites