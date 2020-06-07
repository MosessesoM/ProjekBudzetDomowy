class IncomesController < ApplicationController
  helper_method :sort_column, :sort_direction

  http_basic_authenticate_with name: "admin", password: "admin", except: [:index, :show]

  def index
	@incomes = Income.order(sort_column + " " + sort_direction)
  end
  
  def show
	@income = Income.find(params[:id])
  end
  
  def new
    @income = Income.new
	@categories = Category.all.map { |c| [c.name, c.id]}
  end
  
  def edit
    @income = Income.find(params[:id])
	@categories = Category.all.map { |c| [c.name, c.id]}
  end
  
  def create
	@income = Income.new(income_params)
	@categories = Category.all.map { |c| [c.name, c.id]}
 
    if @income.save
	  redirect_to @income
	else
	  render 'new'
	end
  end
  
  def update
    @income = Income.find(params[:id])
 
    if @income.update(income_params)
      redirect_to @income
    else
      render 'edit'
    end
  end
  
  def destroy
	@income = Income.find(params[:id])
	@income.destroy
 
	redirect_to incomes_path
  end
  
  private
	def income_params
	  params.require(:income).permit(:title, :text, :amount, :category_id)
	end
	
	def sort_column
		params[:sort] || "title"
    end
  
    def sort_direction
		params[:direction] || "asc"
    end
end
