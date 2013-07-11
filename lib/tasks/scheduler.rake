desc "Refresh all the Jawbone data"
task :refresh_jawbone => :environment do
  puts "Refreshing Jawbone data..."
  Sleep.refresh
  puts "* Sleep data refreshed."
  Step.refresh
  puts "* Step data refreshed."
  Calorie.refresh
  puts "* Calorie data refreshed."
  Mood.refresh
  puts "* Mood data refreshed."
  puts "done."
end

desc "Refresh all the Withings data"
task :refresh_withings => :environment do
  puts "Refreshing Withings data..."
  Weight.refresh
  puts "* Weight data refreshed."
  puts "done."
end
