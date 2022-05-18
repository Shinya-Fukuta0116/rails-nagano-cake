class Item < ApplicationRecord
  belongs_to :genre, optional: true
  has_one_attached :image
  validates :is_active, inclusion: {in: [true, false]}
  validates :genre_id, presence: true
end
