И так осталось ещё пару шагов и наш магазин будет готов, и так что нам нужно сделать:
## heroku: https://aqueous-hollows-83315.herokuapp.com/

1. Модключить мейлер используя Gmail - `Done`
2. Должны отправляться имейлы после оформления заказа, с перечнем товаром (поработайте на вьюхой имейла, чтобы она была красивая и информативная). После того как мы отправляем имейл мы должны: переводить наш заказ в статус "выполнен" (тем самым мы деактивируем корзину) а так же переадресовываем пользователя на главную страницу (не забываем об сообщении об успешно выполненном заказе на вьюхе) - `Done`
3. Добавить сущность комментарии для продуктов и пользователей, с полями body & rating. - `Done`
4. Пользователь может оставить только 1 коментарий с рейтингом для товара заказ на который он оформил (заказ должен находиться в статусе "выполнены"). Используйте валидацию со скоупом. -`Done`
5. Пользователь может создавать, редактировать и удалять свой комментарий. - `Done`
6. На странице продукта, мы должны отображать: название товара, описание, цену, категорию, картинку и общий рейтинг товара (среднее арифметическое всех оценок пользователей для этого товара) - `Done`
7. Добавить возможность авторизации с помощью гема omniauth, используя github как провайдер. - `Done`
8. Вытягивать из данных приходящих от провайдера имя пользователя (и записывать эти данные в базу). - `Done`

*. По-желанию добавить доп провайдеры для авторизации facebook/google.


Доп ссылки:
p1 - https://www.loom.com/share/1702526f5268455596341694acf3df95?sharedAppSource=personal_library
p2 - https://www.loom.com/share/39d7ffae09c647cda5ea1f9d39c16a39?sharedAppSource=personal_library
p3 - https://www.loom.com/share/ef01669111ac43bf9d0e72450c65b230?sharedAppSource=personal_library

https://guides.rubyonrails.org/action_mailer_basics.html
https://github.com/omniauth/omniauth
https://github.com/omniauth/omniauth-github
https://github.com/heartcombo/devise
gem 'devise', github: 'heartcombo/devise', branch: 'ca-omniauth-2' - devise version with omniauth
https://github.com/cookpad/omniauth-rails_csrf_protection