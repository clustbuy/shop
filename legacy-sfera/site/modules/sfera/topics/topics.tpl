<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Тематики - Творческий Центр СФЕРА</title>
    ~~include file="sfera/tpl/favicon.tpl"~
    <link rel="stylesheet" href="/assets/sfera/styles.css">
    <link rel="stylesheet" href="/assets/sfera/css/header.css">
    <link rel="stylesheet" href="/assets/sfera/css/catalog.css">
    ~~include file="sfera/tpl/scripts.tpl"~
</head>
<body>
~~include file="sfera/tpl/header.tpl"~
~~include file="sfera/tpl/mobile_menu.tpl"~

<!-- Breadcrumbs -->
<div class="breadcrumbs">
    <div class="container">
        <a href="/">Главная</a>
        <span>/</span>
        <a href="/catalog/">Каталог</a>
        <span>/</span>
        <span>Тематики</span>
    </div>
</div>

<!-- Topics Page -->
<main class="catalog-page">
    <div class="container">
        <div class="catalog-header">
            <h1>Тематики</h1>
            <p class="catalog-description">Список всех тематик в алфавитном порядке</p>
        </div>

        <div class="authors-list">
~~if $groupedTopics|@count > 0~
~~foreach from=$groupedTopics key=letter item=topicsInGroup~
            <div class="authors-group">
                <h2 class="authors-letter">~~$letter~</h2>
                <div class="authors-grid">
~~foreach from=$topicsInGroup item=topic~
                    <div class="author-item">
                        <a href="/topic/?topic_id=~~$topic.id~" class="author-link">
                            <span class="author-name">~~$topic.name~</span>
                            <span class="author-count">(~~$topic.count~)</span>
                        </a>
                    </div>
~~/foreach~
                </div>
            </div>
~~/foreach~
~~else~
            <p>Тематики не найдены.</p>
~~/if~
        </div>
    </div>
</main>

~~include file="sfera/tpl/footer.tpl"~
<script src="/assets/sfera/script.js"></script>
<script src="/assets/sfera/js/header.js"></script>

</body>
</html>

