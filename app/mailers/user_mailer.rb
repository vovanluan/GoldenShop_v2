class UserMailer < ApplicationMailer
	default from: 'vovanluan201294@gmail.com'

  def checkout_email(user)
    @user = user
		mail(:to => user.email, :subject => "Checked out successfully")
  end

end
