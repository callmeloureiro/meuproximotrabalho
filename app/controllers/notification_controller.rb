class NotificationController < ActionController::Base
  protect_from_forgery with: :null_session, only: :create
  
  def create
    transaction = PagSeguro::Transaction.find_by_notification_code(params[:notificationCode])
    if transaction.errors.empty?
      order = Order.find(transaction.reference)
      user = User.find(order.user.id)
      order.order_status = transaction.status.id.to_i
      if transaction.status.id == "1" && order.order_status != 1
        NotificationMailer.pedido_feito(user, order).deliver_now
      end
      if transaction.status.id == "3" && order.order_status != 3
        NotificationMailer.pagamento_aprovado(user, order).deliver_now
        if user.premium_expires?
          user.premium_expires = user.premium_expires + order.days.days
        else
          user.premium_expires = order.days.days.from_now
        end
        user.user_premium = true
        order.active = true
      end
      order.save!
      user.save!
    end
    render nothing: true, status: 200
  end

end