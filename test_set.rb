require 'json'

# Define the path to your JSON setting file
SET_FILE_PATH = 'settings.json'.freeze

# Ensure the JSON file exists with an empty array if not present
unless File.exist?(SET_FILE_PATH)
  File.write(SET_FILE_PATH, [].to_json)
end

cat_out=""
settings = JSON.parse(File.read(SET_FILE_PATH))

  settings.each do |item|
    cat_out = item['cat_out']
    cat_out2 = item['cat_out2']
  end

print "#{cat_out}"
