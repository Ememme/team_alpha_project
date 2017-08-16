require 'ffaker'

if User.count < 200
  puts "Creating users..."
  20.times do
   User.create!(
      first_name: FFaker::Name.first_name,
      last_name: FFaker::Name.last_name,
      login: FFaker::NameTHEN.nick_name,
      email: FFaker::Internet.email,
      password: FFaker::Internet.password,
      avatar: FFaker::Avatar.image
    )
   print '*'
  end
  puts "20 new users created!"
end

# Seeds for Books

if Book.count < 200
  puts "Creating books..."
  users = User.all
  30.times do
    Book.create!(
      title: FFaker::Book.title,
      author: FFaker::Book.author,
      description: FFaker::Book.description,
      user: users.sample,
      cover: File.open(Rails.root + "public/uploads/#{rand(1..6)}.jpg"),
    )
    print "*"
  end
  puts "30 books created"
end

# TODO Seeds for Loans

# if Loan.count < 100
#   puts "Creating loans..."
#   users = User.all
#   books = Book.all
#   30.times do
#     Loan.create!(
#       book_id: books.sample,
#       user_id: users.sample,
#       #status:
#     )
#     print "*"
#   end
#   puts "30 loans created"
# end
