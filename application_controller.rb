require 'bundler'
Bundler.require

require_relative 'models/other_model.rb'

class MyApp < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/quiz' do
    erb :quiz
  end

	post '/results' do
    new_answer = Quiz.new(params)
    new_answer.add
    new_answer.pick_hobby
    @hobby_list=new_answer.hobby_array
		erb :results
	end

   get '/about' do
    erb :about
  end

end