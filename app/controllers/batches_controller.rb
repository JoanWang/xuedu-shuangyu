class BatchesController < ApplicationController
  before_filter :init_data
  filter_access_to :all
  
  def index
    @batches = @course.batches
  end

  def new
    @batch = @course.batches.build
  end

  def create
    @batch = @course.batches.build(params[:batch])
    if @batch.save
      flash[:notice] = m('batch.create.success')
      redirect_to [@course, @batch]
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @batch.update_attributes(params[:batch])
      flash[:notice] = m('batch.update.success')
      redirect_to [@course, @batch]
    else
      flash[:notice] = t('msg.must_fill')
      redirect_to  edit_course_batch_path(@course, @batch)
    end
  end

  def show
    @students = @batch.students
  end

  def destroy
    if @batch.students.empty? and @batch.subjects.empty?
    @batch.inactivate
    flash[:notice] = m('batch.delete.success')
     redirect_to @course
    else
     flash[:warn_notice] = t('msg.batch.unable_delete') if @batch.students.empty?
     flash[:warn_notice] = t('msg.batch.unable_delete_1') if @batch.subjects.empty?
   redirect_to [@course, @batch]
    end
  end

  private
  def init_data
    @batch = Batch.find params[:id] if ['show', 'edit', 'update', 'destroy'].include? action_name
    @course = Course.find params[:course_id]
  end
end
