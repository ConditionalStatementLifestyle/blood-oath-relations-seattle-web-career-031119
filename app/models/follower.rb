require "pry"


class Follower

  @@all = []

  attr_reader :name, :age, :motto

  def initialize(name, age, motto)
    @name = name
    @age = age
    @motto = motto
    @@all << self
  end

  def join_cult(cult,initiation)
    BloodOath.new(self,cult,initiation)
  end

  def self.of_a_certain_age(age_check)
    self.all.select {|follower|
       follower.age >= age_check}
  end

  def my_cults_slogans
  oaths = BloodOath.all.select {|oath| oath.follower == self}
  oaths.map {|oath| oath.cult.slogan}
  end

  def self.most_active
    hash = {}
    oaths = BloodOath.all.each do |oath|
      if hash[oath.follower.name]
        hash[oath.follower.name] += 1
      else
        hash[oath.follower.name] = 1
      end
    end
    hash.max_by {|key,value| value}
  end

  def self.top_ten
    hash = {}
    oaths = BloodOath.all.each do |oath|
      if hash[oath.follower.name]
        hash[oath.follower.name] += 1
      else
        hash[oath.follower.name] = 1
      end
    end
    ordered_array = hash.sort_by {|key,value| value}.reverse[0...10]
  end

  def self.all
    @@all
  end

end
