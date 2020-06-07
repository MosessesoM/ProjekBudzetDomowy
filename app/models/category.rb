class Category < ApplicationRecord
	validates :name, presence: true
	has_many :incomes
	has_many :outgoings
end
