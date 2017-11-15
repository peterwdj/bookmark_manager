ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './models/link'

class BookmarkManager < Sinatra::Base

  set :environment, :development

  get '/' do
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
    erb(:links)
  end

  get '/links/new' do
    erb(:'links/new')
  end

  post '/links' do
    link = Link.create(title: params[:title], url: params[:url])
    tag = Tag.new(name: params[:tag])
    link.tags << tag
    link.save
    redirect '/links'
  end

  run if app_file==$0
end
