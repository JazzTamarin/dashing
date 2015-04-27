MONTH = 60 * 60 * 24 * 30
#Source_Counts = Hash.new({ value: 0 })


class GoogleAnalyticsHelper

	def initialize
		@today = Time.now
		@current_start_day = @today - MONTH
		@previous_start_day = @current_start_day - MONTH
		@sources = ['Yahoo', 'Google', 'Blog Traffic', 'Direct Traffic', 'Other'] 
		@source_counts = Hash.new({ value: 0 })		
	end

attr_reader :today, :current_start_day, :previous_start_day, :source_counts
	@@instance = GoogleAnalyticsHelper.new

	def self.instance
		return @@instance
	end

	def update_times
		@today = Time.now
		@current_start_day = @today - MONTH
		@previous_start_day = @current_start_day - MONTH
	end

	def get_web_visits(start, finish)
		5000 + rand(500)
	end

	def update_sources
	  @sources.each { |s| @source_counts[s] = { label: s, value: rand(100) } }    
	end

	 private_class_method :new

end
