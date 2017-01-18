class MeetingsController < InheritedResources::Base
  before_action :set_meeting, only: [:show, :edit, :update, :destroy]
  layout :resolve_layout
  def new
    @meeting = Meeting.new
    if isforproject
    	@meeting.project_id = params[:project_id]
      @attendeeslist = attendeeslist
	end
    @meeting.logperson = current_user
    @meeting.meetingdate = Date.today
  end
  def edit
    @isforproject = isforproject 
    @attendeeslist = attendeeslist
  end

  def create
    @meeting = Meeting.new(meeting_params)

    respond_to do |format|
      if @meeting.save
        if isforproject   
          format.html { redirect_to project_path(project_id,:anchor => 'meeting') , notice: 'Meeting was successfully created.' }
        else
          format.html { redirect_to @metting, notice: 'Meeting was successfully created.' }
        end
        format.json { render :show, status: :created, location: @meeting }
      else
        format.html { render :new }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end
  def update
    respond_to do |format|
      if @meeting.update(meeting_params)
        if isforproject  
          format.html { redirect_to project_path(project_id,:anchor => 'meeting') , notice: 'Meeting was successfully created.' }
        else
        format.html { redirect_to @meeting, notice: 'Meeting was successfully updated.' }
        end
        format.json { render :show, status: :ok, location: @meeting }
      else
        format.html { render :edit }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @meeting.destroy
    respond_to do |format|
      if isforproject 
      format.html { redirect_to project_path(project_id,:anchor => 'meeting') , notice: 'Meeting was successfully destroyed.' } 
      else
      format.html { redirect_to meetings_url, notice: 'Meeting was successfully destroyed.' }
      end
      format.json { head :no_content }
    end
  end
  private
    def set_meeting
      @meeting = Meeting.find(params[:id])
    end
    def meeting_params

      params.require(:meeting).permit(:meetingdate, :title, :data, :logger_id, :project_id,  {:user_ids => []})
    end
    def isforproject
    	params[:project_id].present? || params[:meeting][:project_id].present?
    end
    def project_id
      
      if params[:meeting].present?
       params[:meeting][:project_id]
      else
        params[:project_id]
      end
    end
    def attendeeslist
      
      project = Project.find(project_id)
      list=[]
      list = list.push([project.projectmanager.name,project.projectmanager.id])
      project.users.pluck(:name, :id).each do |user|
          list.push(user)
      end
      return  list
    end
    def resolve_layout
      case action_name
      when "show"
        "modal"
      else
        "application"
      end
  end
end

