json.array!(@user_profiles) do |user_profile|
  json.extract! user_profile, :id, :user_id, :publisher_id, :title, :start_date, :bio, :favorite_books, :phone
  json.url user_profile_url(user_profile, format: :json)
end
