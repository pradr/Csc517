
 namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
          50.times do
            User.all(:limit => 6).each do |user|
              user.microposts.create!(:content => Faker::Lorem.sentence(5))
            end
          end
  end
  task :populate => :environment do
          5.times do
            Micropost.all(:limit => 6).each do |post|
              post.comments.create!(:content => Faker::Lorem.sentence(5), :user_id => 1)
            end
          end
  end

desc "Fill database with sample data"
  task :populate => :environment do
#    Rake::Task['db:reset'].invoke
    admin = User.create!(:name => "Admin",
                         :email => "admin@csc517.org",
                         :password => "admin123",
                         :password_confirmation => "admin123")
        Admin.create!(:user_id => admin.id)
#    admin.toggle!(:admin)
    admin = User.create!(:name => "Example User",
                         :email => "example2@csc517.org",
                         :password => "foobar",
                         :password_confirmation => "foobar")
    admin = User.create!(:name => "Example User",
                         :email => "example3@csc517.org",
                         :password => "foobar",
                         :password_confirmation => "foobar")
    admin = User.create!(:name => "Example User",
                         :email => "example4@csc517.org",
                         :password => "foobar",
                         :password_confirmation => "foobar")
    admin = User.create!(:name => "Example User",
                         :email => "example5@csc517.org",
                         :password => "foobar",
                         :password_confirmation => "foobar")
  end
end
