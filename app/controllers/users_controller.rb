class UsersController < UIViewController

  def init
    super 
    self.title = 'User'
    self
  end

  def viewDidLoad
    super 
    add_users
    view.backgroundColor = UIColor.whiteColor
  end

  def add_users
    User.recent do |users|
      @label = UILabel.alloc.init
      @label.frame = [[150, 150], [250, 30]]
      @label.text = users.email
      view.addSubview(@label)
    end
  end

end