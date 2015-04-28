=begin
    Author:    JazzTamarin
    Date:      April 27, 2015

    Gets a list of page referrers and their amounts for the visior_source board.

    Currently, all data is test data.
=end

require_relative './GoogleAnalyticsHelper'

g = GoogleAnalyticsHelper.instance

SCHEDULER.every '4s' do
  # get latest from analytics
  update_web_visits
  # push to widget
  g.update_sources
  send_event('visitor_source', { items: g.source_counts.values })
end


