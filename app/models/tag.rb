class Tag < ApplicationRecord
  has_many :post_tags, dependent: :destroy
  has_many :tag_articles, through: :post_tags, source: :article
  has_many :articles, through: :post_tags, dependent: :destroy

  validates :name, presence: true

end
