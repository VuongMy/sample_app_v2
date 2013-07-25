namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    #co the dat admin giong o Listing 9.41
    admin = User.create!(name: "Vuong My",
                 email: "vuongmy91@gmail.com",
                 password: "vuongmy112",
                 password_confirmation: "vuongmy112",
                 admin: true)
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