class Ride < ActiveRecord::Base
  attr_accessor :take_ride

  belongs_to :attraction
  belongs_to :user

  def take_ride

    if user.tickets < attraction.tickets && user.height < attraction.min_height
      return "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
    elsif user.height < attraction.min_height
      return "Sorry. You are not tall enough to ride the #{attraction.name}."
    elsif user.tickets < attraction.tickets
      return "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    else
      new_tickets = user.tickets - attraction.tickets
      new_nausea = user.nausea + attraction.nausea_rating
      new_happiness = user.happiness + attraction.happiness_rating

      user.update(tickets: new_tickets, nausea: new_nausea, happiness: new_happiness)
      "Thanks for riding the #{attraction.name}"
    end
  end
end
