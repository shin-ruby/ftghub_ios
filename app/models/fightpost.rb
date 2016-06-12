class Fightpost
  # PROPERTIES = [:id, :content, :user_id, :video] 
  # PROPERTIES.each do |prop|
  #   attr_accessor prop
  # end

  # def initialize(properties = {}) 
  #   properties.each do |key, value|
  #     if PROPERTIES.member? key.to_sym 
  #       self.send("#{key}=", value)
  #     end
  #   end 
  # end

  attr_accessor :id, :content, :video, :profile, :user

  def initialize(fightpost)
    @id = fightpost['id']
    @content = fightpost['content']
    @video = fightpost['video']
    # self.profile = Profile.new(fightpost["profile"])
    self.user = User.new(fightpost["user"])
  end


  # ActiveRecord “find all” method
  def self.recent(&block)
    AFMotion::SessionClient.shared.get('api/v1/fightposts.json') do |result|
      if result.success?
        fightposts = []
        result.object.each do |hash|
          fightposts << Fightpost.new(hash)
        end
        block.call(fightposts)
      else
        raise result.error.localizedDescription
      end
    end
  end

end