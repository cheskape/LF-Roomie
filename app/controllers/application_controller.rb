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
01/31/19
    => file created from rails new LF:Roomie
    => devise added initial code (before action, cofigure permitted parameters, protected)
02/08/19
    => commented out devise_parameter_sanitizer for account update
    => added comments
*******************************************************************************************
This file is the application's controller. This is where we assign the variables that will
be used by the devise views.

=end

class ApplicationController < ActionController::Base
    #do configure_permitted_parameters if it's a devise controller
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        #array of attributes
        added_attrs = [:username, :email, :mobile_number, :password, :password_confirmation, :remember_me]
        #only allow attributes from added_attrs to be used in sign up
        devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
        #devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    end
    #...........................................................................#
    # configure_permitted_parameters                                            #
    #  => allows certain parameters to be used in the views                     #
    #...........................................................................#
end
