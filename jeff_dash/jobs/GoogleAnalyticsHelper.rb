=begin
	Author:    JazzTamarin
	Date:      April 27, 2015

    The GoogleAnalyticsHelper is a Singleton that interacts with the Google
    Analytics API on behalf of jobs.  It also provides provides a centralized
    time tracking service.

    Currently, all data is test data.
=end

MONTH = 60 * 60 * 24 * 30


class GoogleAnalyticsHelper

    # construct the GoogleAnalyticsHelper
	def initialize
		@visitor_os = ['Linux','Android','ios','Windows']
        @visitor_os_counts = Hash.new({ value: 0 })
		@today = Time.now
		@current_start_day = @today - MONTH
		@previous_start_day = @current_start_day - MONTH
		@sources = ['Yahoo', 'Google', 'Blog Traffic', 'Direct Traffic', 'Other'] 
		@source_counts = Hash.new({ value: 0 })
	end
    attr_reader :visitor_os, :visitor_os_counts, :today, :current_start_day, :previous_start_day, :source_counts

    # create Singleton instance
	@@instance = GoogleAnalyticsHelper.new

    # call to get Singleton instance
	def self.instance
		return @@instance
	end

    # updates the time variables
	def update_times
		@today = Time.now
		@current_start_day = @today - MONTH
		@previous_start_day = @current_start_day - MONTH
	end

    # function to return the amount of unique web visits between <start> and <finish>
    # needs to be hooked in to real data
	def get_web_visits(start, finish)
		5000 + rand(1000)
	end

    # function to return the amount of unique app visits between <start> and <finish>
    # needs to be hooked in to real data
	def get_app_visits(start, finish)
		5000 + rand(500)
	end

    # function to get the location and amount/location of page referrals
    # needs to be hooked in to real data
	def update_sources
	  @sources.each { |s| @source_counts[s] = { label: s, value: rand(100) } }   
	end

    # function to return the amount of visitor os between <start> and <finish>
    # needs to be hooked in to real data
	def update_visitor_os(start, finish)
		@visitor_os.each { |v| @visitor_os_counts[v] = { label: v, value: rand(100) } }  
	end

    # makes new private so Singleton is enforced
	 private_class_method :new

end
