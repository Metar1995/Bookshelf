json.books @books.each do |p|
  json.id p.try(:id)
  json.name p.try(:name)
  if p.album_photo.present?
    json.image "http://localhost:3000" + Rails.application.routes.url_helpers.rails_blob_url(p.album_photo, only_path: true) 
  end
  json.created_at p.try(:created_at)
  json.updated_at p.try(:updated_at)
end