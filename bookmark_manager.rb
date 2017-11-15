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
    redirect '/links/add_tags'
  end

  get '/tags/:name' do
    @filter = params[:name]
    tag = Tag.first(name: @filter)
    @links = tag ? tag.links : []
    erb(:'links/index')
  end

  get '/links/add_tags' do
    erb(:'links/add_tags')
  end

  post '/links/add_tags' do
    tag = Tag.first_or_create(name: params[:tag])
    link = Link.last
    link.tags << tag
    link.save
    redirect 'links/add_tags'
  end

  run if app_file==$0
end
