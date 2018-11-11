module ApplicationHelper

    def title(page_title)
        content_for(:title) { page_title }
    end

    def adverts_small
        Advert.skip(rand(Advert.count)).first
    end
    
end
