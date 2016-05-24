class User
  attr_accessor :username, :email

  def initialize(user)
    @username = user['username']
    @email = user['email']
  end

  def self.recent(&block)
    # client = AFMotion::SessionClient.build("http://localhost:3000/api/v1/") do
    #   session_configuration :default
    #   header "Accept", "application/json"
    #   response_serializer :json
    # end
    # client.get("users/1.json") do |result|
    #   if result.success?
    #     json = result.object
    #     users = User.new(json)
    #     block.call(users)
    #   else
    #     raise result.error.localizedDescription
    #   end
    # end
    AFMotion::SessionClient.shared.get('users/1.json') do |result|
      if result.success?
        json = result.object
        users = User.new(json)
        block.call(users)
      else
        raise result.error.localizedDescription
      end
    end
  end
end