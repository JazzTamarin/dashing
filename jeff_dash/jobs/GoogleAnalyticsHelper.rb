MONTH = 60 * 60 * 24 * 30

class GoogleAnalyticsHelper

	def initialize
		@today = Time.now
		@current_start_day = @today - MONTH
		@previous_start_day = @current_start_day - MONTH
	end
attr_reader :today, :current_start_day, :previous_start_day, :current_web_visits, :previous_web_visits

	def update_times
		@today = Time.now
		@current_start_day = @today - MONTH
		@previous_start_day = @current_start_day - MONTH
	end

	def get_web_visits(start, finish)
		5000 + rand(500)
	end

end
