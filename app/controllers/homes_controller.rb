class HomesController < UIViewController

  def init
    super 
    self.title = 'Home'
    self
  end

  def viewDidLoad
    view.backgroundColor = UIColor.whiteColor
  end

end