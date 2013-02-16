# coding: utf-8

ActiveRecord::Base.transaction do
  20.times do |index|
    item =
      Item.create!(
        :title => "#{Faker::Lorem.sentence} – #{index}",
        :text => Faker::Lorem.paragraphs.join("\n")
      )

    rand(10).times do |index|
      item.pics.create!(
        :attach => File.open("#{Rails.root}/test/fixtures/pic.jpg")
      )
    end

    puts "Created item [#{item.id}] – #{item.title}"
  end

  email = "admin@skeleton.org"
  password = Digest::MD5.hexdigest("#{Time.now.to_i}-#{rand(1000)}")
  admin_user =
    AdminUser.create!(
      :name => "Super Admin",
      :email => email,
      :password => password,
      :password_confirmation => password
    )

  puts "AdminUser created #{email}/#{password}"
end