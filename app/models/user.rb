class User < ActiveRecord::Base
  # write associations here
  has_many :rides
  has_many :attractions, through: :rides

  def mood
    if self.nausea.to_i >= self.happiness.to_i
      'sad'
    else
      'happy'
    end
  end

  def is_admin?
    self.admin
  end
end
