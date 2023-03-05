# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  email: 'a@a',
  password: 'aaaaaa',
  password_confirmation: 'aaaaaa'
)


#members = Member.create!(
  #[
    #{email: 'hashimoto@ryo', last_name: '橋本', first_name: '瞭', old: '23', birthday: '10月25日', sex: '男', telephone_number: '000-0000-0000', introduction: '野球が大好きです。小学校から高校まで外野手をやっていました。', password: 'hashimotoryo', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")},
    #{email: 'hashimoto@mako', last_name: '橋本', first_name: '真亜子', old: '24', birthday: '10月4日', sex: '女', telephone_number: '000-0000-0000', introduction: '野球が大好きです。ソフトボール経験があるので少しやってみたいです。よろしくお願いします。', password: 'hashimotomako', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")}
  #]
#)

#Recruit.create!(
  #[

    #{title: '初心者大歓迎', team: 'はっしー', place: '江戸川河川敷', area: '', day_and_time: '', team_level: '', post_period: '30日', content: '誰でも大歓迎です。人数が足りないためどなたか野球をやあ宛て見たい方がいればぜひ!!服装は自由です。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg"), caption: '大人気のカフェです。', user_id: users[0].id },
    #{title: '性別問わず大募集', team: 'まこ', place: '松戸中学校', area: '', day_and_time: '', team_level: '', post_period: '20日', content: '練習試合を計画中です。みんなで楽しくワイワイやりたいです。待っています', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), filename:"sample-post2.jpg"), caption: '大人気のカフェです。', user_id: users[0].id }
  #]
#)