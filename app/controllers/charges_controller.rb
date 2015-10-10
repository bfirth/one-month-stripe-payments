class ChargesController < ApplicationController

  def create
    # Amount in cents
    @amount = 500

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => params[:stripeAmount],
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

    purchase = Purchase.create(email: params[:stripeEmail],
      card: params[:stripeToken], amount: charge.amount,
      description: charge.description, currency: charge.currency,
      customer_id: charge.customer, product_id: 1, uuid: SecureRandom.uuid)
      
    redirect_to purchase
    
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end

end
