=begin
    Author:    JazzTamarin
    Date:      April 27, 2015

    Currently, all data is test data.
=end

require_relative './GoogleAnalyticsHelper'


@g = GoogleAnalyticsHelper.instance

#pushes date based titles to board
def push_titles
  today = @g.today.strftime("%b%d")
  previous = @g.current_start_day.strftime("%b%d")
  send_event('visitor_os', { title: previous.to_s + ' to ' + today })
end

push_titles

SCHEDULER.every '4s' do
  # check if date has changed
  temp = Time.now
  if temp.day != @g.today.day
    @g.update_times
    push_titles
  end
  # push to widget
  @g.update_visitor_os(@g.current_start_day, @g.today)
  data = @g.visitor_os_counts
  total = 0
  data.each { |k, v| total += v[:value]}
	puts "total " + total.to_s
  data.each { |k, v| v[:value] = (v[:value].to_f / total * 100).round(2) }

 send_event('visitor_os', { value: data.values})
#send_event('visitor_os', { value: data })
end


