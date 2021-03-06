require 'koda'
#require File.dirname(__FILE__) + '/../projects/koda/lib/koda'
set :views, "views"
#
# Add or modify these routes at your own discretion
#
#  Usage help
#
#  get '[url_to_match]' do
#   show [:view_name]
#  end
#
#  get '[url_to_match]/:name/:another' do
#   # get parameters
#   name = params[:name]
#   another = params[:another]
#
#   # and return json
#   JSONP {'another'=>another, 'name' => name}
#  end
#
#  post '[url_to_match]' do
#   # get the raw data
#   data = request.env["rack.input"].read
#   # do something with data
#  end
#
#  put '[url_to_match]' do
#   # or get it as a hash
#   data_as_hash = JSON.parse request.env["rack.input"].read
#   # do something with data
#  end
#
#  delete '[url_to_match]/:name' do
#   # get parameters
#   name = params[:name]
#  end
#
#
get '/' do
  # you can set a variable to access from your view.
  # example...
  # @current_page = filtered('pages', 'home')
  # OR
  # @current_page = document('pages', 'home')
  @title = "Koda Placeholder Page"
  show :index
end


get '/:folder/:page?' do
  content_type :html
  @current_page = model.send(params[:folder].to_sym).find params[:page]
  if(@current_page)
    erb :article, :escape_html => true
  else
    redirect '/'
  end
end

run Sinatra::Application