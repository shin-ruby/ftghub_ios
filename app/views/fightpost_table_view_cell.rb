class FightpostTableViewCell < UITableViewCell
  attr_accessor :fightpost

  def initWithStyle(style, reuseIdentifier:reuseIdentifier)
    super 

    # self.textLabel.adjustsFontSizeToFitWidth = true
    self.textLabel.textColor = UIColor.darkGrayColor
    # self.textLabel.text = UIFont.systemFontOfSize 12
    # self.detailTextLabel.numberOfLines = 0
    self.selectionStyle = UITableViewCellSelectionStyleGray

    self
  end

  def fightpost=(fightpost)
    @fightpost = fightpost

    self.textLabel.text = self.fightpost.content
    self.imageView.url = {url: self.fightpost.video[:video].url, placeholder: UIImage.imageNamed("profile-image-placeholder")}
    self.setNeedsLayout 
    @fightpost
  end

  def self.heightForCellWithPost(fightposts)
    sizeToFit = fightposts.text.sizeWithFont(UIFont.systemFontOfSize(12), constrainedToSize: CGSizeMake(220, Float::MAX), lineBreakMode:UILineBreakModeWordWrap)
    
    return [70, sizeToFit.height + 45].max
  end

  def layoutSubviews
    super

    self.imageView.frame = CGRectMake(10, 10, 50, 50);
    self.textLabel.frame = CGRectMake(10, 70, 240, 20);

    # detailTextLabelFrame = CGRectOffset(self.textLabel.frame, 0, 25);
    # detailTextLabelFrame.size.height = self.class.heightForCellWithPost(self.post) - 45
    # self.detailTextLabel.frame = detailTextLabelFrame
  end

end