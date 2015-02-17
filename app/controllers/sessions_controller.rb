class SessionsController < ApplicationController

  def new
    @student = Student.new
  end

  def create
    @student = Student.find_by(email: params[:student][:email])
    if @student and @student.authenticate(params[:student][:password])
      session[:student_id] = @student.id
      redirect_to root_path, notice: 'Welcome back, stranger!'
    else
      @student.errors[:base] << 'Invalid email / password'
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path, notice: "We're sorry to see you go!"
  end

end
