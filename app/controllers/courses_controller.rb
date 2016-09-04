require 'json'
class CoursesController < ApplicationController
  @@user_data = Hash.new()
  before_filter :authenticate_user! , only: [:recommendations]

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
    @ratings = Rating.all
    @@user_data = Hash.new {|h,k| h[k] = Hash.new(&h.default_proc) }
    @ratings.each do |rating|
        #populating the inner hash

        @rated_course = rating.course
        @user_who_rated = rating.user

        @@user_data[@user_who_rated.username][@rated_course.name] = rating.rate.to_f
    end
    @ratings_seen = @@user_data

    dict = @ratings_seen.to_s

    #@ratings_seen is a nested hash.To convert it into a python dictionary,replace every hash_rocket with colon using GSUB
    user = @user.username
    `python collaborative_filtering.py #{dict} #{user}`


    #Read from recommendations.txt and find the courses to recommend
    @courses = []
    File.foreach("recommendations.txt") do |line|
      @course = Course.find_by(name: line.strip)
      @courses << @course
    end
    ## To find the courses which have a rating of two or more
    if @courses.nil?

      @courses_ids = Rating.select(:course_id).distinct
      @courses_ids.each do |course_id|
        @popular_courses << Course.find(course_id)
    end
   # @most_rated_courses = Rating.all.where(course_id.count >2) do |rating|
    #  @popular_courses << rating.course
    #end
  end
end

  private

  def import
    Course.import(params[:file])
    redirect_to root_url, notice: "Data added to database"
  end
end
