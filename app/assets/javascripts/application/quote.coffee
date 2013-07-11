$ ->
  $fallbackMailto = $(".fallback .mailto")
  $quoteForm = $("#new_quote")

  renderFallbackEmail = ->
    message = $quoteForm.find("#quote_comment").val()
    phone = $quoteForm.find("#quote_phone").val()

    mailto = "mailto:"
    mailto = mailto + $fallbackMailto.attr("data-email")
    mailto = mailto + "?subject=Quote Request"
    mailto = mailto + "&body=Phone: #{phone}%0D%0A%0D%0A"
    mailto = mailto + "#{message}"
    $fallbackMailto.attr("href", mailto)

  $quoteForm.submit((event)->
    event.preventDefault()
    $(this).find("input[type=submit]").prop("disabled", true)
    $form = $(this)

    $.ajax({
      method: $(this).attr("method"),
      url: $(this).attr("action"),
      data: $(this).serialize(),
      success: (data)->
        $form.fadeOut()
        $(".success").fadeIn()
      ,
      error: (xhr, status, error)->
        $form.fadeOut()
        renderFallbackEmail()
        $(".fallback").fadeIn()
        $(this).find("input[type=submit]").prop("disabled", false)
    })
  )