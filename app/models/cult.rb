require "pry"

class Cult

@@all = []

attr_reader :all, :name, :location, :founding_year, :slogan

  def initialize(name, location, founding_year,slogan)
    @name = name
    @location = location
    @founding_year = founding_year
    @slogan = slogan
    @@all << self
  end

  def recruit_follower(follower,initiation)
    BloodOath.new(follower,self,initiation)
  end

  def cult_population
    BloodOath.all.select do |oath|
      oath.cult == self
    end.count
  end

  def self.find_by_name(cult_name)
    self.all.find {|cult| cult.name == cult_name}
  end

  def self.find_by_location(location)
    self.all.select {|cult| cult.location == location}
  end

  def self.find_by_founding_year(year)
    self.all.select {|cult| cult.founding_year == year}
  end

  def average_age
    av_age = 0.0
    members = BloodOath.all.select {|oath| oath.cult == self}
    age_array = members.map {|mem| mem.follower.age}
    age_array.each {|age| av_age += age}
    av_age/(age_array.length)
  end

  def my_followers_mottos
    members = BloodOath.all.select {|oath| oath.cult == self}
    mottos = members.map {|mem| mem.follower.motto}
    mottos
  end

  def self.least_popular
    cult_info = []
     self.all.each do |cult_to_check|
      cult_info << BloodOath.all.select {|member| member.cult == cult_to_check}
    end
    cult_info.min_by {|data| data.length}[0].cult.name
  end

  def self.most_common_location
    hash = {}
    locations = self.all.map {|cult_check| cult_check.location}
    locations.each do |element|
      if hash[element]
        hash[element] += 1
      else
        hash[element] = 1
      end
    end
    hash.max_by {|loc,qty| qty}
  end



  def self.all
    @@all
  end

end
