require "./lib/github.rb"

if ARGV[0]
  github = Github.new ARGV[0]
  github.display_favourites_languages
else
  puts "[Error] You must specify a username."
  puts "Usage : ruby app.rb username"
end