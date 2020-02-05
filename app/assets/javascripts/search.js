$(function() {
  var search_list = $("main");

  function appendBook(book) {
    var html = `
  <div class='content'>
    <div class='content__book'>
      <div class='content__book__topImage'>
        "画像はありません" if ${book.bookimage}.blank?
        image_tag ${book.bookimage.url}, size:'157x222' if ${book.bookimage}.present?
      </div>
      <div class='content__book__title'>
        link_to "${book.booktitle}", "/books/${book.id}"
      </div>
    </div>
  </div>
                        `
    search_list.append(html);
   }

  function appendErrMsgToHTML(msg) {
    var html = `<div class='name'>${ msg }</div>`
    search_list.append(html);
  }


  $(".search-input").on("keyup", function() {
    var input = $(".search-input").val();
    $.ajax({
      type: 'GET',
      url: '/books/search',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(books) {
      $(".book").empty();
      if (books.length !== 0) {
        books.forEach(function(book){
          appendBook(book);
        });
      }
      else {
        appendErrMsgToHTML("一致する本は登録されていません");
      }
    })
  });
});