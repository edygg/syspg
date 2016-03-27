class UserManagementController < ApplicationController
  def unverified_users
    @unverified_companies = Company.joins(:user).where(users: { verified: false })
    @unverified_students = Student.joins(:user).where(users: { verified: false }, students: { campu_id: params[:campus_id], major_id: params[:major_id] })
    @unverified_academics = Academy.joins(:user).where(users: { verified: false }, academies: { campu_id: params[:campus_id], major_id: params[:major_id] })
  end

  def verify_user
    @user = User.find_by_id(params[:user_id])
    @user.verified = true
    respond_to do |format|
      if @user.save
        format.html
        format.json { render json: @user, status: :ok }
      else
        format.html
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

end
