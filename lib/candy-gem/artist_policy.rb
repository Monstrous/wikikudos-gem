class ArtistPolicy
  class BadgeHook
    def self.added_a_new_user(profile,new_user,new_val)
      
      badges = {7=> "Schmoozinator", 13 => "Lucky 13"}
      count = 1 # the number of new users added.

      badges.each do | k, v |
        if new_val >= k && new_val - count < k
          b = profile.add_badge_by_name(v)
          profile.acquired_badges << b unless b.nil?
        end
      end
      
    end
    
    def self.update_player_badge_progress(profile,recipient_count)
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
    
    def self.sent_a_message
      #
      #   This handler not wired in yet
      #
    end
    
    def self.received_a_message
      #
      #   This handler not wired in yet.
      #
    end
    
    def self.started_a_session(profile)
      badges = {4 => "Repeat Offender", 11 => "Monstrous Addiction"}
      
      badges.each do | k, v |
        if self.login_for_number_days(profile, k)
          b = profile.add_badge_by_name(v)
          profile.acquired_badges << b unless b.nil?
        end
    end
    
    def self.login_for_number_days(profile,x)
      recent_sessions = @profile.recent_sessions_as_date_time
      today = date.today
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