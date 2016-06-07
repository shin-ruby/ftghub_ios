class HomesController < UITableViewController
  attr_accessor :fightposts
  attr_accessor :activityIndicatorView

  def reload
    self.activityIndicatorView.startAnimating #load动画效果
    self.navigationItem.rightBarButtonItem.enabled = true

    Fightpost.recent do |fightposts|
      self.fightposts = fightposts

      self.activityIndicatorView.stopAnimating
      self.navigationItem.rightBarButtonItem.enabled = true
    end
  end

  def fightposts
    @fightposts ||= []
  end

  def fightposts=(fightposts)
    @fightposts = fightposts
    self.tableView.reloadData
    @fightposts
  end

  def loadView
    super
    #load动画效果
    self.activityIndicatorView = UIActivityIndicatorView.alloc.initWithActivityIndicatorStyle(UIActivityIndicatorViewStyleWhite)
    self.activityIndicatorView.hidesWhenStopped = true
  end

  def viewDidLoad
    super 

    self.title = 'Home'

    self.navigationItem.leftBarButtonItem = UIBarButtonItem.alloc.initWithCustomView(self.activityIndicatorView)
    self.navigationItem.rightBarButtonItem = UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemRefresh, target:self, action: 'reload')

    self.tableView.rowHeight = 200
    self.reload

  end


  def viewDidUnload
    self.activityIndicatorView = nil

    super
  end

  def tableView(tableView, numberOfRowsInSection:section)
    self.fightposts.count
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    @@identifier ||= "CELL_IDENTIFIER"

    cell = tableView.dequeueReusableCellWithIdentifier(@@identifier) || begin
      FightpostTableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier: @@identifier)
    end  
    cell.fightpost = self.fightposts[indexPath.row]

    cell  
  end

  # def tableView(tableView, heightForRowAtIndexPath:indexPath)
  #   FightpostTableViewCell.heightForCellWithPost(self.fightposts[indexPath.row])
  # end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    tableView.deselectRowAtIndexPath(indexPath, animated:true)
  end

end