require_relative './GoogleAnalyticsHelper'

$g = GoogleAnalyticsHelper.instance
$current_visits = $g.get_web_visits($g.current_start_day, $g.today)
$previous_visits = $g.get_web_visits($g.previous_start_day, $g.current_start_day)

def push_titles
  today = $g.today.strftime("%b%d")
  previous = $g.current_start_day.strftime("%b%d")
  before = $g.previous_start_day.strftime("%b%d")
  send_event('page_visits', { current_title: previous.to_s + ' to ' + today, last_title: before.to_s + ' to ' + previous })
end

def update_web_visits
  $current_visits = $g.get_web_visits($g.current_start_day, $g.today)
  $previous_visits = $g.get_web_visits($g.previous_start_day, $g.current_start_day)
end

push_titles

SCHEDULER.every '4s' do
  # check if date has changed
  temp = Time.now
  if temp.day != $g.today.day
    $g.update_times
    push_titles
  end
  # get latest from analytics
  update_web_visits
  # push to widget
  send_event('page_visits', { current: $current_visits, last: $previous_visits })
end


