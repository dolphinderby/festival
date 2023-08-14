class Article < ApplicationRecord
  has_many :post_tags,dependent: :destroy
  has_many :tags,through: :post_tags, dependent: :destroy
  has_many :nices, dependent: :destroy
  has_many :notes, dependent: :destroy
  has_many :comments, dependent: :destroy

  def niced_by?(customer)
    nices.where(customer_id: customer.id).exists?
  end

  def noted_by?(customer)
    notes.exists?(customer_id: customer.id)
  end

  def self.search(search_word)
  Article.where(["name LIKE(?) OR prefecture LIKE(?) OR sub_title LIKE(?)",
                 "%#{search_word}%", "%#{search_word}%", "%#{search_word}%"])
  end

  has_one_attached :image

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [100, 100]).processed
  end

end
