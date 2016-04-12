class Ride < ActiveRecord::Base
  # write associations here
  belongs_to :user
  belongs_to :attraction

  def take_ride
      $error = []

        if user.tickets < attraction.tickets
            $error << "You do not have enough tickets the #{self.attraction.name}."
        end
        if user.height < attraction.min_height
            $error << "You are not tall enough to ride the #{self.attraction.name}."
        end


        if !$error.empty?
          'Sorry. ' + $error.join(' ')
        else
          user.tickets -= attraction.tickets
          user.nausea += attraction.nausea_rating
          user.happiness += attraction.happiness_rating
          user.save
        return "Thanks for riding the #{attraction.name}!"
        end

    end

end
