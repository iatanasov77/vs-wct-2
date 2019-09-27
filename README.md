# VS Web Content Thief

Clone Repositpry and Run Vagrant Machine
```
$ git clone https://github.com/iatanasov77/vs-wct-2.git WebContentThief2
$ cd WebContentThief2
$ vagrant up
```

Install PHP Libraries
```
$ composer install
```

Install Assets
```
$ yarn install --no-bin-links
$ yarn run dev
```
Create Database
```
$ mysqladmin -u homestead -p secret create wct
$ php bin/console doctrine:migrations:migrate
$ php bin/console fos:user:create admin admin admin
$ php bin/console fos:user:promote admin ROLE_ADMIN
```
Open Browser and ENJOY !!!
