class BloodOath

  @@all = []

  attr_reader :follower, :cult, :initiation

  def initialize(follower, cult, initiation)
    @follower = follower
    @cult = cult
    @initiation = initiation
    @@all << self
  end

  def self.first_oath
    @@all[0].follower.name
    end

  def self.all
    @@all
  end


end
