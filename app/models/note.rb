class Note < ApplicationRecord
  belongs_to :customer
  belongs_to :article
end
