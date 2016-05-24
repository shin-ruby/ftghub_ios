class Profile
  attr_accessor :name, :bio, :avatar

  def initialize(profile)
    @name = profile['name']
    @bio = profile['bio']
    @avatar = profile['avatar']
  end

end