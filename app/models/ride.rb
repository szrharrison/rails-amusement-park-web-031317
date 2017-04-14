class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  validates :user_id, presence: true
  validates :attraction_id, presence: true

  def take_ride
    user = User.find( self.user_id )
    attraction = Attraction.find( self.attraction_id )
    if user.tickets >= attraction.tickets && user.height >= attraction.min_height
        user.tickets -= attraction.tickets
        user.nausea += attraction.nausea_rating
        user.happiness += attraction.happiness_rating
        user.save
    else
      return_string = ['Sorry.']
      if user.tickets < attraction.tickets
        return_string << "You do not have enough tickets to ride the #{attraction.name}."
      end
      if user.height < attraction.min_height
        return_string << "You are not tall enough to ride the #{attraction.name}."
      end
      return_string.join( ' ' )
    end
  end
end
