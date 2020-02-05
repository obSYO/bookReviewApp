$(function() {
  var search_list = $(".book");

  function appendBook(book) {
    var html = `<h1 class='search_preview'>検索プレビュー</h1>
                  <div class='content'>
                    <div class='content__book'>
                      <div class='content__book__topImage'>
                        <div 画像はありません if "${book.bookimage}".blank?  ></div>
                        <img src="${book.bookimage.url}",width="157" height="222" alt="画像はありません"></image_tag>
                      </div>
                      <div class='content__book__title'>
                        <a href="/books/${book.id}">
                        ${book.booktitle}
                        </a>
                      </div>
                    </div>
                  </div>`
    search_list.append(html);
    console.log(html)
   }

  function appendErrMsgToHTML(msg) {
    var html = `<div class='name'>${ msg }</div>`
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