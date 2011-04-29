class SchoolsController < ApplicationController
  before_filter :login_required
  before_filter :find_school, :only => [:show, :edit, :update, :destroy]
  filter_access_to :all

  def index
    @schools = School.active
  end

  def new
    @school = School.new
  end

  def create
    @school = School.new(params[:school])
    if @school.save
      flash[:notice] = m('school.create.success')
      redirect_to :action=>'manage_compus'
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @school.update_attributes(params[:school])
      flash[:notice] = m('school.update.success')
      redirect_to :action=>'manage_compus'
    else
      render 'edit'
    end
  end

  def destroy
    if @school.classrooms.active.empty?
      @school.inactivate
      flash[:notice] = m('school.delete.success')
      redirect_to :action=>'manage_compus'
    else
      flash[:warn_notice] = m('school.delete.school_unable') 
      redirect_to :action=>'manage_compus'
    end
  end

  def manage_compus
    @schools = School.active
  end

  #更新教室
  def update_classroom
    @classroom = Classroom.find_all_by_school_id(params[:school_name], :conditions => {:is_deleted => false}) 

    render(:update) do |page|
      page.replace_html 'update_classroom', :partial=>'update_classroom'
    end

  end

  def show
    @classrooms = @school.classrooms.active 
  end

  private
  def find_school
    @school = School.find(params[:id])
  end
end
