class Tag < ApplicationRecord
  has_many :post_tags, dependent: :destroy
  has_many :artis, through: :post_tags
end
