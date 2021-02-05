# heroku: https://obscure-crag-42350.herokuapp.com/

# local:
- bundle install
- rake db:migrate
- yarn add bootstrap jquery popper.js
- yarn add easy-autocomplete
- rake db:seed  
- rails s

Продолжаем модифицировать наш магазин:

1. Установить и настроить гем Devise для сущности User - `Done`
2. Установить и настроить гем Activeadmin - `Done`
3. Добавить подкатегории для категория товаров. Создать несколько подкатегорий для каждой категории. - `Done`
4. Добавить сущность  Cart, реализовать возможностью добавления продукта в корзину. Важно, чтобы каждый товар в корзине был уникальным. Если в корзине уже есть товар, а мы пробуем ещё раз добавить его, то должно просто измениться количетсво айтемов в корзине. Также в корзине должен быть функционал увеличение/уменьшение количества айтемов - `Done 80/20`
5. Создать сущность Order, реализовать возможность оформления заказа. - `Done`
6. Загружаем наши файлы на S3(Cloudinary) - `Done`


Доп ссылки:
https://github.com/heartcombo/devise
https://github.com/activeadmin/activeadmin
https://edgeguides.rubyonrails.org/active_storage_overview.html#s3-service-amazon-s3-and-s3-compatible-apis
https://docs.aws.amazon.com/sdk-for-ruby/v3/developer-guide/setup-config.html инструкция как получить креды для S3
Ссылочки на видео:
part 1 - https://www.loom.com/share/cfe43b76e05a400bb6633960795178f2
part 2 - https://www.loom.com/share/4be616bbcadb4f13b6def43fc7c63f22
