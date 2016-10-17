class Payment < ApplicationRecord
  belongs_to :booking
  belongs_to :bank_account

  def paypal_url return_path
    values = {
      business: ENV["facilitator_paypal"],
      return: "#{Rails.application.secrets.app_host}#{return_path}",
      notify_url: "#{Rails.application.secrets.app_host}/update",
      invoice: id,
      cmd: "_xclick",
      amount: amount,
    }
    "#{Rails.application.secrets.paypal_host}/cgi-bin/webscr?" +
      values.to_query
  end
end
