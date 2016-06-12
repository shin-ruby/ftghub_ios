class User
  attr_accessor :username, :email, :authentication_token, :profile

  def initialize(user)
    @username = user['username']
    @email = user['email']
    @authentication_token = user['authentication_token']
    self.profile = Profile.new(user["profile"])
  end

  def self.recent(&block)
    AFMotion::SessionClient.shared.get('api/v1/users/1.json') do |result|
      if result.success?
        json = result.object
        users = User.new(json)
        block.call(users)
      else
        raise result.error.localizedDescription
      end
    end
  end

  # def save_token(email, authentication_token)
  #   App::Persistence['email'] = email
  #   App::Persistence['authentication_token'] = authentication_token
  # end

  # def load_email
  #   App::Persistence['email']
  # end

  # def load_token
  #   App::Persistence['authentication_token']
  # end

  # def reset
  #   App::Persistence['email'] = nil
  #   App::Persistence['authentication_token'] = nil
  # end
end