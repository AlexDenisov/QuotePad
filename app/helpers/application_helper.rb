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
    raw "<span class='badge rating #{rating_helper(excerpt.rating)}' data-id='#{excerpt.id}'>#{excerpt.rating}</span>"
  end

  def vote_down_link(excerpt)
    icon = raw("<i class='icon-thumbs-down'></i>")
    if current_user.disliked.include? excerpt
      return icon
    end
    link_to icon,
            vote_down_excerpt_path(excerpt), 
            :id => "down_#{excerpt.id}", 
            :remote => true, 
            :method => :put
  end

  def vote_up_link(excerpt)
    icon = raw("<i class='icon-thumbs-up'></i>")
    if current_user.liked.include? excerpt
      return icon
    end
    link_to icon,
            vote_up_excerpt_path(excerpt), 
            :id => "up_#{excerpt.id}", 
            :remote => true, 
            :method => :put
  end
end
