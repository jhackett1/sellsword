class Project < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true
    has_many :hours
    has_many :invoices

    def total_hours
        @total = 0
        self.hours.each do |h|
            @total += h.hours
        end
        @total
    end

    def ref_no
        # TODO: Change X to real iterated letter value
        self.created_at.strftime('%y%m?')
    end

end
