# require modules here
require 'yaml'
require 'pry'

def load_library(file_path)
  file_hash = YAML.load_file(file_path)
  library = {"get_meaning" => {}, "get_emoticon" => {}}
  file_hash.each do |meaning, emoticons|
    library["get_meaning"][emoticons[1]] = meaning
    library["get_emoticon"][emoticons[0]] = emoticons[1]
  end
  library
end

def get_japanese_emoticon(file_path, emoticon)
  if translated = load_library(file_path)["get_emoticon"][emoticon]
    translated
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  if translated = load_library(file_path)["get_meaning"][emoticon]
    translated
  else
    "Sorry, that emoticon was not found"
  end
end
