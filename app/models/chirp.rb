class Chirp < ActiveRecord::Base
	belongs_to :user
	# validates :body, length: { minimum: 3, maximum: 180 }
end
