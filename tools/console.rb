require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

puts "------- Class Attributs & Methods ------- "
puts
dons_cult = Cult.new("Don's Cult", "Queen Anne", 1991, "Oh Yeah")

r_cult = Cult.new("r cult", "Neenah", 1991, "Oh Yeah")


dougs_cult = Cult.new("Doug's Cult","La Push", 1992, "True")

seattle_cult = Cult.new("Seattle Cult","Queen Anne", 1993, "Green")

jon_langkammer = Follower.new("Jon Langkammer",27,"go deep")

doug_wort = Follower.new("Doug Wort",27,"wort wort")
brit = Follower.new("Brit",25,"hi")
sayed = Follower.new("sayed",22,"hi")


harlow = Follower.new("Harlow", 6, "meow")

low_pressure = Follower.new("Low Pressure", 1000000,"condense")

seattle_cult.recruit_follower(low_pressure,"6/15/16")
seattle_cult.recruit_follower(sayed,"5/15/16")
dougs_cult.recruit_follower(sayed,"5/15/16")

dons_cult.recruit_follower(harlow,"3/11/16")
seattle_cult.recruit_follower(harlow,"3/11/16")
r_cult.recruit_follower(harlow,"3/11/16")
dons_cult.recruit_follower(doug_wort,"3/11/19")
dons_cult.recruit_follower(jon_langkammer,"3/11/92")
dons_cult.recruit_follower(brit,"3/11/92")

puts "dons_cult.cult_population"
puts dons_cult.cult_population
puts
puts "seattle_cult.cult_population"
puts seattle_cult.cult_population
puts
puts "Cult.find_by_name('Doug\'s Cult')"
puts Cult.find_by_name('Doug\'s Cult')
puts
puts "Cult.find_by_location('Queen Anne')"
puts Cult.find_by_location("Queen Anne")
puts
puts "Cult.find_by_founding_year(1991)"
puts Cult.find_by_founding_year(1991)
puts
puts "harlow.join_cult(dougs_cult,1/1/19)"
puts harlow.join_cult(dougs_cult,"1/1/19")
puts
puts "Follower.of_a_certain_age(27)"
puts Follower.of_a_certain_age(27)

puts "------- Analytics Methods ------- "

puts dons_cult.average_age
puts
puts dons_cult.my_followers_mottos
puts
puts Cult.least_popular
puts
puts Cult.most_common_location
puts
puts sayed.my_cults_slogans
puts
puts Follower.most_active
puts
puts Follower.top_ten
puts
puts BloodOath.first_oath


pry.start
