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
02/20/2019
    => file created from rails g controller
    => added show and edit
*******************************************************************************************
This file contains the controller of basic information where it will connect the data of the user,
basic information, and name and profile picture to the basic information page.
=end

class BasicInformationController < ApplicationController
    def show
        #if the user is signed in
        if user_signed_in?
            #get the user
            @user = User.find(current_user.id)

            #and get its name and profile picture
            @name_and_pic = @user.name_and_profile_picture
        else
            #else if the user is not signed in return to root
            redirect_to_root_path
        end
    end

    def edit
    end
end
