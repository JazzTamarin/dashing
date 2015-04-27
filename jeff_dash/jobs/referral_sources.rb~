require_relative './GoogleAnalyticsHelper'

$gref = GoogleAnalyticsHelper.instance

SCHEDULER.every '4s' do
  # get latest from analytics
  update_web_visits
  # push to widget
  $gref.update_sources
  send_event('visitor_source', { items: $gref.source_counts.values })
end


