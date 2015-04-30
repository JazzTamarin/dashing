p1 = [22.264157, -123.105387]
p2 = [-15.264157, -103.105387]
points = [p1, p2]
puts 'hahahahaha'
SCHEDULER.every '15s' do
    send_event('map', { markers: points })
end