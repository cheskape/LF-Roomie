class BasicInformationsController < ApplicationController
    before_action :set_basic_information, only: [:show, :edit, :update, :destroy]

    # GET /basic_informations
    # GET /basic_informations.json
    def index
        @basic_information = BasicInformation.find(current_user.id)
        @preferences = User.find(current_user.id).preferences
    end

    # GET /basic_informations/1
    # GET /basic_informations/1.json
    def show
        @preferences = User.find(current_user.id).preferences
    end

    # GET /basic_informations/new
    def new
        @basic_information = BasicInformation.new
    end

    # GET /basic_informations/1/edit
    def edit
    end

    # POST /basic_informations
    # POST /basic_informations.json
    def create
        @basic_information = BasicInformation.new(basic_information_params)
        @basic_information.user_id = current_user.id

        respond_to do |format|
            if @basic_information.save
                format.html { redirect_to @basic_information, notice: 'Basic information was successfully created.' }
                format.json { render :show, status: :created, location: @basic_information }
            else
                format.html { render :new }
                format.json { render json: @basic_information.errors, status: :unprocessable_entity }
            end
        end
    end


    # PATCH/PUT /basic_informations/1
    # PATCH/PUT /basic_informations/1.json
    def update
        respond_to do |format|
            if @basic_information.update(basic_information_params)
                format.html { redirect_to @basic_information, notice: 'Basic information was successfully updated.' }
                format.json { render :show, status: :ok, location: @basic_information }
            else
                format.html { render :edit }
                format.json { render json: @basic_information.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /basic_informations/1
    # DELETE /basic_informations/1.json
    def destroy
        @basic_information.destroy
        respond_to do |format|
            format.html { redirect_to basic_informations_url, notice: 'Basic information was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_basic_information
        @basic_information = BasicInformation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def basic_information_params
        params.require(:basic_information).permit(:firstname, :lastname, :profile_pic, :birthday, :address, :sex)
    end
end
