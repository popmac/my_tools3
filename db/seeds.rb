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

Tool.create!(name: "Atom")

Review.create!(review: "最初はsublime textを使っていましたが、試しにAtomを使ってみたら、いつの間にかこちらがメインになっていました。",
               user_id: 1,
               tool_id: 1,
               likes_count: 0,
               rate: 90)

Comment.create!(comment: "僕も使っています！",
                user_id: 2,
                review_id: 1)

Like.create!(user_id: 2,
             review_id: 1)
