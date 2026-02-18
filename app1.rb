require 'sinatra'
require 'json'


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
  erb :index
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

get '/display_all' do
  @data = JSON.parse(File.read(JSON_FILE_PATH))
  erb :display_all
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

get '/delete_entry' do
    @page_title = "Delete Entry"
        @id_val = params[:id_val]
        @data = JSON.parse(File.read(JSON_FILE_PATH))
    erb :delete_entry     
end

get '/edit_entry' do
    @page_title = "Edit Entry"
        @id_val = params[:id_val]
        @data = JSON.parse(File.read(JSON_FILE_PATH))
    erb :edit_entry     
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
  File.write(JSON_FILE_PATH, JSON.pretty_generate(data))

  # Redirect back to the home page or a confirmation page
  redirect '/'
end

post '/form1_out' do
  @page_title = "Form1 Out"
  @id_val = params[:id_val]
  @name = params[:name]
  @message = params[:message]
  @data = JSON.parse(File.read(JSON_FILE_PATH))
  erb :form1_out
end

post '/form0_out' do
  @page_title = "Form0 Out"
  @id_val = params[:id_val]
  @title = params[:title]
  @form_name = params[:form_name]
  @text1n = params[:text1n]
  @text2n = params[:text2n]
  @text3n = params[:text3n]
  @text4n = params[:text4n]
  @text5n = params[:text5n]
  @file1n = params[:file1n]
  @file2n = params[:file2n]
  @category1 = params[:category1]
  @category2 = params[:category2]
  @data = JSON.parse(File.read(JSON_FILE_PATH))

  new_entry1 = {
    'id' => params['id'],
    'title' => params['name'],
    'form_nameZZZ' => params['form_name']
    'text1n' => params['text1n']
    'text2n' => params['text2n']
    'text3n' => params['text1n']
    'text4n' => params['text4n']
    'text5n' => params['text5n']
    'category1' => params['category1']
    'category2' => params['category2']
  }

  # Read existing data from the file
  data = JSON.parse(File.read(JSON_FILE_PATH))

  # Add the new entry
  data << new_entry

  # Write the updated data back to the file
  File.write(JSON_FILE_PATH, JSON.pretty_generate(data))

  erb :form0_out
end



