json.array!(@articles) do |article|
  json.extract! article, :id, :code, :name, :version
  json.url article_url(article, format: :json)
end
