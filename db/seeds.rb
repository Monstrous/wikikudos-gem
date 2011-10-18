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

(1..3).each { |n| Level.default(n, "Listener")}
(4..6).each { |n| Level.default(n, "Follower")}
(7..9).each { |n| Level.default(n, "Enthusiast")}
(10..12).each { |n| Level.default(n, "Supporter")}
(13..15).each { |n| Level.default(n, "Fan")}
(16..18).each { |n| Level.default(n, "Freak")}
(19..21).each { |n| Level.default(n, "Disciple")}
(22..24).each { |n| Level.default(n, "Addict")}
(25..28).each { |n| Level.default(n, "Junkie")}
(29..31).each { |n| Level.default(n, "Superfan")}
(32..34).each { |n| Level.default(n, "Groupie")}
(35..37).each { |n| Level.default(n, "Stalker")}
(36..50).each { |n| Level.default(n, "BieberBot")}

(1..50).each { |n| Level.find_by_level_num(n).required_points! }

#
#   SETTINGS...  PUT ALL SETTINGS IN THIS GROUP.
#
Setting.default('user_initial_points', "Initial User Points", "0")
Setting.default('user_initial_stars', "Initial User Stars", "50")
Setting.default('inventory_max_gear', "Max Amount of User Gear", "12")
#
#  badges
#
# def self.default(stub, name, desc, hint, stars, points, asset=nil)
# Title,Description,Hint,Stars,Points

CSV.read("#{base}/seeddata/badges.csv").select{|x| x[0] != "Title"}.each do |row|
    Badge.default(row[0].downcase, row[0], row[1], row[2], row[3].to_i, row[4].to_i, "#{base}/seeddata/assets/#{row[5]}")
end

#
#  dedication
#
#
# row => title,description,image,audio,video,preview,thumbnail,level,star cost,aff_text,aff_link
#def self.default(stub, title,description,preview,thumbnail, level,star_cost, image,audio,video,aff_text,aff_link)


CSV.read("#{base}/seeddata/dedications.csv").select{|x| x[0].downcase != "title"}.each do |row|
  Dedication.default(row[0].downcase,row[0],row[1],"#{base}/seeddata/assets/#{row[5]}","#{base}/seeddata/assets/#{row[6]}",row[7],row[8], "#{base}/seeddata/assets/#{row[2]}","#{base}/seeddata/assets/#{row[3]}","#{base}/seeddata/assets/#{row[4]}",row[9],row[10])
end


#
#  songs
#
# Title,Level,Cost,Game,Preview Video,Preview Image,Icon


CSV.read("#{base}/seeddata/songs.csv").select{|x| x[0].downcase != "title"}.each do |row|
  Song.default(:name => row[0], :artist => row[1], :level_num => row[2], :star_cost => row[3], :unity => "#{base}/seeddata/assets/#{row[4]}", :pre_video=> "#{base}/seeddata/assets/#{row[5]}", :pre_image => "#{base}/seeddata/assets/#{row[6]}", :icon => "#{base}/seeddata/assets/#{row[7]}")
end


#
# GEAR 
#
#  name,description,long,square,icon,star_cost


CSV.read("#{base}/seeddata/gear.csv").select{|x| x[0].downcase != "name"}.each do |row|
  Gear.default(:name => row[0], :desc => row[1], :long =>"#{base}/seeddata/assets/#{row[2]}" , :square => "#{base}/seeddata/assets/#{row[3]}", :icon => "#{base}/seeddata/assets/#{row[4]}", :cost => "#{base}/seeddata/assets/#{row[5]}")
end

#
# Purchase 
#
#  name,description,product_url,image_url,stars,fb_credits


CSV.read("#{base}/seeddata/purchase.csv").select{|x| x[0].downcase != "name"}.each do |row|
  Purchase.default(row[0].downcase,row[0],row[1],row[2],row[3],row[4],row[5])
end

#
#  ActivitySeeds
#  
#

Notification.default(
  :name => "justinlive",
  :message => "Hey BieberFans, come see me live!",
  :preview => "Ticket_Master_Preview.jpg",
  :flyer => "Ticket_Master.jpg"
  )
  
Notification.default(
  :name => "quiz",
  :message => "How much do you know about Justin?",
  :preview => "Quiz_Preview.jpg",
  :flyer => "Quiz_Flyer.jpg"
  )
  
Notification.default(
    :name => "hottopic",
    :message => "Special Offer for BieberVerse Players!",
    :preview => "Hot_Topic_Preview.jpg",
    :flyer => "Hot_Topic.jpg"
    )
