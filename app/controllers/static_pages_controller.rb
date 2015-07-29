class StaticPagesController < ApplicationController
	def home
		@client= Twitter::REST::Client.new do |config|
			config.consumer_key        = ENV["TWEETER_KEY" ]
			config.consumer_secret     = ENV["TWEETER_SECRET" ]
		end

	end

	def about
	end

	def contact
	end
end
