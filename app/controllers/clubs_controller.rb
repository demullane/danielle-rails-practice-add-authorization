class ClubsController < ApplicationController
  before_action :authenticate

  def index
    @clubs = Club.all
  end

  def show
    @club = Club.find(params[:id])
  end

  private
  def authenticate
    redirect_to '/login' unless current_student
  end

  def current_student
    if session[:student_id]
      @current_user ||=Student.find(session[:student_id])
    end
  end

end
