class Hour < ApplicationRecord
  validates :hours, presence: true, numericality: { greater_than: 0 }
  validates :date, presence: true
  belongs_to :project
end
