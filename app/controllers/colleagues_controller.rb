class ColleaguesController < ApplicationController
	
  	before_action :authenticate_user!
  	def index
	    @colleagues = User.all
	end
end
