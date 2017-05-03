class Painel::User::CheckoutController < Painel::User::BaseController

  def create
    @product = Premium.find(params[:id])
    @order = Order.new
    @order.user_id = current_user.id
    @order.amount = @product.price
    @order.days = @product.days
    respond_to do |f|
      if @order.save
        f.html { redirect_to :controller => "painel/user/payment", :action => "create", :id => @order.id }
      end
    end
  end

end