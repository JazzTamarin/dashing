=begin
	Author:    JazzTamarin
	Date:      April 27, 2015

    The RealTimeAnalyticsHelper is a Singleton that interacts with the Google
    Real Time Analytics API on behalf of jobs.

    Currently, all data is test data.
=end


class RealTimeAnalyticsHelper

    # construct the GoogleAnalyticsHelper
	def initialize
	end
    attr_reader 

    # create Singleton instance
	@@instance = RealTimeAnalyticsHelper.new

    # call to get Singleton instance
	def self.instance
		return @@instance
	end

    # makes new private so Singleton is enforced
	 private_class_method :new

end
