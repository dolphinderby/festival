class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :nices, dependent: :destroy
  has_many :nice_articles, through: :nices, source: :article
  has_many :notes, dependent: :destroy
  has_many :note_articles, through: :notes, source: :article
  has_many :comments, dependent: :destroy

  has_one_attached :image

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [50, 50]).processed
  end

  def fullname
    last_name + " " + first_name
  end

  enum is_deleted: { deleted: true, active: false }

  validates :email, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :nickname, presence: true

end
