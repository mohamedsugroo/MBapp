require 'httparty'
namespace :blogs do
  desc "TODO"
  task wordpress: :environment do

    sites = Site.all

    sites.each do |site|
        # puts site.name, site.baseUrl
        blog = Wordpress.new(site.baseUrl)
        posts = blog.posts

        posts.each do |post|
            # puts site.id, site.name
            title = post["title"]["rendered"]
            content = post["content"]["rendered"]
            source_link = post["link"]
            tags = post["tags"]
            hash_tags = []
            published = post["date"]
            author = site.baseUrl + "users/" + post["author"].to_s
            new_author = HTTParty.get(author)
            user = new_author.parsed_response["name"]
            user_link = new_author.parsed_response["link"]
            user_avatars = new_author.parsed_response["avatar_urls"]

            # user_avatars.each do |avatar|
            #     if avatar[0].length > 8
            #         @avatar = avatar[0]
            #     elsif avatar[1].length > 8
            #         @avatar = avatar[1]
            #     elsif avatar[2].length > 8
            #         @avatar = avatar[2] 
            #     end
            # end

            tags.each do |t|
                tage_site = site.baseUrl + "tags/" + t.to_s
                new_tags = HTTParty.get(tage_site)
                hash_tags.push new_tags.parsed_response["name"]
            end

            hash_tags.to_json
            # author_name author_link avatar_small avatar_medium avatar_large
            # puts post

            post_type = "Article"

            featured_media = post["featured_media"]
            media_link = site.baseUrl + "media/" + featured_media.to_s
            featuredImage = HTTParty.get(media_link)
            photo = featuredImage.parsed_response["guid"]["rendered"] rescue ""
            puts user, @avatar
            # user, published, hash_tags, "=========>"
            Post.create(
                title: title, 
                content: content,
                site_id: site.id,
                featuredmedia: photo,
                author_name: user,
                author_avatar: @avatar,
                tags: hash_tags,
                author: user,
                author_avatars: user_avatars,
                source_link: source_link,
                post_type: post_type
            )
        end

    end

  end
end


class Wordpress
    def initialize(url)
        @url = url
    end

    def posts
        posts_url = @url+'posts'
        request = HTTParty.get(posts_url)
        return request.parsed_response
    end

    def self.print_site
        return @url
    end
    
end