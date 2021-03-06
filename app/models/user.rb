class User < ActiveRecord::Base
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  def mood
    if !self.happiness || !self.nausea
      return
    elsif self.nausea > self.happiness
      return 'sad'
    elsif self.happiness > self.nausea
      return 'happy'
    end
  end
end
