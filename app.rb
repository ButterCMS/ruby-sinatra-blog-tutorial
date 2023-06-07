require 'sinatra'
require 'net/http'
require 'json'

set :public_folder, File.join(File.dirname(__FILE__), 'public')





get '/' do

 uri = URI('https://api.buttercms.com/v2/posts/?auth_token="YOUR API KEY") # Replace with your API endpoint
 response = Net::HTTP.get(uri)
 data = JSON.parse(response)
 latestPost = data['data'].shift
 erb :index , locals: { data: data, latestPost:latestPost }

end



get '/detail/:slug' do
 slug = params[:slug]
 puts slug

 uri = URI('https://api.buttercms.com/v2/posts/' + slug + '/?auth_token="YOUR API KEY") # Replace with your API endpoint
 response = Net::HTTP.get(uri)
 data = JSON.parse(response)
 post = data['data']
 date_string = post['published']
 date = DateTime.parse(date_string)
 formatted_date = date.strftime("%m/%d/%Y %I:%M %p")
 puts formatted_date   
 erb :detail, locals:{post: post, formatted_date: formatted_date}
end



get '/search' do
 slug = params[:query]

 uri = URI('https://api.buttercms.com/v2/posts/search/?query=' + slug + '&page=1&page_size=10&auth_token="YOUR API KEY") # Replace with your API endpoint
 response = Net::HTTP.get(uri)
 data = JSON.parse(response)
 blog = data['data']

 erb :searchResults, locals:{data:blog, searchTerm:slug}
end