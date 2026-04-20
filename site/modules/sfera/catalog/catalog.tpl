~~mod path="sfera/" mod_name="header" tpl="header"~~

<div class="catalog-page container">
    <h1>Каталог товаров</h1>

    ~~php
    // Подключаем базу данных
    site/classes/db.class.php и т.д.
    // или     require_once 'site/libs/mysql.php';
    
    $sql = "SELECT p.*, b.name as brand_name, c.name as category_name 
            FROM products p 
            LEFT JOIN brands b ON p.brand_id = b.id 
            LEFT JOIN categories c ON p.category_id = c.id 
            WHERE p.is_active = 1 
            ORDER BY p.created_at DESC";

    $goods = $mysqli->query($sql)->fetch_all(MYSQLI_ASSOC);   // или как у тебя принято
    ~~/php~~

    <div class="products-grid">
    ~~foreach from=$goods item=good~~
        <div class="product-card">
            <img src="~~$good.image~~" alt="~~$good.name~~">
            <h3>~~$good.name~~</h3>
            ~~if $good.brand_name~~<p>~~$good.brand_name~~</p>~~/if~~
            <p><strong>~~$good.price~~ ₽</strong></p>
        </div>
    ~~/foreach~~
    </div>
</div>

~~mod path="sfera/" mod_name="footer" tpl="footer"~~