<?php
/*
 * This file is part of EC-CUBE
 *
 * Copyright(c) 2000-2013 LOCKON CO.,LTD. All Rights Reserved.
 *
 * http://www.lockon.co.jp/
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 */

// {{{ requires
require_once CLASS_REALDIR . 'pages/admin/total/LC_Page_Admin_Total.php';

/**
 * 売上集計 のページクラス(拡張).
 *
 * LC_Page_Admin_Total をカスタマイズする場合はこのクラスを編集する.
 *
 * @package Page
 * @author LOCKON CO.,LTD.
 * @version $Id: LC_Page_Admin_Total_Ex.php 22206 2013-01-07 09:10:12Z kim $
 */
class LC_Page_Admin_Total_Ex extends LC_Page_Admin_Total {

    // }}}
    // {{{ functions

    /**
     * Page を初期化する.
     *
     * @return void
     */
    function init() {
        parent::init();
    }

    /**
     * Page のアクション.
     *
     * @return void
     */
    function action() {

        if (isset($_GET['draw_image']) && $_GET['draw_image'] != '') {
            define('DRAW_IMAGE' , true);
        } else {
            define('DRAW_IMAGE' , false);
        }

        // パラメーター管理クラス
        $objFormParam = new SC_FormParam_Ex();
        // パラメーター情報の初期化
        $this->lfInitParam($objFormParam);
        $objFormParam->setParam($_REQUEST);

        // 検索ワードの引き継ぎ
        $this->arrHidden = $objFormParam->getSearchArray();

        switch ($this->getMode()) {
            case 'csv':
            case 'search':

                $this->arrErr = $this->lfCheckError($objFormParam);
                if (empty($this->arrErr)) {

                    // 日付
                    list($sdate, $edate) = $this->lfSetStartEndDate($objFormParam);

                    // ページ
                    $page = ($objFormParam->getValue('page')) ? $objFormParam->getValue('page') : 'term';

                    // 集計種類
                    $type = ($objFormParam->getValue('type')) ? $objFormParam->getValue('type'): 'all';

                    $this->tpl_page_type = 'total/page_'. $page .'.tpl';
                    
                    $this->graph_type = $page;
                     
                    // FIXME 可読性が低いので call_user_func_array を使わない (またはメソッド名を1つの定数値とする) 実装に。
                    list($this->arrResults, $this->tpl_image) = call_user_func_array(array($this, 'lfGetOrder'.$page),
                                                                                     array($type, $sdate, $edate));
                    if ($this->getMode() == 'csv') {
                        // CSV出力タイトル行の取得
                        list($arrTitleCol, $arrDataCol) = $this->lfGetCSVColum($page);
                        $head = SC_Utils_Ex::sfGetCSVList($arrTitleCol);
                        $data = $this->lfGetDataColCSV($this->arrResults, $arrDataCol);

                        // CSVを送信する。
                        list($fime_name, $data) = SC_Utils_Ex::sfGetCSVData($head.$data);

                        $this->sendResponseCSV($fime_name, $data);
                        SC_Response_Ex::actionExit();
                    }
                }
                break;
            default:
                break;
        }
        
        $graph_array = array();

        if($page == 'term') {
 
         	if($type == 'year' || $type == 'wday' || $type=='hour' || $type == 'month') {
	 	        foreach($this->arrResults as $key=>$result) {
	 	        	$graph_array[$key] = array($result['str_date'], (int)$result['total'] );
					
		        }  
		         
	        } else {
	 	        foreach($this->arrResults as $key=>$result) {
	 	        	if($result['total'] == null) {
	 	        		$total =0;
	 	        	} else {
	 	        		$total=$result['total'];
	 	        	}
		        	$graph_array[$key] = array(strtotime($result['str_date'])*1000,$total );
		        }  
		         
	        }
	        
	        // Unset last row used for grand totals (unsed by graphs)
	        unset($graph_array[count($graph_array)-1]); 
	         
        } else if($page == 'products') {
	        foreach($this->arrResults as $key=>$result) {
	        	$graph_array[$key]['label'] = $result['product_name'];
	        	$graph_array[$key]['data'] = $result['total'];
	        }
	        
		} else if($page == 'age') {
	    
	        foreach($this->arrResults as $key=>$result) {
	        	$graph_array[$key] = array($result['age_name'], (int)$result['total'] );
	        }
	        
		} else if($page == 'job') {
			foreach($this->arrResults as $key=>$result) {
	        	$graph_array[$key]['label'] = $result['job_name'];
	        	$graph_array[$key]['data'] = $result['total'];
	        }
	        
		} else if($page == 'member') {
			foreach($this->arrResults as $key=>$result) {
	        	$graph_array[$key]['label'] = $result['member_name'];
	        	$graph_array[$key]['data'] = $result['total'];
	        }
		}
		
		$this->tpl_json = json_encode($graph_array);
 	
        // 画面宣しても日付が保存される
        $_SESSION           = $this->lfSaveDateSession($_SESSION, $this->arrHidden);
        $objFormParam->setParam($_SESSION['total']);
        // 入力値の取得
        $this->arrForm      = $objFormParam->getFormParamList();
        $this->tpl_subtitle = $this->arrTitle[$objFormParam->getValue('page')];

    }
    
    /**
     * Page のプロセス.
     *
     * @return void
     */
    function process() {
        parent::process();
    }

    /**
     * デストラクタ.
     *
     * @return void
     */
    function destroy() {
        parent::destroy();
    }
}
