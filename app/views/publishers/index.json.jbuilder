json.array!(@publishers) do |publisher|
  json.extract! publisher, :id, :name, :street, :state, :city, :zip, :phone, :website
  json.url publisher_url(publisher, format: :json)
end
