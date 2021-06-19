class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :user
  has_one_attached :image
  has_many   :comments

  validates :content,     presence: true, unless: :was_attached?
  validates :name,        presence: true
  validates :item_text,   presence: true
  validates :category_id, presence: true, numericality: { other_than: 1 }
  validates :price,       presence: true

  def was_attached?
    image.attached?
  end
end
