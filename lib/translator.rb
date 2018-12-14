# require modules here
require "yaml"
def load_library(file_path)
  # code goes here
  yaml_hash = YAML.load_file(file_path)
  output_hash = {
    get_emoticon: {}
    get_meaning: {}
  }
  yaml_hash.each do |hash_key, hash_val|
    hash_val.each_with_index do |data_item, data_idx|
      if output_hash[:get_emoticon][hash_val[data_idx]] == nil
        if data_idx == 0
          output_hash[:get_meaning][hash_val[data_idx]] = hash_val[data_idx + 1]
        elsif data_idx == 1
          output_hash[:get_emoticon][hash_val[data_idx]] = hash_key.to_s
        end
      end
    end
  end
  output_hash
end

def get_japanese_emoticon
  # code goes here
end

def get_english_meaning
  # code goes here
end