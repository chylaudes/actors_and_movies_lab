#Views: The Chief of Sexy
=============================

The view is the Presentation layer. It's what the user sees and interacts with, essentially the web pages. The HTML, the CSS and the JavaScript. The controller processes and responds to user events, such as clicking on links and submitting forms.


After putting into this command in your terminal:

```
rails g controller artists index show new edit

```
We not only created the artist_controller.rb, but also the an artist folder inside of the views folder, and an `index.html.erb, show.html.erb, new.html.erb, edit.html.erb` that coresponds with each methods from the artist controller!

![](http://i.imgur.com/EHoJ3JO.png)


Essentially each of these templates are get pages that either shows All Artists(`index.html.erb`), or One Artist(`show.html.erb`)

###But let's focus on the New and Edit pages
-----------------------

The `new.html.erb` and `edit.html.erb` normally shows forms that submit information to the server.

`new.html.erb` is a page for the form to `create` a new Artist

`edit.html.erb` is a page for the form to `update` a new Artist

for our forms we're going to use the `gem simple_form` to render our Forms.

#Simple Form

###Installation
-------------------------
Add it to your Gemfile:

```
gem 'simple_form
```
Run the command in Terminal:

```
bundle install
```
If you're using bootstrap, run this command in terminal:

```
rails generate simple_form:install --bootstrap
```


####Let's create a simple_form in the new.html.erb
----------------------

In our:```app/controllers/artists_controller.rb```

```
class ArtistsController < ApplicationController

...

 def new
    @artist = Artist.new
  	#Creating an empty Artist object for our form
 end
  
 ...
  #POST /artists
  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      redirect_to artists_path
    else
      render :new
    end
  end
    #the create method will be used after submitting our form in /artists/new
 ...

```

In our:```app/views/artists/new.html.erb```

    <%= simple_form_for @artist do |f| %>
      <!-- @artist = Artist.new  from the new method in the artist controller -->
      <%= f.input :name, label: false, input_html: { placeholder: 'Name' } %>
      <%= f.input :description, label: false, as: :text, input_html: { placeholder: "Artist Bio" } %>
      <%= f.input :image_url, label:false, input_html: { placeholder: 'Image url' } %>      
            
            <!-- f.input is method that first takes in the attribute of the artist ex: ':name',':description', ':image_url' then a couple of options for the form. Then the 'label' option tells us if we want a label in our input.  Then the input_html option needs an object with a key 'placeholder' and a value of what you want to say inside of the input field.  -->
            
      <%= f.submit "Submit".html_safe, class: "btn btn-lg btn-danger" %>
      
      <!-- f.submit is method creates a button to submit the form using the create action and making a POST request to the rails server. The 'class:' refers to the style class of the red button from bootstrap -->
      <% end %>

In the view it should look like this:

![](http://i.imgur.com/z7upBQf.png =700x)



####Let's create a simple_form in the edit.html.erb
----------------------

In our:

```
app/controllers/artists_controller.rb
```

```
class ArtistsController < ApplicationController

...

#GET /artists/:id/edit
 def edit
    @artist = Artist.find(params[:id])
    #first you find the artist you want to edit
 end
  
 ...
  #PATCH /artists/:id
  def update
  @artist = Artist.find(params[:id])
  @artist.update_attributes artist_params
    if @artist.save
      redirect_to artist_path(@artist)
    else
      render :new
    end
  end
 ...
 
 #update method is similar to the create method you just need to find the ONE Artist you're updating.

```


In our:```app/views/artists/edit.html.erb```

      <%= simple_form_for @artist do |f| %>
      <%= f.input :name, label: false, input_html: { placeholder: 'Name' } %>
      <%= f.input :description, label: false, as: :text, input_html: { placeholder: "Artist Bio" } %>
      <%= f.input :image_url, label:false, input_html: { placeholder: 'Image url' } %>
      <%= f.submit "Submit".html_safe, class: "btn btn-lg btn-danger" %>
    <% end %>
    

![](http://i.imgur.com/irUntg2.png)


#####The form is pretty much the same as the new.    
#####All we had to change was the instance variable @artist to edit that ONE artist.  


###Resources
--------------------

If you want to look into more about simple form and its other options here's a link to a Railscast that will clearly show you have to use simple_form:

[Railscast on Simple_form](http://railscasts.com/episodes/234-simple-form?autoplay=true)

Good Luck!
