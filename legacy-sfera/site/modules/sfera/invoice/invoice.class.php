<?php
include_once('site/classes/aModule.class.php');
include_once('site/modules/market/order/order.class.php');


require 'vendor/autoload.php';

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use PhpOffice\PhpSpreadsheet\Worksheet\Drawing;
use PhpOffice\PhpSpreadsheet\IOFactory;
use PhpOffice\PhpSpreadsheet\Helper\Sample;

class invoice extends aModule
{
    function execute($arr)
    {
    	if ($_POST['inn'] != '') {

            $order = new order();
            $order->make($arr);

            $this->print_invoice();

        }
        else
        {
            $_SESSION['smarty']->display('sfera/invoice/invoice.tpl');
        }
    }

    function print_invoice()
    {

            $products = $_SESSION['order']['items'];

            $innGet = trim(strip_tags($_POST["inn"]));
			$company = 'Название компании';
			$yslyga = 'наименование услуги';
			$count = '5';
			$sum = 0;
			$N = 2;


            $styleArray = [
                'borders' => [
                   'top' => [
                        'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
                    ],
                   'bottom' => [
                        'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
                    ],
                   'left' => [
                        'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
                    ],
                   'right' => [
                        'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
                    ]
                 ]
            ];
            $styleArrayForD = [
                'borders' => [
                   'bottom' => [
                        'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
                    ]
                 ],
                 'alignment' => [
                    'horizontal' => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_LEFT,
                ]
            ];

			$reader = new \PhpOffice\PhpSpreadsheet\Reader\Xls();
			$spreadsheet = $reader->load("site/modules/market/invoice/template1.xls");

            $spreadsheet->getProperties()
                ->setCreator("ООО Элилайф") // Автор документа
                ->setTitle("Счёт") // Заголовок документа
                ->setSubject("Счёт") // Тема документа
                ->setDescription("Счёт") // Описание документа
                ->setKeywords("счёт") // Ключевые слова
                ->setCategory("счёт"); // Категория


            $sheet = $spreadsheet->getActiveSheet();
            //$sheet->setTitle('Счёт');



			$token   = "3ab30f043510035177906a0ffdee464036ee48ab";
			$dadata  = new DadataClient($token, null);

			$result  = $dadata->findById("party", $innGet, 1);

            // echo '<pre>';print_r($result);echo '</pre>'; die();

			$company = $result[0]['value'];
			$kpp = $result[0]['data']['kpp'];
			$inn = $result[0]['data']['inn'];
			$address = $result[0]['data']['address']['unrestricted_value'];
			$date = now();
			$mounth = $date['months'];
			$year = $date['year'];

			$month = '';
			switch ($date['months']) {
				case '01': $month = "января"; 	break;
				case '02': $month = "февраля"; 	break;
				case '03': $month = "марта"; 	break;
				case '04': $month = "апреля"; 	break;
				case '05': $month = "мая"; 		break;
				case '06': $month = "июня"; 	break;
				case '07': $month = "июля"; 	break;
				case '08': $month = "августа"; 	break;
				case '09': $month = "сентября"; break;
				case '10': $month = "октября"; 	break;
				case '11': $month = "ноября"; 	break;
				case '12': $month = "декабря"; 	break;
			}
			
			
			
			$sheet->setCellValue('F17', $company);
			$sheet->setCellValue('F18', $address);
			$sheet->setCellValue('F19', "$inn / $kpp");

			$all = 24;
			$allSummYach = 27;
			$countAll = count($products);
			$yacheikaItogo = $all + $countAll;
			$yacheikaItogoSNDS = $all + $countAll + 2;
			$sum = 0;
			$cont = count($products);
			$yacheikaItogoCount = $allSummYach + $countAll;
			$priceForMonth = 500;
			$priceAll = $priceForMonth * 12;
			$yacheikaSigh = 35 + $countAll;
			$itogo = $priceAll;// - ($priceAll * 0.5);
			$i = 0;
			$m = 22;
			$z = 23;

            /*
			if (1 == 1)
            {
                //($_POST['vznos'][0] == 1) {
				$all = 25;
				$allSummYach = 28;
				$yacheikaItogo = $all;
				$yacheikaItogoSNDS = $all + 2;
				$yacheikaItogoCount = $allSummYach;

                $sheet->insertNewRowBefore($z, 1);
				$sheet->mergeCells("B$m:C$m");
				$sheet->mergeCells("D$m:S$m");
				$sheet->mergeCells("T$m:V$m");
				$sheet->mergeCells("W$m:Y$m");
				$sheet->mergeCells("Z$m:AC$m");
				$sheet->mergeCells("AD$m:AG$m");
				$sheet->mergeCells("AH$m:AL$m");
				$sheet->getStyle("B$m")->applyFromArray($styleArray);
				$sheet->getStyle("D$m")->applyFromArray($styleArrayForD);
				$sheet->getStyle("T$m")->applyFromArray($styleArray);
				$sheet->getStyle("W$m")->applyFromArray($styleArray);
				$sheet->getStyle("Z$m")->applyFromArray($styleArray);
				$sheet->getStyle("AD$m")->applyFromArray($styleArray);
				$sheet->getStyle("AH$m")->applyFromArray($styleArray);

				$sheet->getCell("B$m")->setValue(1);
				$sheet->getCell("D$m")->setValue('Услуга размещения информации и файлов для карточек товаров');

				$sheet->getCell("T$m")->setValue('500');
				$sheet->getCell("W$m")->setValue('12');
				$sheet->getCell("Z$m")->setValue('6 000');
				$sheet->getCell("AD$m")->setValue('0');
				$sheet->getCell("AH$m")->setValue($itogo);
				$sum = $sum + $itogo;
				//$ins = insert('accounts', array('inn' => $inn, 'sum' => $sum));
				$account = "№$ins/$mounth-C";
				$sheet->setCellValue('B11', "Счет на оплату $account от ".$date['day']." ".$month." ".$year." г.");

                $sumStr = num2str($sum);

                $drawing = new \PhpOffice\PhpSpreadsheet\Worksheet\Drawing();
                $drawing->setName('Paid');
                $drawing->setDescription('Paid');
                $drawing->setPath('site/modules/market/invoice/sign.png'); // put your path and image here
                $drawing->setWidth(286);
                $drawing->setCoordinates('V'.$yacheikaSigh);
                $drawing->setWorksheet($spreadsheet->getActiveSheet());



                $sheet->setCellValue('AH'.$yacheikaItogo, "$sum руб.");
                $sheet->setCellValue('AH'.$yacheikaItogoSNDS, "$sum руб.");
                $sheet->setCellValue('B'.$yacheikaItogoCount, "Всего услуг на сумму $sumStr без НДС.");
			}
            else
            {
                */



			    foreach ($products as $key => $value)
                {
					$sheet->insertNewRowBefore($z, 1);
					$sheet->mergeCells("B$m:C$m");
					$sheet->mergeCells("D$m:S$m");
					$sheet->mergeCells("T$m:V$m");
					$sheet->mergeCells("W$m:Y$m");
					$sheet->mergeCells("Z$m:AC$m");
					$sheet->mergeCells("AD$m:AG$m");
					$sheet->mergeCells("AH$m:AL$m");
					$sheet->getStyle("B$m")->applyFromArray($styleArray);
					$sheet->getStyle("D$m")->applyFromArray($styleArrayForD);
					$sheet->getStyle("T$m")->applyFromArray($styleArray);
					$sheet->getStyle("W$m")->applyFromArray($styleArray);
					$sheet->getStyle("Z$m")->applyFromArray($styleArray);
					$sheet->getStyle("AD$m")->applyFromArray($styleArray);
					$sheet->getStyle("AH$m")->applyFromArray($styleArray);

					$sheet->getCell("B$m")->setValue($key);
					$sheet->getCell("D$m")->setValue($value['title']);

					$sheet->getCell("T$m")->setValue($value['cost']);
					$sheet->getCell("W$m")->setValue($value['amount']);
					$sheet->getCell("Z$m")->setValue($value['sum']);
					$sheet->getCell("AD$m")->setValue('0');
					$sheet->getCell("AH$m")->setValue($value['sum']);


					$sum += $value['sum'];
					$i++; $m++; $z++;
			    }

                $ins = insert('accounts', array('inn' => $inn, 'sum' => $sum));
                $account = "№$ins/$mounth-C";
                $sheet->setCellValue('B11', "Счет на оплату $account от ".$date['day']." ".$month." ".$year." г.");

                $sumStr = num2str($sum);
                // $drawing = new \PhpOffice\PhpSpreadsheet\Worksheet\Drawing();
                // $drawing->setName('Paid');
                // $drawing->setDescription('Paid');
                // $drawing->setPath('site/modules/market/invoice/sign.png'); // put your path and image here
                // $drawing->setCoordinates('V'.$yacheikaSigh);
                // $drawing->setWorksheet($spreadsheet->getActiveSheet());
                $sheet->setCellValue('AH'.$yacheikaItogo, "$sum руб.");
                $sheet->setCellValue('AH'.$yacheikaItogoSNDS, "$sum руб.");
                $sheet->setCellValue('B'.$yacheikaItogoCount, "Всего услуг на сумму $sumStr ");

        /*
            }
        */

			try {


                $writer = new \PhpOffice\PhpSpreadsheet\Writer\Pdf\Mpdf($spreadsheet);
                header("Content-type: application/pdf");
                header("Content-Disposition: inline; filename=$account.pdf");
                header('Cache-Control: max-age=0');
                header('Cache-Control: must-revalidate');
                header('Pragma: public');
                $writer->save('php://output');

                /*
                $writer = new \PhpOffice\PhpSpreadsheet\Writer\Pdf\Mpdf($spreadsheet);
                header("Content-type:application/pdf");
                header("Content-Disposition: attachment;filename=$account.pdf");
                $writer->save('php://output');
                */

				// $writer = new \PhpOffice\PhpSpreadsheet\Writer\Xls($spreadsheet);
				// header("Content-type:application/xls");
				// $spreadsheet->save('php://output');
				// header("Content-Disposition: attachment;filename=bill.xls");
				// $writer->setOutputEncoding('SJIS-WIN');

                // // $writer->setUseBOM(false);
				// // $writer->setOutputEncoding('UTF-8');




			} catch (PhpOffice\PhpSpreadsheet\Writer\Exception $e) {
			    echo $e->getMessage();

			}

    }
}