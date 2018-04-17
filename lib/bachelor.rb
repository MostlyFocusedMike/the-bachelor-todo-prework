require 'pry'
require 'json'

def b_data 
  # hash in the form of {"seasonX": [{"str"=>"str",...},...]
  file = File.read('spec/fixtures/contestants.json')
  binding.pry
  return data = JSON.parse(file)
end

def contestants
  return b_data.map {|k,profile| profile}.flatten
end

def get_first_name_of_season_winner(data, season)
  data[season].find {|hash| hash["status"] == "Winner"}["name"].split[0]
end

def get_contestant_name(data, job)
  contestants.find {|hash| hash["occupation"] == job}["name"]
end

def count_contestants_by_hometown(data, hometown)
  contestants.map {|val| 1 if val["hometown"] == hometown}.compact.reduce(0, :+) 
  # remove nil values, then add up all the ones in the array
end

def get_occupation(data, hometown)
  contestants.find {|val| val["hometown"] == hometown}["occupation"]
end

def get_average_age_for_season(data, season)
  (data[season].map {|val| val["age"].to_f}.reduce(0, :+)/(data[season].length)).round
  # ages from maps array added up / by number of indexes, then round
end


# binding.pry


