class FightpostTableViewCell < UITableViewCell
  attr_accessor :fightpost, :headingLabel, :sideLabel, :subLabel

  def initWithStyle(style, reuseIdentifier:reuseIdentifier)
    super 
    @layout = FightpostCellLayout.new(root: self).build
    @header = @layout.get(:header)
    @text_label = @layout.get(:text_label)


    @sideLabel = UIImageView.alloc.init

    # self.textLabel.adjustsFontSizeToFitWidth = true
    self.textLabel.textColor = UIColor.darkGrayColor
    # self.textLabel.text = UIFont.systemFontOfSize 12
    # self.detailTextLabel.numberOfLines = 0
    self.selectionStyle = UITableViewCellSelectionStyleGray

    self.contentView.addSubview(@sideLabel)

    self
  end

  def fightpost=(fightpost)
    @fightpost = fightpost

    @text_label.text = self.fightpost.user.username

    @sideLabel.url = {url: self.fightpost.video[:video].url, placeholder: UIImage.imageNamed("profile-image-placeholder")}

    # self.imageView.url = {url: self.fightpost.video[:video].url, placeholder: UIImage.imageNamed("profile-image-placeholder")}
    self.imageView.url = {url: self.fightpost.user.profile.avatar[:avatar].url, placeholder: UIImage.imageNamed("avatar")}

    self.setNeedsLayout 
    @fightpost
  end

  def self.heightForCellWithPost(fightposts)
    sizeToFit = fightposts.text.sizeWithFont(UIFont.systemFontOfSize(12), constrainedToSize: CGSizeMake(220, Float::MAX), lineBreakMode:UILineBreakModeWordWrap)
    
    return [70, sizeToFit.height + 45].max
  end

  def layoutSubviews
    super

    self.imageView.frame = CGRectMake(10, 10, 40, 40);
    # self.textLabel.frame = CGRectMake(10, 70, 240, 20);
    @sideLabel.frame = CGRectMake(10, 90, 240, 100);

    # detailTextLabelFrame = CGRectOffset(self.textLabel.frame, 0, 25);
    # detailTextLabelFrame.size.height = self.class.heightForCellWithPost(self.post) - 45
    # self.detailTextLabel.frame = detailTextLabelFrame
  end

end