class Fightpost
  PROPERTIES = [:id, :content, :user_id, :video] 
  PROPERTIES.each do |prop|
    attr_accessor prop
  end

  def initialize(properties = {}) 
    properties.each do |key, value|
      if PROPERTIES.member? key.to_sym 
        self.send("#{key}=", value)
      end
    end 
  end

  def self.recent(&block)
    AFMotion::SessionClient.shared.get('api/v1/fightposts.json?user_id=1') do |result|
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