class ArtistPolicy
  class BadgeHook
    def self.added_a_new_user(profile,new_user,new_val)
      
      badges = {7=> "Schmoozinator"}
      count = 1 # the number of new users added.

      badges.each do | k, v |
        if new_val >= k && new_val - count < k
          b = profile.add_badge_by_name(v)
          profile.acquired_badges << b unless b.nil?
        end
      end
      
    end
    
    def self.update_player_badge_progress(profile,recipient_count, new_val)
      Rails.logger.debug "[ArtistPolicy::Badge.update_player_badge_progress] recipient #{recipient_count}"
      badges = {1 => "Welcome to the Horde", 27 => "Accomplished Monsterizer", 103 => "Deliverator"}

      badges.each do | k, v |
        if new_val >= k && new_val - recipient_count < k
          b = profile.add_badge_by_name(v)
          profile.acquired_badges << b unless b.nil?
        end
      end
      
    end
    
    def self.add_badge(b)
      #
      #  This handler not needed for Monstergrams.
      #
    end
    
    def self.sent_a_message(profile,message,count)
      return unless message.attachable.present?
      return unless message.attachable_type == "Dedication"

      name = message.attachable.name

      self.sent_by_name(profile,name,3, ["Net Spider","Spiderweb Cookie","Spider Kaleidoscope"], "Arachnid Wrangler")
      self.sent_by_name(profile,name,4, ["Ginger Dead Men","Lady Fingers","Death by Chocolate","Crispy Treat","Spiderweb Cookie"], "Tough Cookies")
      self.sent_by_name(profile,name,3, ["Zombie Teddy","Come a Little Closer","Fury"], "Zombie Master")
    end
  
    
    def self.received_a_message(profile,message, count)
      Rails.logger.debug "[ArtistPolicy::Badge.recieved_a_message] enter #{count}"

      badges = {13 => "Lucky 13"}

      badges.each do | k, v |
        if new_val >= k && new_val - recipient_count < k
          b = profile.add_badge_by_name(v)
          profile.acquired_badges << b unless b.nil?
        end
      end
      
      return unless message.attachable.present?
      return unless message.attachable_type == "Dedication"

      name = message.attachable.name
      
      self.received_by_name(profile,name, 4, ["Pumpkin Surprise","Princess Trick-Or-Treat","Infinite Pumpkin","Pumpkin Attack"], "Pumpkin Pie")
      self.received_by_name(profile,name, 3, ["Hard Candy","Gummy Snake","Candy of the Dead"], "Trick or Treater")      
    end
    
    
    def self.sent_a_message_to_number_of_users(profile, count)
      if count == 7
        profile.add_bage_by_name("Efficiency Award") 
        #
        #  profile already handles checking and caching.
        #
      end
    end
    
    def self.received_by_name(profile,name,count, dedication_names, badge_name)
      return false unless dedication_names.include? name
      
      dedication_ids = Rails.cache.fetch(dedication_names.join.tr('^a-zA-Z','')) do 
        Dedication.where(:name=>dedication_names).collect{|x|x.id}
      end
      dedication_count = Message.where(:recipient_id => profile.id).group(:attachable_id=>dedication_ids).count.values.collect{|x| a += x}.last
      
      if dedication_count > count
        profile.badge_add_by_name(badge_name)
      end
    end
    
    def self.send_by_name(profile,name,count, dedication_names, badge_name)
      return false unless dedication_names.include? name
      
      dedication_ids = Rails.cache.fetch(dedication_names.join.tr('^a-zA-Z','')) do 
        Dedication.where(:name=>dedication_names).collect{|x|x.id}
      end
      dedication_count = Message.where(:sender_id => profile.id).group(:attachable_id=>dedication_ids).count.values.collect{|x| a += x}.last
      
      if dedication_count > count
        profile.badge_add_by_name(badge_name)
      end
    end
    
    def self.started_a_session(profile)
      badges = {4 => "Repeat Offender", 11 => "Monstrous Addiction"}
      
      badges.each do | k, v |
        if self.login_for_number_days(profile, k)
          b = profile.add_badge_by_name(v)
          profile.acquired_badges << b unless b.nil?
        end
      end
    end
    
    def self.login_for_number_days(profile,x)
      recent_sessions = profile.recent_sessions_as_date_time
      today = Date.today
      (0...x).each do |offset|
        day = today - offset
        if recent_sessions.index {|sess_date_time| day === sess_date_time }.nil?
          return false
        end
      end
      true
    end
  end
  
  class DedicationHook
  end
  
  class GearHook
  end
  
  class MessageHook
  end
end