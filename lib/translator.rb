require 'yaml'
require 'pry'

def load_library(file)
  library = YAML.load_file('./lib/emoticons.yml')
  library_hash = {'get_meaning' => {}, 'get_emoticon' => {}}
  library.each do |meaning, location|
    english = location[0]
    japanese = location[1]
  library_hash['get_meaning'][japanese] = meaning 
  library_hash['get_emoticon'][english] = japanese
  end
  library_hash
end

def get_japanese_emoticon(file, emoticon)
  library_hash = load_library(file)
  if library_hash["get_emoticon"].include?(emoticon)
    library_hash["get_emoticon"][emoticon]
  else
    puts "Sorry, that emoticon was not found."
  end
end

def get_english_meaning
  # code goes here
end