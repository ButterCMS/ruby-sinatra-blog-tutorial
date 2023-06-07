<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="./style.css">
    <title>Document</title>
  </head>
  <body>
    <div class="container">
      <div class="header">
        <div class="logo">
          <h1>Ruby Blog</h1>
          <img
            class="logo-img"
            src="https://res.cloudinary.com/drh4lw1m7/image/upload/v1684406814/logo_vxckog.png"
          />
        </div>
        <div class="navbar">
          <div class="navItem">Stories</div>
          <div class="navItem">Category</div>
          <div class="navItem active">Blog</div>
          <div class="navItem">Contact</div>
        </div>
      </div>


      <div class="text_container">
     <h1>Search Result for: <%= searchTerm %></h1>
   </div>
   <div class="container">
   <% if data.empty? %>
   <div class="text_container">
     <h3>No result found</h3>
   </div>

   <% else %>

     <h4><%= data.length %> results found.</h4>
     <div class="body_post">
       <% data.each do |blog|%>

       <a href="/posts/<%= blog['slug'] %>">
         <div class="card">
           <img src=<%=blog['featured_image'] %> />
           <div class="card_content">
             <h2><%= blog['title'] %></h2>
             <p><span>Summary: </span> <%= blog['summary'] %></p>

             <p />
             <p>
               <span>Author:</span>
               <%= blog['author']['first_name'] %> <%=
               blog['author']['last_name'] %>
             </p>
           </div>
         </div>
       </a>
       <% end %>
     </div>
     <% end %>
   </div>

  </body>
</html>
