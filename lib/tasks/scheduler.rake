desc "Refresh all the Jawbone data"
task :refresh_jawbone => :environment do
  puts "Refreshing Jawbone data..."
  Sleep.refresh
  puts "done."
end
