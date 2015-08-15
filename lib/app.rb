require "Sinatra"
require "sinatra/flash"
require "mongoid"

require_relative "models/issue"

class App < Sinatra::Base
	enable :sessions
	register Sinatra::Flash
	get "/" do 
		redirect "/issues"
	end

	get "/issues" do 
		@issues = Issue.all
		haml :"issues/index"
	end

	get "/issues/new" do 
		@issues = Issue.all
		haml :"issues/new"
	end

	post "/issues" do 
		@issues = Issue.new params[:issue]
		if @issue.save
			redirect "/"
		end
	end
end