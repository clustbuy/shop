<?php

include_once('site/classes/aModule.class.php');

class about extends aModule
{
    function execute($arr = array())
    {
        $_SESSION['smarty']->assign('page_title', 'О нас — Центр оптики Визус');
        $_SESSION['smarty']->assign('page_description', 'Узнайте больше о центре оптики Визус: наш опыт, ценности, салоны и команда профессионалов.');

        // Здесь можно добавить данные для шаблона
        $data = [
            'experience' => 'более 15 лет',
            'salons_count' => 8,
            'cities' => 'Москва и Московская область',
            'mission' => 'Помогать людям видеть мир ярче и четче с помощью качественной оптики и профессионального подхода.'
        ];

        $_SESSION['smarty']->assign('about_data', $data);

        return $_SESSION['smarty']->fetch('about/index.tpl');
    }
}