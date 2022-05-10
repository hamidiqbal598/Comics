class Character < ApplicationRecord
  has_one_attached :picture
  belongs_to :marvel_story, optional: true
end
