class HomeController < ApplicationController
	def index
		# unless current_user.nil?
			@posts = Post.all
		# else
			# redirect_to user_session_path
		# end
	end
end
