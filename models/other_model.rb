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
  attr_accessor :hobby_array
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
        @hobby_array.push("Reading")
        @hobby_array.push("Action Figure Collecting")
        @hobby_array.push("Calligraphy")
        @hobby_array.push("Candle Making")
        @hobby_array.push("Card Collector")
        @hobby_array.push("Coin Collecting")
        @hobby_array.push("Comic book collecting")
        @hobby_array.push("Creative writing")
    elsif @sum == 515 #indoor english adventurous
       @hobby_array.push("Birdwatching")
       @hobby_array.push("Stand-up Comedy")
       @hobby_array.push("Mahjong")
       @hobby_array.push("Debate")
       @hobby_array.push("Couponing")
      @hobby_array.push("Acting")
    elsif @sum == 615 #indoor english logical
      @hobby_array.push("Book Restoration")
      @hobby_array.push("Writing")
      @hobby_array.push("Leterboxing")
      @hobby_array.push("Drama")
      @hobby_array.push("Digital Art")
      @hobby_array.push
      @hobby_array.push("Book Collecting")
   elsif @sum == 715 #indoor english artsy
      @hobby_array.push("Calligraphy")
      @hobby_array.push("Home Roasting Coffee")
      @hobby_array.push("Legos")
      @hobby_array.push("Hula Hooping")
      @hobby_array.push("Glassblowing")
      @hobby_array.push("Fashion")
    elsif @sum == 425 #indoor history lazy
      @hobby_array.push("Record Collecting")
      @hobby_array.push("Sewing")
      @hobby_array.push("Soapmaking")
      @hobby_array.push("Pottery")
      @hobby_array.push("Knitting")
    elsif @sum == 525 #indoor history adventurous
      @hobby_array.push("Geneology")
      @hobby_array.push("Stamp Collecting")
      @hobby_array.push("Knapping")
      @hobby_array.push("Ghost Hunting")
      @hobby_array.push("Antiquing")
    elsif @sum == 625 #indoor history logical
      @hobby_array.push("Cryptography")
      @hobby_array.push("People Watching")
      @hobby_array.push("Lapidary")
      @hobby_array.push("Flower Arranging")
    elsif @sum == 725 #indoor history artsy
      @hobby_array.push("Deltiology")
      @hobby_array.push("Film Memorabilia")
      @hobby_array.push("Homebrewing")
      @hobby_array.push("Scrapbooking")
      @hobby_array.push("Scrapbooking")
    elsif @sum == 435 #indoor science lazy
      @hobby_array.push("Sand Art")
      @hobby_array.push("Quilting")
      @hobby_array.push("Kombucha Making")
      @hobby_array.push("Fishkeeping")
      @hobby_array.push("Throwing Darts")
    elsif @sum == 535 #indoor science adventurous
      @hobby_array.push("Insect Collecting")
      @hobby_array.push("Lock Picking")
      @hobby_array.push("Martial Arts")
      @hobby_array.push("Gymnastics")
      @hobby_array.push("Cosplaying")
      @hobby_array.push("Gardening")
    elsif @sum == 635 #indoor science logical
      @hobby_array.push("Go")
      @hobby_array.push("Magic")
      @hobby_array.push("Microscopy")
      @hobby_array.push("Jigsaw Puzzles")
      @hobby_array.push("Cooking")
      @hobby_array.push("3D Printing")
    elsif @sum == 735 #indoor science arsty
      @hobby_array.push("Web Surfing")
      @hobby_array.push("Web Surfing")
      @hobby_array.push("Soapmaking")
      @hobby_array.push("Slot Car Racing")
      @hobby_array.push("Sculpting")
      @hobby_array.push("Role-Playing")
      @hobby_array.push("Jewelry Making")
    elsif @sum == 445 #indoor pe lazy
      @hobby_array.push("Table Tennis")
      @hobby_array.push("Yoga")
      @hobby_array.push("Foosball")
      @hobby_array.push("Fencing")
      @hobby_array.push("Fantasy Sports")
    elsif @sum == 545 #indoor pe adventurous
      @hobby_array.push("Lucid Dreaming")
      @hobby_array.push("Weight Training")
      @hobby_array.push("Taekwondo")
      @hobby_array.push("Judo")
      @hobby_array.push("Inline Skating")
      @hobby_array.push("Ice Skating")
    elsif @sum == 645 #indoor pe logical
      @hobby_array.push("Yo-yoing")
      @hobby_array.push("Woodworking")
      @hobby_array.push("Poker")
      @hobby_array.push("Horseshoe Pitching")
      @hobby_array.push("Juggling")
    elsif @sum == 745 #indoor pe artsy
      @hobby_array.push("Singing")
      @hobby_array.push("Sketching")
      @hobby_array.push("Wood Carving")
      @hobby_array.push("Vehicle Restoration")
      @hobby_array.push("Curling")
    elsif @sum == 405 #indoor math lazy
      @hobby_array.push("Tour Skating")
      @hobby_array.push("Speed Skating")
      @hobby_array.push("Embroidery")
      @hobby_array.push("Billiards")
      @hobby_array.push("Crocheting")
    elsif @sum == 505 #indoor math adventurous
      @hobby_array.push("Whale Watching")
      @hobby_array.push("Taxodermy")
      @hobby_array.push("Poi")
      @hobby_array.push("Knife Throwing")
      @hobby_array.push("Dance")
    elsif @sum == 605 #indoor math logical
      @hobby_array.push("Crossword Puzzles")
      @hobby_array.push("Puzzles")
      @hobby_array.push("Astronomy")
      @hobby_array.push("Astrology")
    elsif @sum == 705 #indoor math artsy
      @hobby_array.push("Macrame")
      @hobby_array.push("Whittling")
      @hobby_array.push("Painting")
      @hobby_array.push("Origami")
      @hobby_array.push("Model Building")
      @hobby_array.push("Knife Making")
    elsif @sum == 522 #outdoor english lazy
      @hobby_array.push
      @hobby_array.push("Herping")
      @hobby_array.push("Homebrewing")
      @hobby_array.push("Golf")
      @hobby_array.push("Handball")
      @hobby_array.push("Whale Watching")
      @hobby_array.push
    elsif @sum== 622 #outdoor english adventurous
      @hobby_array.push("Horseback Riding")
      @hobby_array.push("Glassblowing")
      @hobby_array.push("Camping")
      @hobby_array.push
      @hobby_array.push("Pigeon Racing")
      @hobby_array.push("Kayaking")

    elsif @sum == 722 #outdoor english logical
      @hobby_array.push("Squash")
      @hobby_array.push("Fishkeeping")
      @hobby_array.push("Acting")
      @hobby_array.push("Netball")
    elsif @sum == 822 #outdoor english artsy
      @hobby_array.push("Hooping")
      @hobby_array.push("Figure Skating")
      @hobby_array.push("Art Collecting")
    elsif @sum == 532 #outdoor history lazy
      @hobby_array.push("Film Memorabilia")
      @hobby_array.push("Field Hockey")
      @hobby_array.push("Aviation")
    elsif @sum == 632 #outdoor history adventurous
      @hobby_array.push("Aircraft Spotting")
      @hobby_array.push("Metal Detecting")
      @hobby_array.push("Ghost Hunting")
      @hobby_array.push("Rafting")
    elsif @sum == 732 #outdoor history logical
      @hobby_array.push("Parkour")
      @hobby_array.push("Disc Golf")
      @hobby_array.push("Badminton")
    elsif @sum == 832 #outddor history artsy
      @hobby_array.push("Vintage Cars")
      @hobby_array.push("Topiary")
      @hobby_array.push("Sailing")
    elsif @sum == 542 #outdoor science lazy
      @hobby_array.push("Lacrosse")
      @hobby_array.push("Astronomy")
      @hobby_array.push("Tai Chi")
      @hobby_array.push("Fooseball")
      @hobby_array.push("Gardening")
    elsif @sum == 642 #outdoor science adventurous
      @hobby_array.push("Dowsing")
      @hobby_array.push("Deltiology")
      @hobby_array.push("Paintball")
      @hobby_array.push("Insect Collecting")
      @hobby_array.push("Darts")
    elsif @sum == 742 #outdoor science logical
      @hobby_array.push("Element Collecting")
      @hobby_array.push("Base Jumping")
      @hobby_array.push("Backpacking")
    elsif @sum== 842 #outdoor science artsy
      @hobby_array.push("Dance")
      @hobby_array.push("Antiquing")
      @hobby_array.push("Animal Fancy")
      @hobby_array.push("Topiary")
      @hobby_array.push("Shortwave")
    elsif @sum == 552 #outdoor pe lazy
      @hobby_array.push("Curling")
      @hobby_array.push("Airsoft")
      @hobby_array.push("Bodybuilding")
      @hobby_array.push("Tennis")
    elsif @sum == 652 #outdoor pe adventurous
      @hobby_array.push("Urban Exploration")
      @hobby_array.push("Kart Racing")
      @hobby_array.push("Trainspotting")
      @hobby_array.push("Stone Collecting")
      @hobby_array.push("Photography")
      @hobby_array.push("Skydiving")
    elsif @sum== 752 #outdoor pe logical
      @hobby_array.push("Laser Tag")
      @hobby_array.push("Skateboarding")
      @hobby_array.push("Climbing")
      @hobby_array.push("Volleyball")
    elsif @sum == 852 #outdoor pe artsy
      @hobby_array.push("Archery")
      @hobby_array.push("Tai Chi")
      @hobby_array.push("Cycling")
      @hobby_array.push("Gymnastics")
      @hobby_array.push("Cheerleading")
    elsif @sum == 512 #outdoor math lazy
      @hobby_array.push("Kombucha Making")
      @hobby_array.push("Cricket")
      @hobby_array.push("Graffiti")
    elsif @sum== 612 #outdoor math adventurous
      @hobby_array.push("Foraging")
      @hobby_array.push("Parkour")
      @hobby_array.push("Scuba Diving")
      @hobby_array.push("Airsoft")
      @hobby_array.push("Geocaching")
    elsif @sum == 712 #outdoor math logical
      @hobby_array.push("Whittling")
      @hobby_array.push("Yo-yoing")
      @hobby_array.push("Juggling")
    elsif @sum == 812 #outdoor math artsy
      @hobby_array.push("Kite Surfing")
      @hobby_array.push("Cosplaying")
      @hobby_array.push("Color Guard")
      @hobby_array.push("Knitting")
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





