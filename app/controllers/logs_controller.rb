class LogsController < InheritedResources::Base
  before_action :set_log, only: [:show, :edit, :update, :destroy]
  layout :resolve_layout
  def new
    @log = Log.new
    if isforproject
    	@log.project_id = params[:project_id]
	  end
    @log.logperson = current_user
    @log.logdate = Time.now
  end
  def edit
    @isforproject = isforproject 
   
  end
  def create
    @log = Log.new(log_params)
    respond_to do |format|
      if @log.save
        updatepicture
        if isforproject   
          format.html { redirect_to project_path(project_id,:anchor => 'log') , notice: 'Log was successfully created.' }
        else
          format.html { redirect_to @log, notice: 'Log was successfully created.' }
        end
        format.json { render :show, status: :created, location: @log }
      else
        format.html { render :new }
        format.json { render json: @log.errors, status: :unprocessable_entity }
      end
    end
  end
  def update
    respond_to do |format|
      if @log.update(log_params)
        updatepicture
        if isforproject  
          format.html { redirect_to project_path(project_id,:anchor => 'log') , notice: 'Log was successfully created.' }
        else
        format.html { redirect_to @log, notice: 'Log was successfully updated.' }
        end
        format.json { render :show, status: :ok, location: @log }
      else
        format.html { render :edit }
        format.json { render json: @log.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @log.destroy
    respond_to do |format|
      if isforproject 
      format.html { redirect_to project_path(project_id,:anchor => 'log') , notice: 'Log was successfully destroyed.' } 
      else
      format.html { redirect_to logs_url, notice: 'Log was successfully destroyed.' }
      end
      format.json { head :no_content }
    end
  end
  private
    def set_log
      @log = Log.find(params[:id])
    end
    def log_params
      params.require(:log).permit(:logdate, :data, :logperson_id, :project_id, :pictures)
    end
    def isforproject
    	params[:project_id].present? || params[:log][:project_id].present?
    end
    def project_id
      
      if params[:log].present?
       params[:log][:project_id]
      else
        params[:project_id]
      end
    end
    def pictures
      params[:log][:pictures]
    end
    def updatepicture
      @pics=[]
      pictures.each do |pic|
        begin
          if eval(pic)[:id].present?
            @pics.push(Ckeditor::Picture.find(eval(pic)[:id]))
          end
        rescue
          @pics.push(Ckeditor::Picture.new(data: pic))
        end
      end
      @log.pictures = @pics 
      @log.save
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

