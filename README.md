cp .env.example .env
composer i 
composer dump-autoload
php artisan migrate
php artisan db:seed
php artisan serve

php artisan schedule:work -> worker ve raporlama



Merhaba, İlgili case'in db_dumb dosyası ve Postman collection'ı proje içerisinde klasörlenmiş vaziyettedir. 


