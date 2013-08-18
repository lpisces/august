Markitup::Rails.configure do |config|
  #config.layout = "simple"  # default is `markitup`
  config.formatter = -> markup { Maruku.new(markup).to_html }
end
