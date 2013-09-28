class NexusesController < ApplicationController

def index
  @items = Nexus.all.to_a
  
end

end
