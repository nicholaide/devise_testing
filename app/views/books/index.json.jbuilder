json.array!(@books) do |book|
  json.extract! book, :id, :title, :publish_date, :isbn
  json.url book_url(book, format: :json)
end
