$('span.rating[data-id="<%= @excerpt.id %>"]').replaceWith "<%= rating_badge(@excerpt) %>"
$('span.down[data-id="<%= @excerpt.id %>"]').replaceWith "<%= vote_down_link(@excerpt) %>"
$('span.up[data-id="<%= @excerpt.id %>"]').replaceWith "<%= vote_up_link(@excerpt) %>"


