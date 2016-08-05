require 'net/http'
require 'json'
require 'rubygems'

def get_data_from_api

	request_string = "https://en.wikipedia.org/w/api.php?format=json&action=query&prop=links&titles=List_of_hobbies&pllimit=500"

	sample_uri = URI(request_string) #opens a portal to the data at that link
	sample_response = Net::HTTP.get(sample_uri) #go grab the data in the portal
	sample_parsedResponse = JSON.parse(sample_response) #makes data easy to read

  query_results = sample_parsedResponse["query"]
  pages = query_results["pages"]
  first_key = pages.keys[0]
  all_hobbies = pages[first_key]
  hobby_links = all_hobbies["links"]

  #now we have an array of all the links
  title_array = hobby_links.map do |each_title|
    each_title["title"]
  end
  not_actual_hobbies = ["Asheville", "About.com", "Adams Media", "Alcester", "Aqua-lung", "Arcadia Publishing", "Association football", "Amateur astronomy", "Amateur geology", "Amateur astronomy", "Animal Fancy", "Astrological Association of Great Britain", "Australian Parkour Association", "Auto audiophilia", "Badminton England", "Baton twirling", "Bird watching", "Australian rules football", "Boardgame Players Association", "British Amateur Rugby League Association", "British Beekeepers' Association", "British Canoe Union", "British Equestrian Federation", "British Go Association", "British Mountaineering Council", "British Mycological Society", "British Cycling", "British Numismatic Society", "British Society of Dowsers", "British Sub-Aqua Club", "Business Insider", "CNBC", "CSIRO Publishing", "Cambridge University Press", "Canal & River Trust", "Capstone Publishers", "Chicago Tribune", "Comic Book Collecting Association", "Community", "Contract Bridge", "Cowles Publishing Company", "Crown Publishing Group", "Daily Mail and General Trust", "Daily News (New York)", "Daly City, California", "David Noonan (game designer)", "Die-cast toy", "Digital object identifier", "Do it yourself", "Dog sport", "Dover Publications", "Dungeon Master's Guide", "ESPN cricinfo", "Education Scotland", "Electronics", "Exhibition drill", "FIDE", "Focal Press", "Forbes", "Greenwood Publishing Group", "ESPN Critic Info", "Gongoozler", "Gunsmithing", "Harvard Magazine", "Herald Sun", "Hoboken, New Jersey", "Hobbies", "Huffington Post", "Human Swimming", "Hunting", "IPC Media", "International Association of Master Penmen, Engrossers and Teachers of Handwriting", "International Cheer Union", "International Federation of Gymnastics", "International Hockey Federation", "International Ice Hockey Federation", "International Shooting Sport Federation", "International Standard Book Number", "International Yo-Yo Federation", "John Wiley & Sons", "Johnathon Tweet", "Katharine Weymouth", "LARP Alliance, Inc.", "Lace", "Lapidary Club", "Lawn Tennis Association", "Learning", "Leisure", "Lerner Publishing Group", "Los Angeles Times", "Machining", "Marbles", "Massachusetts Institute of Technology", "Media Wales", "Melbourne", "Metal detector", "Metalworking", "Mineralogical Society of America", "Minneapolis", "Model aircraft", "Monte Cook", "Mortimer Zuckerman", "Motor sports", "Movies", "Music", "Mycology", "NBC News", "NPR", "National Geographic Society", "National Ice Skating Association", "National Library of Australia", "National Operatic and Dramatic Association", "New York", "New Corps Australia", "Newsquest", "Newsweek", "Orienteering", "Nordic Skating", "Oxford University Press", "Palgrave Macmillan", "Penton Media", "Pet", "Popular Mechanics", "Psylon Press", "Pubmed Central", "Pubmed Identifier", "Radio-controlled Car", "Rock balancing", "Roller Derby", "Roller Skating", "Rowing", "Royal Aero Club", "Royal Caledonian Curling Club", "Royal Pigeon Racing Association", "Rugby football", "Rugby League", "Sculling", "Second-language aqcuisition", "Shooting", "Shooting sport", "Skimboarding", "Skip Williams", "Slacklining", "Slot car Racing", "South Wales Argus", "Stanford University", "Tabletop game", "Telegraph Media Group", "The Atlantic", "The Australian", "The Boston Globe", "The Daily Mail", "The Daily Telegraph", "The Economic Times", "The Economist", "The Free Lance-Star", "The Guardian", "The Herald (Glasgow)", "The Herald and Weekly Times", "The Independent", "The New York Times", "BBC", "The Philadelphia Inquirer", "The Seattle Times","The Spokesman-Review", "The State News", "The Times", "The Times Group", "Thomas Register", "Time (magazine)", "Triathlon", "Tribune Publishing", "Ultimate Disc", "University of Massachusetts Press", "University of New Mexico", "Urban Exploration", "Vacation", "Vice Magazine", "Videophile", "Vintage Cars", "Volleyball England", "Vox Media", "Wales Online", "Walking", "Wall Street Journal", "Washington Post", "Water sports", "Western Daily Press", "Wiley Publishing", "Wilsonville, Oregon", "Wizards of the Coast", "World Dance Council", "Worldbuilding", "Help:CS1 errors", "News Corp Australia", "PubMed Central", "PubMed Identifier", "Sea glass", "Seashell", "Second-language acquisition", "Television Program", "American Cryptology Association"]
  not_actual_hobbies.each do |not_hobby|
    title_array.delete_if do |title|
      title == not_hobby
    end
  end
  title_array
end

def play_with_wikipedia_api(search_term)

end

class Quiz

  def initialize(params)
    @params = params
    @sum = 0
    @hobby_array = []
  end

  def add
     @params.each do |key, value|
       @sum = @sum + value.to_i
     end
  end

  def pick_hobby
    if @sum == 415 #indoor english lazy
      @hobby_array.push("Reading","Birdwatching","Calligraphy", "Action Figure", "Candle Making", "Card Collector", "Calligraphy", "Coin Collecting", "Book Restoration", "Comic book collecting", "Creative writing", "")

    elsif @sum == 515 #indoor english adventurous
      @hobby_array.push("Chess")
    elsif @sum
    end
    @hobby_array.sample
  end






end


# def format_request_and_call_api(search_term)
# 	new_search_term = search_term.gsub(" ", "+")
# 	request_string = "http://api.giphy.com/v1/gifs/search?q=#{new_search_term}&api_key=dc6zaTOxFJmzC"

# 	sample_uri = URI(request_string) #opens a portal to the data at that link
# 	sample_response = Net::HTTP.get(sample_uri) #go grab the data in the portal
# 	sample_parsedResponse = JSON.parse(sample_response) #makes data easy to read
# 	# data comes back as a hash with info stored in key :data as an array
# 	data = sample_parsedResponse["data"]
# 	# data is now an array containing hashes of the gifs
# 	data.sample["images"]["fixed_height"]["url"]
# end





