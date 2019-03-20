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
    => file created from rails new blog
    => set root to home/index
*******************************************************************************************
This file contains the routes for the application. This is where it tells stuff where to go.
=end
Rails.application.routes.draw do
    resources :preferences
    get 'preference/add_preference'

    resources :browse
    get 'browse/:id/swipeLeft' => 'browse#swipeLeft', as: :swipeLeft_browse
    get 'browse/:id/swipeRight' => 'browse#swipeRight', as: :swipeRight_browse

    resources :basic_informations
    get "user/update-info", to:"basic_informations#edit", as:"basic_info_edit"
    get "user/basic-info", to:"basic_informations#new", as:"new_basic_info"
    get "user/basic-info-view", to:"basic_informations#show", as:"view_basic_info"

    #added the routes from devise
    devise_for :users, controllers: { registrations: "registrations" }

    get "preferences/add/:id", to: "preferences#add", as:"add_preference"
    get "preferences/index", to: "preferences#index", as:"index_preference"

    get "preferences/remove/:id", to:"preferences#remove", as:"destroy_preferences"
    get "preferences/delete/:id", to: "preferences#destroy", as:"delete_preferences"

    get "basic_informations/delete_profile_pic", to:"basic_informations#delete_profile_pic", as:"delete_profile_pic"

    #set root to home/index
    root to: "home#index"
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
