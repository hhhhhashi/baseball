class Public::ReportsController < ApplicationController
  def new
    @report = Report.new
    @Member = Member.fiind(params[:member_id])
  end

  def create
    @member = Member.find(params[:member_id])
    @report = Report.new(report_params)
    @report.reporter_id = current_member.id
    @report.reported_id = @member.id

    #if @report.save
     #redirect_to
  end

  private

  def report_params
    params.repuire(:report).permit(:reason, :url)
  end
end