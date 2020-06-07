class Outgoing < ApplicationRecord
  validates :title, presence: true,
                    length: { minimum: 5 }
  validates :amount, presence: true
  belongs_to :category
end
