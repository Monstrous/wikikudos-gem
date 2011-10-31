require 'csv'
base = File.dirname(__FILE__)
puts "Gem Root: #{base}"
CSV.read("#{base}/seeddata/dedications.csv").select{|x| x[0].downcase != "title"}.each do |row|
  if row[14] == "TRUE"
    Dedication.create_or_update(row[0].downcase,row[0],row[1],row[2],row[3],row[4],"#{base}/seeddata/assets/#{row[8]}",
                       "#{base}/seeddata/assets/#{row[9]}",row[10],row[11],"#{base}/seeddata/assets/#{row[5]}",
                       "#{base}/seeddata/assets/#{row[6]}","#{base}/seeddata/assets/#{row[7]}",row[12],row[13])
  end
end
