user = User.create!(username:  "hoge1",
                    email: "hoge1@hoge.com",
                    password:              "aaaa1111",
                    password_confirmation: "aaaa1111")

image_path = File.join(Rails.root, "test/fixtures/images/profile-1.jpg")

user.profile.update!(age: 29,
                     job: "Webマーケター",
                     introduce: "よろしくお願いします！",
                     avatar: File.new(image_path),
                     nickname: "まっちゃん",
                     user_id: 1)

19.times do |n|
  username  = "hoge#{n+2}"
  email = "hoge#{n+2}@hoge.com"
  user = User.create!(username: username,
                      email: email,
                      password:              "aaaa1111",
                      password_confirmation: "aaaa1111")
  image_path = File.join(Rails.root, "test/fixtures/images/profile-#{n+2}.jpg")
  user.profile.update!(age: "#{n+30}",
                       job: "Webマーケター",
                       introduce: "よろしくお願いします！",
                       avatar: File.new(image_path),
                       nickname: "まっちゃん",
                       user_id: "#{n+2}")
end

5.times do |n|
  image_path = File.join(Rails.root, "test/fixtures/images/photo-#{n+1}.png")

  Photo.create!(image: File.new(image_path),
  user_id: 1)
end
