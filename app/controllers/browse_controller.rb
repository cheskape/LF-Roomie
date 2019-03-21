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
03/15/19
    => file created from rails g scaffold
    => added index and show
    => browses all users by increasing id
03/20/19
    => added swipe right and swipe left
03/21/19
    => browses all users randomly
    => does not show users who have already been swiped
*******************************************************************************************
This file contains controller for browse. This is where the model and views interact.
=end

class BrowseController < ApplicationController


    def index
        if user_signed_in?

            #gets the swipes of the current user and saves it as an array for accessing
            @user_swipes_array = []
            if not current_user.swipes.empty?
                @user_swipes = current_user.swipes.to_a

                #gets the elements swipee attribute and saves it in an array
                @user_swipes.each do |swipees|
                    @user_swipes_array.push(swipees.swipee)
                end
            end

            #gets the ids of the users for checking if a swipee exists    
            @ids = User.where.not(id: current_user.id).ids

            loop do

                #gets a random id and checks if it already exists in the swipe table of the user
                @id = @ids.sample
                if @user_swipes_array.include?(@id)
                    @ids.delete(@id)
                end
                break if not @user_swipes_array.include?(@id) or @ids.empty?
            end

            #gets the user object of the id
            if not @ids.empty?
            	$user = User.find(@id).basic_information            
            end
                
        end
    end

    def show
    	#gets the current user's matches and swipes
        @matches = current_user.matches
        @swipes = current_user.swipes
    end

    def swipeLeft
    	#creates a new swipe object and adds it to the user's swipes
    	$swipes = Swipe.new
        $swipes.user_id = current_user.id
        redirect_to browse_index_path
        $swipes.swipeDirection($user.user_id, false)
        current_user.swipes << $swipes
    end

    def swipeRight
    	#creates a new swipe object and adds it to the user's swipes
    	$swipes = Swipe.new
        $swipes.user_id = current_user.id
        redirect_to browse_index_path
        $swipes.swipeDirection($user.user_id, true)
        current_user.swipes << $swipes
    end



end