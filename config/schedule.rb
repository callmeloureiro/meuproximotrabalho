# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

# Ele posta uma hora a mais, exeplo: se eu colocar 14 horas, ele vai postar 15 horas

every '*/15 7-22 * * *' do
  rake "facebook:add_post_ana"
end

every '7 9,13,18,20 * * *' do
  rake "facebook:add_post_lou"
end

every '* * * * *' do
  rake "facebook:add_post"
  rake "mpt:add_post"
end

every '*/10 * * * *' do
  rake "mautic:add_lead"
end
