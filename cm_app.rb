require 'sinatra'
require 'json'

# Define the path to your JSON setting file
SET_FILE_PATH = 'settings.json'.freeze

# Ensure the JSON file exists with an empty array if not present
unless File.exist?(SET_FILE_PATH)
  File.write(SET_FILE_PATH, [].to_json)
end

settings = JSON.parse(File.read(SET_FILE_PATH))

# intialize variables
sinatra_dir = ""
ditaot_dir = ""
java_dir = ""
cat_out = ""
cat_out2 = ""
cat_out3 = ""

# get variables from settings.json file
settings.each do |item|
  sinatra_dir = item['sinatra_dir']
  ditaot_dir = item['ditaot_dir']
  java_dir = item['java_dir']
  cat_out = item['cat_out']
  cat_out2 = item['cat_out2']
  cat_out3 = item['cat_out3']
end


# Define the path to your JSON data file
JSON_FILE_PATH = 'data.json'.freeze

# Ensure the JSON file exists with an empty array if not present
unless File.exist?(JSON_FILE_PATH)
  File.write(JSON_FILE_PATH, [].to_json)
end

# Route to display the form and current data
get '/' do
  # Read existing data for display
  @page_title = "Home Page"
  @data = JSON.parse(File.read(JSON_FILE_PATH))
  erb :display_front
end

get '/form0' do
  @page_title = "Create Form"
  @cat_out = cat_out
  @cat_out2 = cat_out2
  @data = JSON.parse(File.read(JSON_FILE_PATH))
  erb :form0
end 

get '/form1' do
  @page_title = "Home Page"
  @cat_out = cat_out
  @cat_out2 = cat_out2 
  erb :form1
end


get '/display' do
  @page_title = "Display Form"
  @cat_out = cat_out
  @cat_out2 = cat_out2 
  @id_val = params[:id_val]
  @data = JSON.parse(File.read(JSON_FILE_PATH))
  erb :display
end

get '/display_all' do
  @data = JSON.parse(File.read(JSON_FILE_PATH))
  erb :display_all
end

get '/display_cat' do
  @cat = params[:cat]
  @data = JSON.parse(File.read(JSON_FILE_PATH))
  erb :display_cat
end

get '/name' do
  @id_val = params[:id_val]
  erb :display_value
end

get '/delete_confirm' do
 @page_title = "Delete Confirm"
 @id_val = params[:id_val]
 @data = JSON.parse(File.read(JSON_FILE_PATH))
 erb :delete_confirm
end

post '/delete_entry' do
    @page_title = "Delete Entry"
        @id_val = params[:id_val]
        @data = JSON.parse(File.read(JSON_FILE_PATH))
    erb :delete_entry     
end

get '/edit_entry' do
    @page_title = "Edit Entry"
    @id_val = params[:id_val]
    @cat_out = cat_out
    @cat_out2 = cat_out2 
    @data = JSON.parse(File.read(JSON_FILE_PATH))
    erb :edit_entry     
end

get '/edit_entry1' do
    @page_title = "Edit Markdown Entry"
    @id_val = params[:id_val]
    @cat_out = cat_out
    @cat_out2 = cat_out2 
    @data = JSON.parse(File.read(JSON_FILE_PATH))
    erb :edit_entry1     
end


get '/search' do
    @page_title = "Search Query"
    @cat_out3 = cat_out3
    erb :search     
end

# Route to handle the form submission
post '/submit' do
  # Get the data from the form parameters
  # The params hash is automatically populated by Sinatra from form submissions
  new_entry = {
    'id' => params['id'],
    'name' => params['name'],
    'message' => params['message']
  }

  # Read existing data from the file
  data = JSON.parse(File.read(JSON_FILE_PATH))

  # Add the new entry
  data << new_entry

  # Write the updated data back to the file
  File.write(JSON_FILE_PATH, JSON.pretty_generate(@data))

  # Redirect back to the home page or a confirmation page
  redirect '/'
end

