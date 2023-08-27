class Comment < ApplicationRecord
  scope :active_comments, -> { includes(:customer).where('customers.is_deleted': :active) }
  belongs_to :customer
  belongs_to :article
end
