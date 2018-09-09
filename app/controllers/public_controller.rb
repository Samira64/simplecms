class PublicController < ApplicationController

  layout 'public'

  def index
    @subjects = Subject.all.sorted
  end

  def show
    @subjects = Subject.all.sorted
    @page = Page.where(:visible => 1, :permalink => params[:permalink]).first
    if @page.nil?
        redirect_to(root_path)
    end
  end
  
end
