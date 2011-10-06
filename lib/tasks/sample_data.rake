namespace :db do

  task :populate => :environment do
	  20.times do
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

  task :populate => :environment do
    admin = User.create!(:name => "Admin",
                         :email => "admin@csc517.com",
                         :password => "admin123",
                         :password_confirmation => "admin123")
    Admin.create!(:user_id => admin.id)

    User.create!(:name => "Pradeep",
                         :email => "prad@csc517.com",
                         :password => "prad123",
                         :password_confirmation => "prad123")
    User.create!(:name => "Sandeep",
                         :email => "san@csc517.com",
                         :password => "san123",
                         :password_confirmation => "san123")
    User.create!(:name => "Deepak",
                         :email => "deep@csc517.com",
                         :password => "deep123",
                         :password_confirmation => "deep123")
  end



 end
