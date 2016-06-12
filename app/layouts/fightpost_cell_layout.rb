class FightpostCellLayout < MotionKit::Layout

  def layout
    root :cell do
      add UIView, :header do
        background_color UIColor.yellowColor
        add UILabel, :text_label
      end
    end
  end

  def header_style   
    constraints do
      top_left x: 20, y:40
      height 70
      width 200
    end
  end

  def text_label_style
    numberOfLines 0
    
    constraints do
      left.equals(:superview).plus(10)
      right.equals(:superview).minus(10)
      top.equals(:superview).plus(10)
      bottom.equals(:superview).minus(10)
    end
  end

end