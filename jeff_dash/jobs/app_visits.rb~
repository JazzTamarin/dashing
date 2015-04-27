require_relative './GoogleAnalyticsHelper'

$gApp = GoogleAnalyticsHelper.instance
$current_app_visits = $gApp.get_app_visits($gApp.current_start_day, $gApp.today)
$previous_app_visits = $gApp.get_app_visits($gApp.previous_start_day, $gApp.current_start_day)

def update_app_visits
  $current_app_visits = $gApp.get_app_visits($gApp.current_start_day, $gApp.today)
  $previous_app_visits = $gApp.get_app_visits($gApp.previous_start_day, $gApp.current_start_day)
end

def push_titles
  today = $gApp.today.strftime("%b%d")
  previous = $gApp.current_start_day.strftime("%b%d")
  before = $gApp.previous_start_day.strftime("%b%d")
  send_event('app_visits', { current_title: previous.to_s + ' to ' + today, last_title: before.to_s + ' to ' + previous })
end

push_titles

SCHEDULER.every '4s' do
  # check if date has changed
  temp = Time.now
  if temp.day != $gApp.today.day
    $gApp.update_times
  end
  # get latest from analytics
  push_titles
  update_app_visits
  # push to widget
  send_event('app_visits', { current: $current_app_visits, last: $previous_app_visits })
end


