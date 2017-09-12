#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:barbers.db"

class Client < ActiveRecord::Base
end

#настройка ActiveRecord для нашей сущности
class Barber < ActiveRecord::Base

end



before do
    @barbers = Barber.all
end



get '/' do
    #@barbers = Barber.all
    #сортировка списка
    @barbers = Barber.order "created_at DESC"
	erb :index
end




#добавили форму из урока 21 app.rb
get '/visit' do
  erb :visit
end


post '/visit' do
  @name = params[:name]
  @phone = params[:phone]
  @datetime = params[:datetime]
  @barber = params[:barber]
  @color = params[:color]

erb "<h2>Спасибо, что Вы к нам записались!</h2>"

  end
