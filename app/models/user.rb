class User < ActiveRecord::Base
  attr_writer :mood

  has_secure_password

  has_many :rides
  has_many :attractions, through: :rides

  validates_presence_of :name

  def mood
    if self.happiness > self.nausea
      self.mood = "happy"
    else
      self.mood = "sad"
    end
  end
end
