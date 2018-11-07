class Reservation < ApplicationRecord
    belongs_to :user
    belongs_to :listing
    validate  :reservation_available
    validate  :date_not_in_past
    validate  :check_in_before_check_out




    def  check_in_before_check_out
        if reserve_from>reserve_until
            errors.add(:check_out_date,"Check out date is before check in date")
        end
    end
    def  date_not_in_past
        if reserve_from < Date.today
            errors.add(:date_incorrect,"Date is in the past")
        end
    end
    def reservation_available
        self.listing.reservations.each do |reservation|
            if(self.reserve_from..self.reserve_until).overlaps?(reservation.reserve_from..reservation.reserve_until)
    errors.add(:dates_overlap,"Dates overlap,try for other days")
    end
end
end
before_save do
    self.price = (((self.reserve_until-self.reserve_from).to_i)*listing.price).to_i
    end
end
