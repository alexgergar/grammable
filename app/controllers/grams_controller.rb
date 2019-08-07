class GramsController < ApplicationController

  def index
    
  end

  def new
    @gram = Gram.new
  end

  def create
    @gram = Gram.create(gram_params)
    if @gram.invalid?
        flash[:error] = '<strong>No Message</strong> - the data you entered is invalid!'
    end
    redirect_to root_path
  end

  private

  def gram_params
    params.require(:gram).permit(:message)
  end
end
