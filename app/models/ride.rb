class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
        has_tickets = true if user.tickets >= attraction.tickets
        has_height = true if user.height >= attraction.min_height

        if !has_tickets && !has_height
            "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
        elsif !has_tickets
            "Sorry. You do not have enough tickets to ride the #{attraction.name}."
        elsif !has_height
            "Sorry. You are not tall enough to ride the #{attraction.name}."
        else
            user.tickets = user.tickets - attraction.tickets
            user.nausea = user.nausea + attraction.nausea_rating
            user.happiness = user.happiness + attraction.happiness_rating

            user.save
            "Thanks for riding the #{attraction.name}!"
        end
    end
end
