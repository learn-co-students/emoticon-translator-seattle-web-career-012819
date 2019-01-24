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

def get_japanese_emoticon
  # code goes here
end

def get_english_meaning
  # code goes here
end