$ ->
  $form = $('#new_payment')

  stripeResponseHandler = (status, response)->
    if response.error
      # Show the errors on the form
      $form.find('.payment-errors').text(response.error.message)
      $form.find('button').prop('disabled', false)
      console.log("error")
    else
      # token contains id, last4, and card type
      console.log('success')
      token = response.id
      # Insert the token into the form so it gets submitted to the server
      $form.find("#payment_stripe_token").val(token)
      # and submit
      #$form.get(0).submit()

  $form.submit((event)->
    event.preventDefault()

    # Disable the submit button to prevent repeated clicks
    $form.find("input[type=submit]").prop('disabled', true)
    Stripe.createToken($form, stripeResponseHandler)
  )
