// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "form_validation"
import * as Rails from "@rails/ujs"
/*
if i want to go back and add flash and stuff this is how
<% if note.errors.any? %>
    <div style="color: red">
      <h2><%= pluralize(note.errors.count, "error") %> prohibited this note from being saved:</h2>

      <ul>
        <% note.errors.each do |error| %>
          <li><%= error.full_message %></li>
        <% end %>
      </ul>
    </div>
  <% end %>
*/
//Adding this line to commit with a wiped database, since i had invalid tables in there from testing stuff
