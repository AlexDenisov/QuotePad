namespace :db do
  desc "Erase and fill database"
  task :populate => [:environment, :seed] do
    require 'populator'
    require 'faker'
    
    [Excerpt].each(&:delete_all)

    user = User.first
    Excerpt.populate 5 do |excerpt|
        excerpt.user_id = user.id
        excerpt.rating = rand(0..15)
        excerpt.content = Populator.words(1..5).titleize
    end
  end
end

