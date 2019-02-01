require "yaml"
require "pry"

def load_library(filepath)
  yml = YAML.load_file(filepath)
  lib = {}
  lib["get_meaning"] = {}
  lib["get_emoticon"] = {}

  yml.each do |k,v|
    lib["get_meaning"][v[1]] = k
    lib["get_emoticon"][v[0]] = v[1]
  end
  lib
end

def get_japanese_emoticon(filepath, emot)
  lib = load_library(filepath)

  if lib["get_emoticon"][emot] == nil
    "Sorry, that emoticon was not found"
  else
    lib["get_emoticon"][emot]
  end
end

def get_english_meaning(filepath, emot)
  lib = load_library(filepath)

  if lib["get_meaning"][emot] == nil
    "Sorry, that emoticon was not found"
  else
    lib["get_meaning"][emot]
  end
end
