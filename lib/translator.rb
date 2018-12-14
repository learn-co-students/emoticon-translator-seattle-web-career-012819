# require modules here
require "yaml"
def load_library(file_path)
  # code goes here
  yaml_hash = YAML.load_file(file_path)
  output_hash = {
    "get_emoticon" => {},
    "get_meaning" => {}
  }
  yaml_hash.each do |hash_key, hash_val|
    hash_val.each_with_index do |data_item, data_idx|
      output_hash.each do |out_key, out_val|
        if output_hash[out_key][hash_val[data_idx]] == nil
          if out_key == "get_emoticon" && data_idx == 0
            output_hash[out_key][hash_val[data_idx]] = hash_val[data_idx + 1]
          elsif out_key == "get_meaning" && data_idx == 1
            output_hash[out_key][hash_val[data_idx]] = hash_key.to_s
          end
        end
      end
    end
  end
  output_hash
end

def get_japanese_emoticon(file_path, emoticon)
  yaml_hash = load_library(file_path)
  translation_output = nil
  yaml_hash.each do |hash_key, hash_val|
    hash_val.each do |nested_key, nested_val|
      if hash_key == "get_emoticon"
        if nested_key == emoticon && translation_output == nil
          translation_output = nested_val
        end
      end
    end
  end
  if translation_output == nil
    translation_output = "Sorry, that emoticon was not found"
  end
  translation_output
end

def get_english_meaning(file_path, emoticon)
  yaml_hash = load_library(file_path)
  meaning_output = nil
  yaml_hash.each do |hash_key, hash_val|
    hash_val.each do |nested_key, nested_val|
      if hash_key == "get_meaning"
        if nested_key == emoticon && meaning_output == nil
          meaning_output = nested_val
        end
      end
    end
  end
  if meaning_output == nil
    meaning_output = "Sorry, that emoticon was not found"
  end
  meaning_output
end