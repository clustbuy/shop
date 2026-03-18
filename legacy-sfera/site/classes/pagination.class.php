<?php

class pagination extends aModule
{
    /**
     * Функция формирует неоходиные данные для корректного формирования блока 
     * в шаблоне.
     * @param int $page Номер текущей страницы.
     * @param string $path Путь каталога.
     * @param int $items_per_page Число товаров отображаемое на странице.
     * @param string $where Выборка по базе.
     * @param int $max_print_pages Максимально число страниц отобрачаемое 
     * в пагинации.
     * @return array Массив представляет с собой данные, необходимые для 
     * формирования шаблона.
     **/
    function execute($page, $path, $items_per_page,  $where, $max_print_pages = 9)
    {
        // Вычисление какой по счёту будет страница по середине в пагинации.
        $middle_page = ceil($max_print_pages / 2);

        $total_items = select('items', 'count(*) AS total', $where);
        $total_pages = ceil($total_items['total'] / $items_per_page);

        $print_pages = array();

        // Добавление первой страницы в начало пагинации, если её не будет в 
        // цикле ниже.
        if ($page > $middle_page) {
            array_push($print_pages, array(
                'num' => 1,
                'path' => $path . "/page/1",
                'is_first' => true,
            ));
        }

        $print_pages_start = $page - ($middle_page - 2);
        $print_pages_end = $page + ($middle_page - 1);

        if ($total_pages > 1) {
            for ($i = $print_pages_start; $i < $print_pages_end; $i++) {
                if ($i < 1 || $i > $total_pages) {
                    continue;
                }
                array_push($print_pages, array(
                    'num' => $i,
                    'path' => $path . "/page/" . $i,
                    'is_current' => $i == $page,
                ));
            }
        }

        // Добавление последней страницы в конец пагинации, если её не будет в 
        // цикле выше.
        if ($page < $total_pages - ($middle_page - 2)) {
            array_push($print_pages, array(
                'num' => $total_pages,
                'path' => $path . "/page/" . $total_pages,
                'is_last' => true,
            ));
        }

        $total_printed_items = ($page * $items_per_page > $total_items['total'] ? $total_items['total'] : $page * $items_per_page);

        $pagination = array(
            'current' => $page, // Текущая страница.
            'print_pages' => $print_pages, // Массив с выводимыми страницами.
            'total_pages' => $total_pages, // Всего страниц.
            'total_items' => $total_items['total'], // Всего товаров.
            'items_per_page' => $items_per_page, // Количество отобрачаемого 
            // товара на страницу.
            'total_printed_items' => $total_printed_items, // Сколько было выведено
            // товара до этой страницы (включая текущую страницу).
        );

        // Предыдущая страница
        if ($page > 1) {
            $pagination['prev'] = array(
                'num' => $page - 1,
                'path' => $path . "/page/" . ($page - 1),
            );
        }

        // Следующая страница
        if ($page < $total_pages) {
            $pagination['next'] = array(
                'num' => $page + 1,
                'path' => $path . "/page/" . ($page + 1),
            );
        }

        return $pagination;
    }
}
