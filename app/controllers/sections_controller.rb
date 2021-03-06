class SectionsController < ApplicationController

  layout "admin"
  before_action :find_page
  before_action :confirm_logged_in
  before_action :section_count, :only => [:edit, :new]
 
  
  def index
    @sections = @page.sections.sorted
  end

  def edit
    @section = Section.find(params[:id])
  end

  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(section_params)
      flash[:notice] = "Section updated successfully."
      redirect_to(section_path(@section, :page_id => @page.id))
    else
      render("edit")
    end
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new(:page_id => @page.id)
  end

  def create
    @section = @page.sections.build(section_params)
    if @section.save
      flash[:notice] = "Section created successfully."
      redirect_to(sections_path(:page_id => @page.id))
    end
  end

  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    @section = Section.find(params[:id])
    @section.destroy
    flash[:notice] = "Section destroyed successfully."
    redirect_to(sections_path(:page_id => @page.id))
  end

  private
  def section_params
    params.require(:section).permit(:page_id, :name, :position, :visible, :content_type, :content)
  end

  def section_count
    @section_count = @page.sections.count
    @section_count += 1
  end

  def find_page
    @page = Page.find(params[:page_id])
  end

end
