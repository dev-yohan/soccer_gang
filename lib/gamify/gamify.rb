class Gamify::Gamify
  include HTTParty
  base_uri ENV['gamify_host']

  def initialize
    @options = {}
    self.class.headers 'Content-type' =>  "application/json"
    self.class.headers 'Authorization' =>  "Token token=#{ENV['gamify_app_token']}"
  end

  def apps
    response = self.class.get("/api/v1/apps")
    puts "GAMIFY RESPONSE"
    puts response.body
  end

  def app(id)
    response = self.class.get("/api/v1/apps/#{id}")
    puts "GAMIFY RESPONSE"
    puts response.body
  end

  def activities(id)
    response = self.class.get("/api/v1/app_activities/#{id}")
    puts "GAMIFY RESPONSE"
    puts response.body
  end

end
