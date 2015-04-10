class FootballServices::FootballServices
  include HTTParty
  base_uri ENV['football_services_host']

  def initialize
    @options = {}
    self.class.headers 'Content-type' =>  "application/json"
    self.class.headers 'Authorization' =>  "Token token=#{ENV['football_services_app_token']}"
  end

  def suscribe_player(player_info = {})
    response = self.class.post("/api/v1/players", body: {app_id: ENV['football_services_app_id'], unique_id: player_info[:unique_id],
                               first_name: player_info[:first_name], last_name: player_info[:last_name]}.to_json,
                               headers: { 'Content-Type' => 'application/json' })
    puts "GAMIFY RESPONSE"
    puts response.body
  end

end
