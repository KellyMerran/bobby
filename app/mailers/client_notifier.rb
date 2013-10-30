class ClientNotifier < ActionMailer::Base
  default from: "info@tastersclub.com"
  default to: "info@tastersclub.com"

  def end_of_depot(client)
    @client = client
    mail to: "mackmcconnell@gmail.com", reply_to: "info@tastersclub.com", subject: "Sold all your shit!"
  end

end
