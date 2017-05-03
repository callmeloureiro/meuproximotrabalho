class Painel::User::PaymentController < Painel::User::BaseController

  def create

    order = Order.find(params[:id])
    payment = PagSeguro::PaymentRequest.new

    payment.notification_url = notification_payment_url
    payment.redirect_url = painel_user_root_url(:pagseguro_retorno => true)

    payment.reference = order.id

    payment.items << {
      id: order.id,
      description: "MPT Premium - #{order.days} dias",
      amount: order.amount.to_s,
      quantity: 1
    }

    response = payment.register

    if response.errors.any?
      raise response.errors.join("\n")
    else
      render status: 200, json: response.url.to_json
    end

  end

end