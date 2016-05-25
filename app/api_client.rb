class ApiClient

  def initialize
    @client =  AFMotion::SessionClient.build('http://localhost:3000/') do
      header "Accept", "application/json"

      response_serializer :json
    end
  end

  def token(email, password, &block)
    @client.post("users/login.json", user: { email: email, password: password }) do |result|
      block.call(result.object)
    end
  end

end