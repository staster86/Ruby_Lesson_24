require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"
end

get '/about' do
	erb :about
end

get '/visit' do
	erb :visit
end

get '/contacts' do
	erb :contacts
end

post '/visit' do
	color = params[:color]
	barber = params[:barber]
	username = params[:username]
	phone = params[:phone]
	datetime = params[:datetime]

	f = File.open "./public/user.txt", "a"
	f.write "Barber: #{barber}, User #{username}, Phone #{phone}, Date and time: #{datetime}, Color #{color}\n"
	f.close

	erb "Ok! Barber: #{barber}, User #{username}, Phone #{phone}, Date and time: #{datetime}, Color #{color} you waiting!"
end

post '/contacts' do
	email = params[:email]
	message = params[:message]

	f = File.open "./public/contacts.txt", "a"
	f.write "Email: #{email}, Message: #{message}\n"
	f.close

	erb :contacts
end
