class UserMailer < ApplicationMailer

  default from: 'no-reply@the-event-project.fr'

  def welcome_email(user)
    @user = user 

    @url  = 'http://monsite.fr/login' 

    mail(to: @user.email, subject: 'Bienvenue chez nous !') 
  end

  def attendance_email(attendance)
    @event = attendance.event

    @participant = attendance.user

    mail(to: @event.admin.email, subject: "Nouvelle participation à l'événement #{@event.title} 🎉")
  end

end