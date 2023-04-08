class Public::ReportsController < ApplicationController
  before_action :authenticate_member!, only: [:new, :create]

  def new
    @report = Report.new
    @member = Member.find(params[:member_id])
  end

  def create
    @member = Member.find(params[:member_id])
    @report = Report.new(report_params)
    @report.reporter_id = current_member.id
    @report.reported_id = @member.id
    if @report.save
      ContactMailer.send_when_member_report(@member).deliver
      redirect_to recruits_path, notice: "ご報告ありがとうございます。"

    else
      render　"new"
    end
  end

  private

  def report_params
    params.require(:report).permit(:reason, :url)
  end
end