class UserObserver < ActiveRecord::Observer
  def after_create(user)
    Notifier.new_user(user.email, user.password).deliver
  end
end

