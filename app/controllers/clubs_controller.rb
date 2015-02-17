class ClubsController < ApplicationController
  before_action :authenticate

  def index
    @clubs = current_student.clubs
  end

  def show
    @club = Club.find(params[:id])
    @participation = Participation.all
    validator = false
    @participation.each do |participation|
        if (participation[:club_id] == @club.id) && (participation[:student_id] == session[:student_id])
          validator = true
        elsif validator
          validator = true
        else
          validator = false
        end
    end
      redirect_to '/403' unless validator
  end

  private
  def authenticate
    redirect_to '/login' unless current_student
  end

  def current_student
    if session[:student_id]
      @current_student ||=Student.find(session[:student_id])
    end
  end

end
