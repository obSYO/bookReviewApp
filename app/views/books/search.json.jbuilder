json.array! @search_books do |book|
  json.id book.id
  json.booktitle book.booktitle
  json.author book.author
  json.bookimage book.bookimage
  json.user_id book.user_id
  json.nickname book.user.nickname
  json.user_sign_in current_user
end