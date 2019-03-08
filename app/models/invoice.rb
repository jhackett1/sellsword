class Invoice < ApplicationRecord
  belongs_to :project
  has_many :charges
end
