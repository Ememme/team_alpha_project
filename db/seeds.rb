require 'ffaker'

if User.count < 30
  puts "Creating users..."
  30.times do
   User.create!(
      first_name: FFaker::Name.first_name,
      last_name: FFaker::Name.last_name,
      login: FFaker::NameTHEN.nick_name,
      email: FFaker::Internet.email,
      password: FFaker::Internet.password
    )
   print '*'
  end
  puts "30 new users created!"
end

# Seeds for Books

if Book.count < 30
  puts "Creating books..."
  users = User.all
  30.times do
    Book.create!(
      title: FFaker::Book.title,
      author: FFaker::Book.author,
      description: FFaker::Book.description,
      owner: users.sample,
      borrower: users.sample
    )
    print "*"
  end
  puts "30 books created"
end