post '/form1_out' do
  @page_title = "Form1 Out"
  @id_val = params[:id_val]
  @form_name = params[:form_name]
  @title = params[:title]
  @short_desc = params[:short_desc]
  @text1n = params[:text1n]
  @text2n = params[:text2n]
  @text3n = params[:text3n]
  @text4n = params[:text4n]
  @text5n = params[:text5n]
  @file1n = params[:file1n]
  @file2n = params[:file2n]
  @text1 = params[:text1]
  @text2 = params[:text2]
  @text3 = params[:text3]
  @text4 = params[:text4]
  @text5 = params[:text5]
  @file1 = params[:file1]
  @file2 = params[:file2]
  @category1 = params[:category1]
  @category2 = params[:category2]
  @content = params[:content]
  

  new_entry = {
    'id' => params[:id_val],
    'form_name' => params[:form_name],
    'title' => params[:title],
    'short_desc' => params[:short_desc],
    'text1n' => params[:text1n],
    'text2n' => params[:text2n],
    'text3n' => params[:text3n],
    'text4n' => params[:text4n],
    'text5n' => params[:text5n],
    'file1n' => params[:file1n],
    'file2n' => params[:file2n],
    'text1' => params[:text1],
    'text2' => params[:text2],
    'text3' => params[:text3],
    'text4' => params[:text4],
    'text5' => params[:text5],
    'file1' => params[:file],
    'file2' => params[:file2],
    'category1' => params[:category1],
    'category2' => params[:category2],
    'content' => params[:content]
  }

  # Read existing data from the file
  @data = JSON.parse(File.read(JSON_FILE_PATH))

  # Add the new entry
  @data << new_entry

  # Write the updated data back to the file
  File.write(JSON_FILE_PATH, JSON.pretty_generate(@data))


  #@data = JSON.parse(File.read(JSON_FILE_PATH))
  erb :form1_out
end

post '/form2_out' do
  @sinatra_dir=sinatra_dir
  @ditaot_dir=ditaot_dir
  @java_dir=java_dir
  @page_title = "Form2 Out"
  @id_val = params[:id_val]
  @form_name = params[:form_name]
  @title = params[:title]
  @short_desc = params[:short_desc]
  @text1n = params[:text1n]
  @text2n = params[:text2n]
  @text3n = params[:text3n]
  @text4n = params[:text4n]
  @text5n = params[:text5n]
  @file1n = params[:file1n]
  @file2n = params[:file2n]
  @text1 = params[:text1]
  @text2 = params[:text2]
  @text3 = params[:text3]
  @text4 = params[:text4]
  @text5 = params[:text5]
  @file1 = params[:file1]
  @file2 = params[:file2]
  @category1 = params[:category1]
  @category2 = params[:category2]
  @content = params[:content]
  

 # Read existing data from the file
  @data = JSON.parse(File.read(JSON_FILE_PATH))

  


  #@data = JSON.parse(File.read(JSON_FILE_PATH))
  erb :form2_out
end

post '/form3_out' do
  @sinatra_dir=sinatra_dir
  @ditaot_dir=ditaot_dir
  @java_dir=java_dir
  @page_title = "Form3 Out"
  @id_val = params[:id_val]
  @form_name = params[:form_name]
  @title = params[:title]
  @short_desc = params[:short_desc]
  @text1n = params[:text1n]
  @text2n = params[:text2n]
  @text3n = params[:text3n]
  @text4n = params[:text4n]
  @text5n = params[:text5n]
  @file1n = params[:file1n]
  @file2n = params[:file2n]
  @text1 = params[:text1]
  @text2 = params[:text2]
  @text3 = params[:text3]
  @text4 = params[:text4]
  @text5 = params[:text5]
  @file1 = params[:file1]
  @file2 = params[:file2]
  @category1 = params[:category1]
  @category2 = params[:category2]
  @content = params[:content]
  

 # Read existing data from the file
  @data = JSON.parse(File.read(JSON_FILE_PATH))

  


  #@data = JSON.parse(File.read(JSON_FILE_PATH))
  erb :form3_out
end

  

post '/form0_out' do
  @page_title = "Form0 Out"
  @id_val = params[:id_val]
  @form_name = params[:form_name]
  @title = params[:title]
  @short_desc = params[:short_desc]
  @text1n = params[:text1n]
  @text2n = params[:text2n]
  @text3n = params[:text3n]
  @text4n = params[:text4n]
  @text5n = params[:text5n]
  @file1n = params[:file1n]
  @file2n = params[:file2n]
  @category1 = params[:category1]
  @category2 = params[:category2]
  

  new_entry = {
    'id' => params[:id_val],
    'form_name' => params[:form_name],
    'title' => params[:title],
    'short_desc' => params[:short_desc],
    'text1n' => params[:text1n],
    'text2n' => params[:text2n],
    'text3n' => params[:text3n],
    'text4n' => params[:text4n],
    'text5n' => params[:text5n],
    'file1n' => params[:filen],
    'file2n' => params[:file2n],
    'category1' => params[:category1],
    'category2' => params[:category2]
  }

  # Read existing data from the file
  @data = JSON.parse(File.read(JSON_FILE_PATH))

  # Add the new entry
  @data << new_entry

  # Write the updated data back to the file
  File.write(JSON_FILE_PATH, JSON.pretty_generate(@data))


  #@data = JSON.parse(File.read(JSON_FILE_PATH))
  erb :form0_out
end

post '/search_out' do
  @page_title = "Search Results"

  @search_cat = params[:search_cat]
  @search_string = params[:search_string]
  @data = JSON.parse(File.read(JSON_FILE_PATH))
  
  erb :search_out
end

