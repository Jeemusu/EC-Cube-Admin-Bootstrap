<!--{*
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
*}-->

<form name="form1" id="form1" method="POST" action="?" >
<input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
<input type="hidden" name="mode" value="" />
<input type="hidden" name="status" value="<!--{if $arrForm.status == ""}-->1<!--{else}--><!--{$arrForm.status}--><!--{/if}-->" />
<input type="hidden" name="search_pageno" value="<!--{$tpl_pageno}-->" >
<input type="hidden" name="order_id" value="" />
<div id="order" class="contents-main">
    <h2>抽出条件</h2>
        <div>
        
        <ul class="nav nav-tabs">

       <!--{foreach key=key item=item from=$arrORDERSTATUS}-->
           
             <li
                <!--{if $key != $SelectedStatus}-->
                <!--{else}-->
                	class="active"
                <!--{/if}-->
             >
             <a href="javascript:;" onclick="document.form1.search_pageno.value='1'; fnModeSubmit('search','status','<!--{$key}-->' ); return false;">
             <!--{$item}-->
             </a>
             </li>
             
 
        <!--{/foreach}-->
        </ul>
        
        </div>
    <h2>対応状況変更</h2>
    <!--{* 登録テーブルここから *}-->
    <!--{if $tpl_linemax > 0}-->
      
        	<p>
            <select name="change_status" style="margin: 0;">
                <option value="" selected="selected" style="<!--{$Errormes|sfGetErrorColor}-->" >選択してください</option>
                <!--{foreach key=key item=item from=$arrORDERSTATUS}-->
                <!--{if $key ne $SelectedStatus}-->
                <option value="<!--{$key}-->" ><!--{$item}--></option>
                <!--{/if}-->
                <!--{/foreach}-->
                <option value="delete">削除</option>
            </select>
            
            <a class="btn btn-primary" href="javascript:;" onclick="fnSelectCheckSubmit(); return false;"><span>移動</span></a>
            </p>
        
        <p><span class="attention">※ <!--{$arrORDERSTATUS[$smarty.const.ORDER_CANCEL]}-->もしくは、削除に変更時には、在庫数を手動で戻してください。</span></p>

        <p class="remark">
            <!--{$tpl_linemax}-->件が該当しました。
            <!--{$tpl_strnavi}-->
        </p>

        <table class="table">
            <col width="5%" />
            <col width="7%" />
            <col width="9%" />
            <col width="15%" />
            <col width="20%" />
            <col width="10%" />
            <col width="10%" />
            <col width="8%" />
            <col width="8%" />
            <tr>
                <th class="center"><label for="move_check">選択</label> <input type="checkbox" name="move_check" id="move_check" onclick="fnAllCheck('move_check', 'move[]')" /></th>
                <th>対応状況</th>
                <th>注文番号</th>
                <th>受注日</th>
                <th>お名前</th>
                <th>支払方法</th>
                <th>購入金額（円）</th>
                <th class="center">入金日</th>
                <th class="center">発送日</th>
            </tr>
            <!--{section name=cnt loop=$arrStatus}-->
            <!--{assign var=status value="`$arrStatus[cnt].status`"}-->
            <tr style="background:<!--{$arrORDERSTATUS_COLOR[$status]}-->;">
                <td class="center"><input type="checkbox" name="move[]" value="<!--{$arrStatus[cnt].order_id}-->" ></td>
                <td><!--{$arrORDERSTATUS[$status]}--></td>
                <td><a href="#" onclick="fnOpenWindow('./disp.php?order_id=<!--{$arrStatus[cnt].order_id}-->','order_disp','800','900'); return false;" ><!--{$arrStatus[cnt].order_id}--></a></td>
                <td><!--{$arrStatus[cnt].create_date|sfDispDBDate:false}--></td>
                <td><!--{$arrStatus[cnt].order_name01|h}--><!--{$arrStatus[cnt].order_name02|h}--></td>
                <!--{assign var=payment_id value=`$arrStatus[cnt].payment_id`}-->
                <td><!--{$arrPayment[$payment_id]|h}--></td>
                <td class="right"><!--{$arrStatus[cnt].total|number_format}--></td>
                <td class="center"><!--{if $arrStatus[cnt].payment_date != ""}--><!--{$arrStatus[cnt].payment_date|sfDispDBDate:false}--><!--{else}-->未入金<!--{/if}--></td>
                <td class="center"><!--{if $arrStatus[cnt].status eq 5}--><!--{$arrStatus[cnt].commit_date|sfDispDBDate:false}--><!--{else}-->未発送<!--{/if}--></td>
            </tr>
            <!--{/section}-->
        </table>

        <p><!--{$tpl_strnavi}--></p>

    <!--{elseif $arrStatus != "" & $tpl_linemax == 0}-->
        <div class="message">
            該当するデータはありません。
        </div>
    <!--{/if}-->

    <!--{* 登録テーブルここまで *}-->
</div>
</form>


<script type="text/javascript">
<!--
function fnSelectCheckSubmit(){
    var selectflag = 0;
    var fm = document.form1;

    if (fm.change_status.options[document.form1.change_status.selectedIndex].value == "") {
        selectflag = 1;
    }

    if (selectflag == 1) {
        alert('セレクトボックスが選択されていません');
        return false;
    }
    var i;
    var checkflag = 0;
    var max = fm["move[]"].length;

    if (max) {
        for (i=0;i<max;i++){
            if(fm["move[]"][i].checked == true) {
                checkflag = 1;
            }
        }
    } else {
        if (fm["move[]"].checked == true) {
            checkflag = 1;
        }
    }

    if (checkflag == 0){
        alert('チェックボックスが選択されていません');
        return false;
    }

    if (selectflag == 0 && checkflag == 1) {
        document.form1.mode.value = 'update';
        document.form1.submit();
    }
}

    function fnAllCheck(parent,id) {
   		
   		$("input:checkbox[name='"+id+"']").each(function(e){
   		if($('#'+parent).is(':checked')) {
   			$(this).attr('checked', true);
   		} else {
   			$(this).attr('checked', false);
   		}


   		});
    }
//-->
</script>
