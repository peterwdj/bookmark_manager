ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'

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
    link = Link.new(title: params[:title], url: params[:url])
    tag = Tag.first_or_create(name: params[:tag])
    link.tags << tag
    link.save
    redirect '/links'
  end

  run if app_file==$0
end
