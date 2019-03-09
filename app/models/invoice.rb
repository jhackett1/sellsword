class Invoice < ApplicationRecord
  belongs_to :project
  has_many :charges
  accepts_nested_attributes_for :charges

  def subtotal
    subtotal = 0
    self.charges.each do |c|
        subtotal += c.hours * c.rate
    end
    subtotal
  end

  def total
    self.subtotal - self.discount
  end

end
