class ExcerptObserver < ActiveRecord::Observer
  def after_create(excerpt)
    User.subscribers.each do | subscriber |
      Notifier.new_excerpt(subscriber.id, excerpt.id).deliver
    end
  end
end
