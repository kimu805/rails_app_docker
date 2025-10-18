user = User.create(name: "test1", email: "test1@test.com", password: "111111", password_confirmation: "111111")

100.times do |i|
  user.tasks.create(name: "サンプルタスク#{i}")
end
