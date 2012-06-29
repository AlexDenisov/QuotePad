class Notifier
  @queue = :new_excerpt_notifier
  def self.perform(excerpt_id)
    excerpt = Excerpt.find excerpt_id
    User.subscribers.each do | subscriber |
      ExcerptMailer.new_excerpt(subscriber, excerpt).deliver
    end
  end
end

