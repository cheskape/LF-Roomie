=begin
MIT License

Copyright (c) 2019 cheskape, Bryzeeboy, andiedioso

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

This is a course requirement for CS 192 Software Engineering II under the
supervision of Asst. Prof. Ma. Rowena C. Solamo of the Department of
Computer Science, College of Engineering, University of the Philippines,
Diliman for the AY 2018-2019.

*******************************************************************************************
Code History:
02/22/19
    => file created from rails g scaffold
    => set the user id in create to current user
02/24/19
    => make index return basic info of current user
    => place notice in show function
    => redirect show to index
*******************************************************************************************
This file contains controller for basic information. This is where the model and views interact.
=end
class BasicInformationsController < ApplicationController
    before_action :set_basic_information, only: [:show, :edit, :update, :destroy]

    # GET /basic_informations
    # GET /basic_informations.json
    def index
        #return the basic information of the current user
        @basic_information = BasicInformation.find_by(:user_id => current_user.id)
        #show preferences that user has added
        @preferences = User.find(current_user.id).preferences
    end

    # GET /basic_informations/1
    # GET /basic_informations/1.json
    def show
        #show a notice
        flash[:notice] = "Successfully ipdated information!"
        #redirect to index
        redirect_to basic_informations_path
    end

    # GET /basic_informations/new
    def new
        #initialize new basic information
        @basic_information = BasicInformation.new
    end

    # GET /basic_informations/1/edit
    def edit
    end

    # POST /basic_informations
    # POST /basic_informations.json
    def create
        @basic_information = BasicInformation.new(basic_information_params)
        #set user_id for new basic info to current user's id
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
        @basic_information = BasicInformation.find_by(:user_id => current_user.id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def basic_information_params
        params.require(:basic_information).permit(:firstname, :lastname, :profile_pic, :birthday, :address, :sex)
    end
end
