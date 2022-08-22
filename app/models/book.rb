class Book < ApplicationRecord
	belongs_to :library
	# has_one_attached :album_photo
end
