$('#products').html("<%= j render(partial: 'products') %>")
document.title = "<%= products_page_title %>"
history.pushState(null, document.title, "<%= request.original_url %>")
console.log("<%= request.original_url %>")
