json.array!(@tags) do |tag|
  json.extract! tag, :name, :highlight, :sort
  json.url tag_url(tag, format: :json)
end
