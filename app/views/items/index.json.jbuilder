json.array!(@items) do |item|
  json.extract! item, :name, :summary
  json.url item_url(item, format: :json)
end
