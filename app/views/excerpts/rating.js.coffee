$('span.rating[data-id="<%= @excerpt.id %>"]').replaceWith "<%= rating_badge(@excerpt) %>"
vote_down = "a#down_<%= @excerpt.id %>"
alert "<%= vote_down_link(@excerpt) %>"
$(vote_down).replaceWith "<%= vote_down_link(@excerpt) %>"
vote_up = "a#up_<%= @excerpt.id %>"
$(vote_up).replaceWith "<%= vote_up_link(@excerpt) %>"


