class ContactMailer < ApplicationMailer

  def send_when_member_report(member)
  #メソッドに対して引数を設定
  #ユーザー情報
  #返信内容
    @name1 = member.last_name + member.first_name
    mail(to: "r.hashiwbc8091025@gmail.com",
         subject: '通報'
         )
  end


end
