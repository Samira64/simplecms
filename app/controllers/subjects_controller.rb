class SubjectsController < ApplicationController

  layout "admin"
  before_action :subject_count, :only => [:edit, :create, :new, :update]
  before_action :confirm_logged_in

  def index
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def edit
    @subject = Subject.find(params[:id])
    @subject_count = Subject.count
  end

  def update
    @subject =  Subject.find(params[:id])
    if @subject.update_attributes(subject_params)
      flash[:notice] = "Subject updated successfully."
      redirect_to(subject_path(@subject))
    else
      render("edit")
    end
  end

  def new
    @subject = Subject.new
    @subject_count = Subject.count + 1
  end

  def create
    @subject_count = Subject.count + 1
    @subject = Subject.new(subject_params)
    if @subject.save
      flash[:notice] = "Subject created successfully."
      redirect_to(subjects_path)
    else
      render('new')
    end
  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    @subject = Subject.find(params[:id])
    if @subject.destroy
      flash[:notice] = "Subject #{@subject.name} destroyed successfully."
      redirect_to(subjects_path)
    end
  end

  private
  def subject_params
    params.require(:subject).permit(:name, :position, :visable, :created_at)
  end

  def subject_count
    @subject_count = Subject.count
    if params[:action] == 'create' || params[:action] == 'new'
      @subject_count +=1
    end
  end

end
