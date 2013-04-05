class RemembersController < ApplicationController
  def index
    @remembers = Remember.paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @remember = Remember.find(params[:id])
  end

  def new
    @remember = Remember.new
  end

  def edit
    @remember = Remember.find(params[:id])
  end

  def create
    @remember = Remember.new(params[:remember])

    if @remember.save
      redirect_to @remember, notice: 'Remember was successfully created.'
    else
      render action: "new" 
    end
  end

  def update
    @remember = Remember.find(params[:id])

    if @remember.update_attributes(params[:remember])
      redirect_to @remember, notice: 'Remember was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @remember = Remember.find(params[:id])
    @remember.destroy
    redirect_to remembers_url 
  end
end
