class OutgoingsController < ApplicationController
helper_method :sort_column, :sort_direction

http_basic_authenticate_with name: "admin", password: "admin", except: [:index, :show]

def index
	@outgoings = Outgoing.order(sort_column + " " + sort_direction)
  end
  
  def show
	@outgoing = Outgoing.find(params[:id])
  end
  
  def new
    @outgoing = Outgoing.new
	@categories = Category.all.map{|c| [ c.name, c.id ] }
  end
  
  def edit
    @outgoing = Outgoing.find(params[:id])
	@categories = Category.all.map{|c| [ c.name, c.id ] }
  end
  
  def create
	@outgoing = Outgoing.new(outgoing_params)
	@categories = Category.all.map{|c| [ c.name, c.id ] }
 
    if @outgoing.save
	  redirect_to @outgoing
	else
	  render 'new'
	end
  end
  
  def update
    @outgoing = Outgoing.find(params[:id])
 
    if @outgoing.update(outgoing_params)
      redirect_to @outgoing
    else
      render 'edit'
    end
  end
  
  def destroy
	@outgoing = Outgoing.find(params[:id])
	@outgoing.destroy
 
	redirect_to outgoings_path
  end
  
  private
	def outgoing_params
	  params.require(:outgoing).permit(:title, :text, :amount, :category_id)
	end
	
	def sort_column
		params[:sort] || "title"
    end
  
    def sort_direction
		params[:direction] || "asc"
    end
end
