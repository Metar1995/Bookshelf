json.books @books.each do |p|
  json.id p.try(:id)
  json.name p.try(:name)
  json.book_info p.try(:book_info)
  json.created_at p.try(:created_at)
  json.updated_at p.try(:updated_at)
end