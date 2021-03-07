class Ride < ApplicationRecord
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if enough_tickets? && tall_enough?
      begin_ride
    else
      sorry = 'Sorry.'
      sorry += " You do not have enough tickets to ride the #{attraction.name}." unless enough_tickets?
      sorry += " You are not tall enough to ride the #{attraction.name}." unless tall_enough?
      sorry
    end
  end

  def enough_tickets?
    user.tickets >= attraction.tickets
  end

  def tall_enough?
    user.height >= attraction.min_height
  end

  def begin_ride
    happy = user.happiness + attraction.happiness_rating
    nauseous = user.nausea + attraction.nausea_rating
    ticky = user.tickets - attraction.tickets
    user.update(happiness: happy, nausea: nauseous, tickets: ticky)
    "Thanks for riding the #{attraction.name}!"
  end
end
