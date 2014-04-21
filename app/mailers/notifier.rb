class Notifier < ActionMailer::Base
  default from: 'Life Hospital'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.registration.subject
  #
  def registration(name,email)
    @greeting = "Hi"
    @name = name

    mail to: email, subject: 'Welcome to Life Hospital!'
  end
end
