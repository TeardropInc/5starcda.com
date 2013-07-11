class QuotesController < ApplicationController
  def create
    QuoteMailer.send_quote(params[:email], params[:name], params[:phone], params[:comment]).deliver
    render nothing: true
  end
end
