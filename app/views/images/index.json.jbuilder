json.array!(@images) do |image|
  json.extract! image, :name, :src, :imageable_id, :imageable_type, :summary
  json.url image_url(image, format: :json)
end
