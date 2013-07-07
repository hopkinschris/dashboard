desc "Refresh all the Jawbone data"
task :refresh_jawbone => :environment do
  puts "Refreshing Jawbone data..."
  Sleep.refresh
  Step.refresh
  Mood.refresh
  puts "done."
end
