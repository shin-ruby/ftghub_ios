# class SessionResult
#   def success?
#     true
#   end

#   def object
#     [{id: 1}, {id: 2}]
#   end
# end

# class SessionClientSim
#   def self.get(&block)
#     block.call(SessionResult.new)
#   end
# end

# class Post

#   attr_accessor :id

#   def initialize(props = {})
#     self.id = props[:id]
#   end

#   def self.recent(&block)
#     SessionClientSim.get do |result|
#       if result.success?
#         fightposts = []
#         result.object.each do |hash|
#           fightposts << Post.new(hash)
#         end
#         block.call(fightposts)
#       end
#     end
#   end

#   def inspect
#     "id: #{id}"
#   end
# end

# class HomeController
#   def reload
#     Fightpost.recent do |posts|
#       puts "Post.recent: #{posts}"
#       @instance_posts = posts 
#       puts "instance_posts in block: #{@instance_posts}"
#     end

#     puts "instance_posts after: #{@instance_posts}"
#   end

# end

# hc = HomeController.new 
# hc.reload