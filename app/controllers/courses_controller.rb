class CoursesController < ApplicationController

  before_filter :authenticate_user! , only: [:recommend]

  def search
    if params[:search].present?
      @beginner_courses = Course.search(params[:search], where: {level: "beginner"},order: {_score: :desc})
      @intermediate_courses = Course.search(params[:search], where: {level: "intermediate"},order: {_score: :desc})
      @advanced_courses = Course.search(params[:search], where: {level: "advanced"},order: {_score: :desc})
    else
      @courses = Course.all.order('random()')
    end

  end
  def index
  	@courses = Course.all.paginate(page: params[:page])
  end


  def show
  	@course = Course.friendly.find(params[:id])
    @ratings = Rating.where(course_id: @course.id).order("created_at DESC")

    if @ratings.blank?
      @average_rating= 0
    else
      @average_rating = @ratings.average(:rate).round(2)
    end
  end

  def recommendations
    @user= current_user
  end

  def import 
  	Course.import(params[:file])
  	redirect_to root_url, notice: "Data added to database"
  end
end
