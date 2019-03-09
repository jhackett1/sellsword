class Project < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true
    has_many :hours
    has_many :invoices

    def total_hours_worked
        total_hours = 0
        self.hours.each do |h|
            @total_hours += h.hours
        end
        @total_hours
    end

    def total_earned
        total_earned = 0
        self.invoices.each do |h|
            total_earned += h.total
        end
        total_earned
    end

    def total_hours_invoiced
        total_invoiced = 0
        self.invoices.each do |h|
            total_invoiced += h.hours
        end
        total_invoiced
    end

    def ref_no
        # TODO: Change X to real iterated letter value
        self.created_at.strftime('%y%m?')
    end

end
