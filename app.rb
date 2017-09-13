#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

#создаем БД
set :database, "sqlite3:barbers.db"

class Client < ActiveRecord::Base
    validates :name, presence: true
    validates :phone, presence: true
    validates :datestamp, presence: true
    validates :color, presence: true
end

#настройка ActiveRecord для нашей сущности
class Barber < ActiveRecord::Base

end



before do
    @barbers = Barber.all
    @clients = Client.all
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

    c = Client.new params[:client]
    c.save


erb "<h2>Спасибо, что Вы к нам записались!</h2>"

  end


