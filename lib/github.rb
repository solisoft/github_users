class Github
  require 'net/http'
  require 'json'

  def initialize(login = "")
    @login = login
  end

  def favourites_languages
    json = load_json
    
    favourites = {}  
    json.each do |l| 

      if l.class.to_s == "Hash"
        if l["language"].to_s.strip != ""
          favourites[l["language"]] ||= 0
          favourites[l["language"]] += 1
        end
      end
    end
    favourites
  end

  def display_favourites_languages
    favourites = favourites_languages
    puts "#{@login}'s favourites languages :"
    favourites.sort_by {|k, v| v }.reverse.each_with_index do |item, i|
      puts "##{i + 1} : #{item[0]} (#{item[1]})"
    end
  end

private
  def load_json
    uri = URI.parse("https://api.github.com/users/#{@login}/repos")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)
    JSON.parse(response.body)
  end
end
