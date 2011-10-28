require 'csv'

base = File.dirname(__FILE__)
puts "Gem Root:" 
puts base
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

#
#  USERS...  PUT ALL USER INFORMATION HERE.
#

#
#   LEVELS
#

(1..2).each { |n| Level.default(n, "Zombie")
Level.default(3, "Slave")
Level.default(4, "Minion")
Level.default(5, "Follower")
Level.default(6, "Recruit")
Level.default(7, "Acolyte")
Level.default(8, "Cultist")
Level.default(9, "Addict")
Level.default(10, "Junkie")
Level.default(11, "Stalker")
Level.default(12, "Beholder")
Level.default(13, "Prophet")
Level.default(14, "Demon")
(15..50).each { |n| Level.default(n, "MonsterBot")}

(1..50).each { |n| Level.find_by_level_num(n).required_points! }

#
#   SETTINGS...  PUT ALL SETTINGS IN THIS GROUP.
#
Setting.default('user_initial_points', "Initial User Points", "0")
Setting.default('user_initial_stars', "Initial User Stars", "0")
#Setting.default('inventory_max_gear', "Max Amount of User Gear", "12")
#
#  badges
#
# def self.default(stub, name, desc, hint, stars, points, asset=nil, active)
# Title,Description,Hint,Stars,Points, asset, lambda, win conditions, season, active

CSV.read("#{base}/seeddata/badges.csv").select{|x| x[0] != "Title"}.each do |row|
  if row[9] == "TRUE"
    Badge.default(row[0].downcase, row[0], row[1], row[2], row[3].to_i, row[4].to_i, "#{base}/seeddata/assets/#{row[5]}")
  end
end

#
#  dedication
#
#
# row => title,description,track_type,category,captioned?,image,audio,video,preview,thumbnail,level,star cost,aff_text,aff_link,active
#def self.default(stub, title,description,track_type,category,captioned?,preview,thumbnail, level,star_cost, image,audio,video,aff_text,aff_link,active)
CSV.read("#{base}/seeddata/dedications.csv").select{|x| x[0].downcase != "title"}.each do |row|
  if row[14] == "TRUE"
    Dedication.default(row[0].downcase,row[0],row[1],row[2],row[3],row[4],"#{base}/seeddata/assets/#{row[8]}",
                       "#{base}/seeddata/assets/#{row[9]}",row[10],row[11],"#{base}/seeddata/assets/#{row[5]}",
                       "#{base}/seeddata/assets/#{row[6]}","#{base}/seeddata/assets/#{row[7]}",row[12],row[13])
  end
end

#
# Purchase 
#
#  name,description,product_url,image_url,stars,fb_credits
CSV.read("#{base}/seeddata/purchase.csv").select{|x| x[0].downcase != "name"}.each do |row|
  Purchase.default(row[0].downcase,row[0],row[1],"#{base}/seeddata/assets/#{row[2]}","#{base}/seeddata/assets/#{row[3]}",row[4],row[5])
end


#
#  songs
#
# Title,Level,Cost,Game,Preview Video,Preview Image,Icon

#CSV.read("#{base}/seeddata/songs.csv").select{|x| x[0].downcase != "title"}.each do |row|
#  Song.default(:name => row[0], :artist => row[1], :level_num => row[2], :star_cost => row[3], :unity => "#{base}/seeddata/assets/#{row[4]}", :pre_video=> "#{base}/seeddata/assets/#{row[5]}", :pre_image => "#{base}/seeddata/assets/#{row[6]}", :icon => "#{base}/seeddata/assets/#{row[7]}")
#end

#
# GEAR 
#
#  name,description,long,square,icon,star_cost

#CSV.read("#{base}/seeddata/gear.csv").select{|x| x[0].downcase != "name"}.each do |row|
#  Gear.default(:name => row[0], :desc => row[1], :long =>"#{base}/seeddata/assets/#{row[2]}" , :square => "#{base}/seeddata/assets/#{row[3]}", :icon => "#{base}/seeddata/assets/#{row[4]}", :cost => "#{base}/seeddata/assets/#{row[5]}")
#end

#
#  ActivitySeeds
#  
#

#Notification.default(
#    :name => "hottopic",
#    :message => "Special Offer for Monstergram Players!",
#    :preview => "#{base}/seeddata/assets/"+ "Hot_Topic_Preview.jpg",
#    :flyer => "#{base}/seeddata/assets/"+ "Hot_Topic.jpg"
#    )
