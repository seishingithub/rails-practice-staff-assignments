class PeopleController < ApplicationController

  def index
    @people = Person.all
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(params.require(:person).permit(:first_name, :last_name, :title))
    if @person.save
      redirect_to root_path, notice: "Person was created!"
    else
      render :new
    end
  end

  def show

  end

  def edit
    @person = Person.find(params[:id])
  end

  def update
    person = Person.find(params[:id])
    person.update(secure_params)

    redirect_to people_path
  end

  private

  def secure_params
    params.require(:person).permit(:title, :first_name, :last_name)
  end
end