# require modules here
require "yaml"

def load_library(file)
  emotes = YAML.load_file(file)
  emotes_hash = { "get_meaning" => {},
                  "get_emoticon" => {}
  }
  
  emotes.each do |item|
    item.each do |element1, element2|
      emotes_hash["get_emoticon"][element1] = element2
      emotes_hash["get_meaning"][element2] = item[0]
    end
  end
  emotes_hash
end

def get_japanese_emoticon(file, emoticon)
  
  hash = load_library(file)
  if (hash["get_emoticon"].key?(emoticon)) == true
     japanese_emote = hash["get_emoticon"][emoticon]
     return japanese_emote
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file, emoticon)
  hash = load_library(file)
  if (hash["get_meaning"].key?(emoticon)) == true
     meaning = hash["get_meaning"][emoticon]
     return meaning
  else
    return "Sorry, that emoticon was not found"
  end
end