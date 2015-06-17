json.array!(@books) do |book|
  json.extract! book, :id, :title, :isbn, :sku, :pub_year
  json.url book_url(book, format: :json)
end
