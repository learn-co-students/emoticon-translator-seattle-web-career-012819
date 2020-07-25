require "yaml"


def load_library(file_path)
  emoticons_yml = YAML.load_file(file_path)

  result = {}
  get_meaning = {}
  get_emoticons = {}

  emoticons_yml.each do |meaning, emoticons|
    emoticons.each do |emoticon|
      get_meaning[emoticon] = meaning
    end
    get_emoticons[emoticons[0]] = emoticons[1]
  end

  result["get_meaning"] = get_meaning
  result["get_emoticon"] = get_emoticons
  result
end

def get_japanese_emoticon(file_path, emoticon)
  emoticons = load_library(file_path)
  if emoticons["get_emoticon"].key?(emoticon)
    japanese_emoticon = emoticons["get_emoticon"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
  japanese_emoticon
end

def get_english_meaning(file_path, emoticon)
  emoticons = load_library(file_path)

  if emoticons["get_meaning"].key?(emoticon)
    return emoticons["get_meaning"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end