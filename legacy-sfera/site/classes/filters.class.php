<?php
class filters extends aModule
{
    private $common = array(
        'type-of-sale' => array('Все', 'Опт', 'Розница'),
    );

    private $sqlWhere = array(
        'type-of-sale' => array(
            'Все' => '',
            'Опт' => '(wholesale_amount > 1)',
            'Розница' => '(wholesale_amount IS NULL OR wholesale_amount = 1)',
        )
    );

    private $paramPrefix = "filter_";
    private $paramPrefixLen;
    private $treeID = '';

    private $enabled = array();

    function __construct($treeID = '')
    {
        $this->paramPrefixLen = mb_strlen($this->paramPrefix);

        if ($treeID != '')
            $this->treeID = $treeID;

        if (empty($_SESSION['filters'])) {
            $_SESSION['filters'] = array();
            $_SESSION['filters']['category'] = array();
            $_SESSION['filters']['common'] = array();
            $_SESSION['filters']['treeID'] = $this->treeID;
        } else {
            // Сбрасывать фильтры категории, если сейчас другая категория.
            if ($_SESSION['filters']['treeID'] != $this->treeID) {
                $_SESSION['filters']['category'] = array();
                $_SESSION['filters']['treeID'] = $this->treeID;
            }

            // Применение фильров из сесси.
            $this->enabled = $_SESSION['filters'];
        }
    }

    /**
     * Получение части SQL запроса для WHERE.
     *
     * @return String
     **/
    public function getSQLWhere()
    {
        $where = '';

        if ($this->enabled['common']) {
            foreach ($this->enabled['common'] as $key => $value) {
                $where = empty($where) ? '' : ' AND ';

                $where .= $this->sqlWhere[$key][$value];
            }
        }

        // Использовать тогда, когда это категория.
        if ($this->treeID != '' && $this->enabled['category']) {
            foreach ($this->enabled['category'] as $key => $value) {
                $where .= empty($where) ? '' : ' AND ';

                $where .= "(it.id IN (" .
                    "SELECT item_id " .
                    "FROM p_values " .
                    "WHERE (parameter_id = (SELECT id FROM parameters WHERE name  = '" . $key . "')" .
                    " AND value IN ('" . implode("','", $value) . "'))" .
                    "))";
            }
        }

        if (!empty($where))
            $where = '(' . $where . ')';

        return $where;
    }

    /**
     * Применить новые фильтры полученные при запросе.
     *
     * @param Array $params Параметры переданные в запросе.
     * @return Boolean Применялись ли новые фильтры.
     * Например, $arr['send_params'].
     **/
    public function applyFormParams($params)
    {
        $changed = false;
        $changedCategory = false;

        foreach ($params as $key => $value) {
            // Ищем только параметры с нужным фильром.
            if (
                mb_strlen($key) > $this->paramPrefixLen
                && mb_substr($key, 0, $this->paramPrefixLen) == $this->paramPrefix
            ) {
                $name = mb_substr($key, 7);

                if (mb_substr($name, 0, 9) === 'category_') {
                    $name = mb_substr($name, 9);

                    // Нажата кнопка очищения всех фильтров категории.
                    if ($name == 'clear') {
                        $this->enabled['category'] = array();
                        $this->save();
                        // Не обрабатывать остальные фильтры.
                        $changed = true;
                        return;
                    }

                    // Нажата кнопка сброса значения одного фильтра.
                    if (mb_substr($name, -6) === '_clear') {
                        $name = mb_substr($name, 0, mb_strlen($name) - 6);

                        unset($this->enabled['category'][$name]);
                        unset($params[$this->paramPrefix . 'category_' . $name]);
                        $changed = true;
                        continue;
                    }

                    if (!$changedCategory) {
                        $this->enabled['category'] = array();
                        $changedCategory = true;
                    }

                    $this->enabled['category'][$name] = $value;
                    $changed = true;
                }

                if (mb_substr($name, 0, 7) === 'common_') {
                    $name = mb_substr($name, 7);

                    // Применяем только те фильтры, которые задекларированы.
                    if (array_key_exists($name, $this->common) && in_array($value, $this->common[$name])) {
                        $this->enabled['common'][$name] = $value;
                        $changed = true;
                    }
                }
            }
        }

        // Сохранить данные в сессию.
        if ($changed)
            $this->save();

        return $changed;
    }

    /**
     * Функция сохранения данных в сессию.
     **/
    private function save()
    {
        $_SESSION['filters'] = $this->enabled;
    }

    /**
     * Получение всех доступных фильтров.
     *
     * @return array
     **/
    public function getAll()
    {
        $filters = array();

        // Фильтры категории.
        if ($this->treeID != '') {
            $filters['category'] = array();

            $parameters_query = array();
            $parameters_query['from'] = 'parameters';
            $parameters_query['where'] = 'id IN (SELECT parameter_id FROM tree_parameters WHERE tree_id = ' . $this->treeID . ')';
            $parameters = sel($parameters_query);

            $parameterIDs = array();
            foreach ($parameters as $parameter) {
                // Добавляем массивы, которые потом будем заполнять.
                $parameter['values'] = array();
                $parameter['active'] = array();
                // Добавляем префиксы, чтобы определять параметр.
                $parameter['name'] = $this->paramPrefix . 'category_' . $parameter['name'];
                // Добавляем параметер в общий массив.
                $filters['category'][$parameter['id']] = $parameter;

                array_push($parameterIDs, $parameter['id']);
            }

            if (!empty($parameterIDs)) {
                $values_query = array();
                $values_query['what'] = 'pv.value AS value, m.name AS measure, pv.parameter_id AS parameter_id, p.name AS parameter_name';
                $values_query['from'] = 'p_values pv LEFT JOIN measurements m ON m.id = pv.measure_id LEFT JOIN parameters p ON p.id = pv.parameter_id';
                $values_query['where'] = 'pv.parameter_id IN (' . implode(',', $parameterIDs) . ')';
                $values_query['group'] = 'value, parameter_id, measure';
                $values = sel($values_query);

                foreach ($values as $value) {
                    array_push($filters['category'][$value['parameter_id']]['values'], $value);

                    // Добавить в массив активных значений фильтра.
                    if (
                        $this->enabled['category'][$value['parameter_name']]
                        && in_array($value['value'], $this->enabled['category'][$value['parameter_name']])
                    ) {
                        array_push($filters['category'][$value['parameter_id']]['active'], $value['value']);
                    }
                }
            }
        }

        // Общие фильтры.
        $filters['common'] = array();
        foreach ($this->common as $key => $value) {
            $filter = array(
                'values' => $value,
                'name' => $this->paramPrefix . 'common_' . $key,
            );

            if ($this->enabled['common'][$key]) {
                $filter['active'] = $this->enabled['common'][$key];
            }

            // Создаём новый массив, если его ещё нет.
            if (!array_key_exists(($this->paramPrefix . $key), $filters['common']))
                $filters['common'][$this->paramPrefix . $key] = array();

            $filters['common'][$this->paramPrefix . $key] = $filter;
        }

        return $filters;
    }
}
