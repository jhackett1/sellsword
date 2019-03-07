class Project < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true
    has_many :hours

    # Total of all hours worked on a project
    def total_hours
        @total = 0
        self.hours.each do |h|
            @total += h.hours
        end
        @total
    end

    def ref_no
        self.created_at.year.to_s + self.created_at.month.to_s
    end

end
