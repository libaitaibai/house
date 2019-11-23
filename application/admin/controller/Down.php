<?php
namespace app\admin\controller;

use app\admin\model\House;
use app\admin\model\TaskData;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use  PhpOffice\PhpSpreadsheet\IOFactory;

class Down {

    /**
     * 任务统计已经完成的
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function downloadtongji()
    {
        $db = new TaskData();
        $where=[];
        $list = $db->with(['Agent', 'Client', 'Worker'])->where($where)->order('id', 'desc')->select()->toArray();

        $data = [];
        $type = [1 => '单一工作',2=>'持续性工作'];
        foreach ($list as $key=> $val){
            $data[$key]['id'] = $val['id'];
            $data[$key]['title'] = $val['title'];
            $data[$key]['price'] = $val['price'];
            $data[$key]['type'] = $type[$val['type']];
            $data[$key]['client'] = $val['client']['name'];
            $data[$key]['agent'] = $val['client']['name'];
            $data[$key]['worker'] = $val['worker']['name'];
            $data[$key]['description'] = $val['description'];
            $data[$key]['addtime'] = $val['addtime'];
        }

        $title = ['ID', '任务名', '单价','类型','客户','经纪人','工人','描述','添加时间'];

//        echo '<pre>';var_dump($data);exit;
        $this->excel($data,$title,'已完成任务统计');

    }

    /**
     * 导出方法
     * @param $data
     * @param $title
     * @param $fileName
     * @throws \PhpOffice\PhpSpreadsheet\Exception
     * @throws \PhpOffice\PhpSpreadsheet\Writer\Exception
     */
    public function excel($data,$title,$fileName)
    {
        $spreadsheet = new Spreadsheet();
        $worksheet = $spreadsheet->getActiveSheet();

        $worksheet->getDefaultColumnDimension()->setWidth(16);

        //设置工作表标题名称
        $worksheet->setTitle('工作表格1');

        //表头
        //设置单元格内容
        foreach ($title as $key => $value) {
            $worksheet->setCellValueByColumnAndRow($key+1, 1, $value);
        }

        $row = 2; //从第二行开始
        foreach ($data as $item) {
            $column = 1;

            foreach ($item as $value) {
                $worksheet->setCellValueByColumnAndRow($column, $row, $value);
                $column++;
            }
            $row++;
        }

        //1.下载到服务器
        //$writer = IOFactory::createWriter($spreadsheet, 'Xlsx');
        //$writer->save($fileName.'.'.$fileType);

        //2.输出到浏览器
        $writer = IOFactory::createWriter($spreadsheet, 'Xlsx'); //按照指定格式生成Excel文件
        $this->excelBrowserExport($fileName, 'Xlsx');
        $writer->save('php://output');
    }

    /**
     *      * 导出方法
     * @param $fileName
     * @param string $fileType
     */
    public function excelBrowserExport($fileName, $fileType="xls") {

        //文件名称校验
        if(!$fileName) {
            trigger_error('文件名不能为空', E_USER_ERROR);
        }

        //Excel文件类型校验
        $type = ['Excel2007', 'Xlsx', 'Excel5', 'xls'];
        if(!in_array($fileType, $type)) {
            trigger_error('未知文件类型', E_USER_ERROR);
        }

        if($fileType == 'Excel2007' || $fileType == 'Xlsx') {
            header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
            header('Content-Disposition: attachment;filename="'.$fileName.'.xlsx"');
            header('Cache-Control: max-age=0');
        } else { //Excel5
            header('Content-Type: application/vnd.ms-excel');
            header('Content-Disposition: attachment;filename="'.$fileName.'.xls"');
            header('Cache-Control: max-age=0');
        }
    }
}
