class Invoice < ApplicationRecord
  belongs_to :project
  has_many :charges
  accepts_nested_attributes_for :charges
end
