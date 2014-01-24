# encoding: utf-8

module BeerDbAdmin

class BeersController < BeerDbAdminController
  
  def index
    # note: show 25 per page for now
    @beers = Beer.limit( 25 )
  end
  
  # GET /beers/:id e.g. /beers/1
  def show
    @beer = Beer.find( params[:id] )
  end

end # class BeersController

end # module BeerDbAdmin