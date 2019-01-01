require 'pry'
require 'yaml'

# require modules here

def load_library(path)
  emoticons = YAML.load_file(path)

  emoticons.each_with_object({"get_meaning" => {}, "get_emoticon" => {}}) do |item, hash|
    item.flatten
     hash["get_meaning"][item[1][1]] = item[0]
     hash["get_emoticon"][item[1][0]] = item[1][1]

  end
end

def get_japanese_emoticon (path, emoticon)
  emoticons = load_library(path)
  #binding.pry
  if emoticons["get_emoticon"].include?(emoticon)
    return emoticons["get_emoticon"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning (path, emoticon)
  emoticons = load_library(path)
  #binding.pry
  if emoticons["get_meaning"].include?(emoticon)
    return emoticons["get_meaning"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end
