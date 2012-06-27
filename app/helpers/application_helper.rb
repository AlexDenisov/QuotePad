module ApplicationHelper
  def rating_helper(rating)
    return "badge-success" if rating > 0
    return "badge-important" if rating < 0
  end

  def author_link(excerpt)
    author_name = excerpt.author_name
    if excerpt.user.nil?
      author_name
    else
      link_to author_name, user_path(excerpt.user)
    end
  end

  def rating_badge(excerpt)
    raw_span("rating badge #{rating_helper(excerpt.rating)}", excerpt.id, excerpt.rating)
  end

  def vote_down_link(excerpt)
    if current_user.disliked.include? excerpt
      content = icon_down
    else
      content = vote_link(vote_down_excerpt_path(excerpt), icon_down, 'vote_down')
    end
    raw_span('down', excerpt.id, content)
  end

  def vote_up_link(excerpt)
    if current_user.liked.include? excerpt
      content = icon_up
    else
      content = vote_link(vote_up_excerpt_path(excerpt), icon_up, 'vote_up')
    end
    raw_span('up', excerpt.id, content)
  end

  def raw_span(span_class, data_id, content)
    raw "<span class='#{span_class}' data-id='#{data_id}'>#{content}</span>"
  end

  def icon_down
    icon 'down'
  end
  
  def icon_up
    icon 'up'
  end

  def icon(type)
    "<i class='icon-thumbs-#{type}'></i>"
  end

  def vote_link(url, icon, type)
    "<a href=#{url} data-method='put' data-remote='true' id='#{type}'>#{icon}</a>"
  end

end
