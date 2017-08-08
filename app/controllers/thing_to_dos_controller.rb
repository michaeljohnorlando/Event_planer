class ThingToDosController < ApplicationController
  before_action :set_thing_to_do, only: [:show, :edit, :update, :destroy]

  # GET /thing_to_dos
  # GET /thing_to_dos.json
  def index
    @thing_to_dos = ThingToDo.all
  end

  # GET /thing_to_dos/homepage
  def homepage
  end

  # GET /thing_to_dos/1
  # GET /thing_to_dos/1.json
  def show
  end

  # GET /thing_to_dos/new
  def new
    @thing_to_do = ThingToDo.new
  end

  # GET /thing_to_dos/1/edit
  def edit
  end

  # POST /thing_to_dos
  # POST /thing_to_dos.json
  def create
    session =  Session.find_by(session_id: cookies[:session_id])
    user_id = session.user_id
    puts "\n\nuser id: #{session.user_id}\n\n"
    current_user = User.find_by(id: user_id)
    @thing_to_do = current_user.thing_to_dos.create(thing_to_do_params)
    # @current_session = Session.find_by session_id: cookies[:session_id]
    puts " inserting user_id: #{@thing_to_do.user_id} \n\n"




    respond_to do |format|
      if @thing_to_do.save
        format.html { redirect_to @thing_to_do, notice: 'Thing to do was successfully created.' }
        format.json { render :show, status: :created, location: @thing_to_do }
      else
        format.html { render :new }
        format.json { render json: @thing_to_do.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /thing_to_dos/1
  # PATCH/PUT /thing_to_dos/1.json
  def update
    respond_to do |format|
      if @thing_to_do.update(thing_to_do_params)
        format.html { redirect_to @thing_to_do, notice: 'Thing to do was successfully updated.' }
        format.json { render :show, status: :ok, location: @thing_to_do }
      else
        format.html { render :edit }
        format.json { render json: @thing_to_do.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /thing_to_dos/1
  # DELETE /thing_to_dos/1.json
  def destroy
    @thing_to_do.destroy
    respond_to do |format|
      format.html { redirect_to thing_to_dos_url, notice: 'Thing to do was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_thing_to_do
      @thing_to_do = ThingToDo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def thing_to_do_params
      params.require(:thing_to_do).permit(:name, :description, :attending, :user_id)
    end
end
