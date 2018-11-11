json.extract! advert, :id, :name, :ad_code, :start_date, :end_date, :created_at, :updated_at
json.url advert_url(advert, format: :json)
