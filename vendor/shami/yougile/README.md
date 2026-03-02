# yougile-api
Библиотека для работы с [YouGile REST API v2.0](https://ru.yougile.com/api-v2#/)

Описание и примеры: [shafeev.net](https://shafeev.net/stati/obertka-dlya-yougile-rest-api/)

## Установка
Через Composer

``` bash
composer require shami/yougile
```

## Использование

### Инициализация
``` php
require_once __DIR__ . "/vendor/autoload.php";

use Yougile\Yougile;

$yougile = new Yougile('ID_Компании', 'КЛЮЧ');

```

### Необходимые данные
1) Получить [ID компании](https://ru.yougile.com/api-v2#/operations/AuthKeyController_companiesList)
2) Получить [ключ API](https://ru.yougile.com/api-v2#/operations/AuthKeyController_create) 


### Общая информация 
Чтобы воспользоваться определенным методом, необходимо указать ресурс к которому данный метод относится. 
``` php
$resources = $yougile->api('resources');
```
Далее можно обращаться к любому методу из указанного ресурса. 
``` php
$result = $resources->create();
```

## Примеры

### Получить список сотрудников
``` php
$users = $yougile->api("users");
$user_list = $users->get_list();
var_dump($user_list);
```

### Пригласить в компанию сотрудника
``` php
$users = $yougile->api("users");
$res = $users->create("info@shafeev.net", true); // два параметра: $email, $isAdmin - имеет ли пользователь права администратора
var_dump($res);
```

### Получить информацию по ID сотрудника
``` php
$users = $yougile->api("users");
$user = $users->get_by_id("ТУТ_ID");
var_dump($user);
```

### Удалить из компании
``` php
$users = $yougile->api("users");
$res = $users->delete("ТУТ_ID");
var_dump($res);
```

## Доступные ресурсы
* Users
* Tasks
* Boards
* Chats
* Columns
* Departments
* GroupChats
* Projects
* Roles
* SprintStickers
* StringStickers
