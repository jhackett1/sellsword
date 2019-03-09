class Charge < ApplicationRecord
  validates :hours, presence: true, numericality: { greater_than: 0 }
  validates :rate, presence: true, numericality: { greater_than: 0 }
  validates :description, presence: true
  belongs_to :invoice
end
