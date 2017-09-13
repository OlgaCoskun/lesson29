#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

#создаем БД
set :database, "sqlite3:barbers.db"

class Client < ActiveRecord::Base
    validates :name, presence: true, length: {minimum: 3}
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
    @c = Client.new
  erb :visit
end


post '/visit' do

    @c = Client.new params[:client]
    if @c.save
        erb "<h2>Спасибо, что Вы к нам записались!</h2>"
    else
        @error = @c.errors.full_messages.first
        erb :visit
  end
end

get '/barber/:id' do
    @barber = Barber.find(params[:id])
    erb :barber
end

get '/bookings' do
    @clients = Client.order('created_at DESC')
    erb :bookings
end

get '/client/:id' do
    @client = Client.find(params[:id])
    erb :client
end
