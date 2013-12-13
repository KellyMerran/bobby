class ClientNotifier < ActionMailer::Base
  default from: "bobbyinfos@gmail.com"

  def end_of_depot(client)
    @client = client
    mail to: client.email, reply_to: "bobbyinfos@gmail.com", subject: "FIN DE VOTRE DEPOT"
  end

end
