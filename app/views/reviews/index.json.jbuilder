json.array!(@reviews) do |review|
  json.extract! review, :name, :language, :review, :show, :link
  json.url review_url(review, format: :json)
end