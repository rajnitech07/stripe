class ChargesController < ApplicationController
  def new
  	@amount = 500
  	@description = 'Purchage of Mobile'
  end

  def create
  	amount = 500

  	@customer = Stripe::Customer.create(email: params[:stripeEmail],
  		source: params[:stripeToken])

  	@charge   = Stripe::Charge.create(customer: @customer.id,
  		                                amount: amount,
  		                                description: 'Rails Stripe customer',
  		                                currency: 'dollar')

    rescue Stripe::CardError => e
    	flash[:error] = e.message
    	redirect_to new_charge_path

  end

end
