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
    => add the add function
02/24/19
    => place notice in add function
    => add redirect to add function if no user is signed in
03/07/19
    => add remove function to remove preference association with user
    => added checking if preference part of user's preference already
*******************************************************************************************
This file contains controller for preferences. This is where the model and views interact.
=end
class PreferencesController < ApplicationController
    before_action :set_preference, only: [:show, :edit, :update, :destroy]

    # GET /preferences
    # GET /preferences.json
    def index
        #display all the preferences
        $current_preference = nil
        @preferences = Preference.all
        @user_preferences = User.find(current_user.id).preferences
    end

    # GET /preferences/1
    # GET /preferences/1.json
    def show
    end

    # GET /preferences/edit
    def edit
        @user = current_user
        $current_preference = Preference.find(params[:id])

        @preference = Preference.new
        @preference.user_id = current_user.id
    end

    # GET /preferences/new
    def new
        @preference = Preference.new
    end

    def add
        #if the user is signed int
        if user_signed_in?
            #add the chosen preference to the user
            @user = User.find(current_user.id)
            @preference = Preference.find(params[:id])
            #checks if preference to be added already exists
            if !(@user.preferences.include?(@preference))
                @user.preferences << @preference
                #show success notice
                flash[:notice] = "Successfully added preference!"
            else
                flash[:notice] = "Preference already part!"
            end

            if not $current_preference.nil?
                @user.preferences.destroy($current_preference)
            end

        else
            flash[:notice] = "Create an account first to add a preference."
            redirect_to new_user_registration_path
        end
        redirect_to preferences_path
    end

    # POST /preferences
    # POST /preferences.json
    def create
        @preference = Preference.new(preference_params)
        @preference.user_id = current_user.id
        respond_to do |format|
            if @preference.save
                format.html { redirect_to @preference, notice: 'Preference was successfully created.' }
                format.json { render :show, status: :created, location: @preference }
            else
                format.html { render :new }
                format.json { render json: @preference.errors, status: :unprocessable_entity }
            end
        end

    end

    # DELETE /preferences/1
    # DELETE /preferences/1.json
    def remove
        #check if user is signed in
        if user_signed_in?
            #find the current user
            @user = current_user
            #get the preference of the user we want to delete
            @preference = @user.preferences.find(params[:id])
            #destroy the preference
            @user.preferences.destroy(@preference)
            respond_to do |format|
                format.html { redirect_to preferences_url, notice: 'Preference was successfully removed.' }
                format.json { head :no_content }
            end
        end
    end

    def destroy
        @preference.destroy
        respond_to do |format|
            format.html { redirect_to preferences_url, notice: 'Preference was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_preference
        @preference = Preference.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def preference_params
        params.require(:preference).permit(:prefer)
    end
end
