json.libraries @library.each do |library|
  json.name library.try(:name)
  json.created_at library.try(:created_at)
  json.updated_at library.try(:updated_at)
end