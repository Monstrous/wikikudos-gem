class ArtistPolicy
  class BadgeHook
    def self.added_a_new_user(profile,new_user,new_val)
      
      badges = {3=> "Networker"}
      count = 1 # the number of new users added.

      badges.each do | k, v |
        if new_val == k
          b = profile.add_badge_by_name(v)
        end
      end
      
    end
    
    def self.update_player_badge_progress(profile,recipient_count, new_val)
    end
    
    def self.add_badge(b)
      #
      #  This handler not needed for Monstergrams.
      #
    end
    
    def self.sent_a_message(profile,message,count)
      Rails.logger.debug "[ArtistPolicy::Badge.sent_a_message] enter #{count}"
      return unless message.attachable.present?
      return unless message.attachable_type == "Dedication"

      badges = {1 => "Welcome to the Club", 3 => "Accomplished Kudo-izer ", 5 => "Padawan"}

      badges.each do | k, v |
        if count == k
          b = profile.add_badge_by_name(v)
        end
      end


      name = message.attachable.name

      self.sent_by_name(profile,name,3, ["Net Spider","Spiderweb Cookie","Spider Kaleidoscope","Spider Cupcakes"], "Arachnid Wrangler")
      self.sent_by_name(profile,name,4, ["Ginger Dead Men","Lady Fingers","Death by Chocolate","Crispy Treat",
      			"Spiderweb Cookie","Spider Cupcakes","Fresh Baked Peanut Butter Pieces Cookies"], "Totally Baked")
      self.sent_by_name(profile,name,5, ["Zombie Teddy","Come a Little Closer","Fury","Another Day At The Office","Brain-Eating Jock",
      			"Up Past Her Bedtime","On-Call Nurse","Eat Your Heart Out","Zombie Sign","Zombies at Sunrise"], "Zombie Master")
      self.sent_by_name(profile,name,8, ["Candy of the Dead", "Flower Skull", "Kiss Me, I'm Yours", "Grim Reaper", "Sugar Fiend","Reaper Says",
      			"Wish You Were Here","Dungeon Party","Skull Mandala","Flaming Skeletons","Happy Dance","Always in my Heart","Sugar Skulls",
      			"Knife Licking Guy"], "Bone Collector")      
    end

    
    def self.received_a_message(profile,message, count)
      Rails.logger.debug "[ArtistPolicy::Badge.recieved_a_message] enter #{count}"
      

      if Message.where(:recipient_id => profile.id).select(:sender_id).count == 7
          b = profile.add_badge_by_name("Lucky 7")
      end
      
      return unless message.attachable.present?
      return unless message.attachable_type == "Dedication"

      name = message.attachable.name
      
      self.received_by_name(profile,name, 4, ["Pumpkin Surprise","Princess Trick or Treat","Infinite Pumpkin","Pumpkin Attack",
      			"Jack O' Lantern","Pumpkin Patch","Menacing Jack O' Lantern","Pumpkin Posse","Pumpkin Scaring Pumpkin"], "Pumpkin Snatcher")
      self.received_by_name(profile,name, 3, ["Hard Candy","Gummy Snake","Swirly Lolly","Candy of the Dead","Peanut Butter Cup",
      			"Chewy Peanut Buttery Candy","Licorice Vampire","Haunted Candypops","Sea of Worms","Chickloscope","Gummy Brute Squad",
      			"Gummy Armada","Gummy Pileup","Twizazzlers","Snackerz Bar","Classic Candy Corn","Witch Candy","Sugar Skulls"], "Trick or Treater")      
      self.received_by_name(profile,name, 5, ["Vampire Priss", "We Do Not Sparkle", "Vampire Queen", "Vampire Sugar Rush", "Sexy Vampire",
      			"That Sucks!", "What-ever!", "You've Got My Heart","Licorice Vampire","Old School Vampire","Vampire Grillz"], "Van Helsing")      
      self.received_by_name(profile,name, 3, ["Curious Cats","Questionable Intentions","Kitty Trick or Treater","Every Witch Needs a Cat",
      			"Halloween Kitty","Mrrrrow","Boo","Show No Fear","Hang In There"], "Cat Whisperer")
    end

    def self.sent_a_message_to_number_of_users(profile, count)
      if count == 3
        profile.add_badge_by_name("Efficiency Award") 
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
      a=0
      dedication_count = Message.where(:recipient_id => profile.id).where(:attachable_id=>dedication_ids).group(:attachable_id).count.values.collect{|x| a += 1}.last
      
      if dedication_count >= count
        profile.add_badge_by_name(badge_name)
      end
    end
    
    def self.sent_by_name(profile,name,count, dedication_names, badge_name)
      return false unless dedication_names.include? name
      
      dedication_ids = Rails.cache.fetch(dedication_names.join.tr('^a-zA-Z','')) do 
        Dedication.where(:name=>dedication_names).collect{|x|x.id}
      end
      a = 0
      dedication_count = Message.where(:sender_id => profile.id).where(:attachable_id=>dedication_ids).group(:attachable_id).count.values.collect{|x| a += 1}.last
      
      if dedication_count >= count
        profile.add_badge_by_name(badge_name)
      end
    end
    
    def self.started_a_session(profile)
      badges = {2 => "Repeat Kudoer", 4 => "Kudo Addiction"}
      
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