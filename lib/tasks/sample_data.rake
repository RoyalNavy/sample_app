namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Ming Gao",
                 email: "minggao92@gmail.com",
                 password: "2930022m",
                 password_confirmation: "2930022m", admin: true)
    
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
    
  users = User.all(limit: 6)
    50.times do
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.microposts.create!(content: content) }
    end  
    
  end
end