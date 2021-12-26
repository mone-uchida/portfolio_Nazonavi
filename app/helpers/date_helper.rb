module DateHelper
  def start_at_show(event)
    if event.start_at.present?
      event.start_at.strftime('%Y年%m月%d日')
    else
      "-"
    end
  end

  def finish_at_show(event)
    if event.finish_at.present?
      event.finish_at.strftime('%Y年%m月%d日')
    else
      "-"
    end
  end

  def created_at_show(post)
    post.created_at.strftime('%m月%d日 %H:%M')
  end
end
