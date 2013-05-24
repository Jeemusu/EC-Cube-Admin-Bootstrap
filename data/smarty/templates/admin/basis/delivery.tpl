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
<form name="form1" id="form1" method="post" action="?">
	<input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
	<input type="hidden" name="mode" value="edit" />
	<input type="hidden" name="deliv_id" value="" />
	<div id="basis" class="contents-main">
	
	    <div class="btn-area-top">
			<a class="btn btn-primary" href="javascript:;" name="subm2" onclick="fnChangeAction('./delivery_input.php'); fnModeSubmit('pre_edit','',''); return false;">
	        <span><i class="icon-plus"></i> 配送方法<!--{if $smarty.const.INPUT_DELIV_FEE}-->・配送料<!--{/if}-->を新規入力</span></a>
	    </div>
	    
	    <table class="table">
	        <col width="35%" />
	        <col width="30%" />
	        <col width="10%" />
	        <col width="10%" />
	        <col width="15%" />
	        <tr>
	            <th>配送業者</th>
	            <th>名称</th>
	            <th class="center">編集</th>
	            <th class="center">削除</th>
	            <th class="center">移動</th>
	        </tr>
	        <!--{section name=cnt loop=$arrDelivList}-->
	            <tr>
	                <td><!--{$arrDelivList[cnt].name|h}--></td>
	                <td><!--{$arrDelivList[cnt].service_name|h}--></td>
	                <td class="center"><a href="?" class="btn" onclick="fnChangeAction('./delivery_input.php'); fnModeSubmit('pre_edit', 'deliv_id', <!--{$arrDelivList[cnt].deliv_id}-->); return false;">
	                    編集</a></td>
	                <td class="center"><a class="btn btn-danger" href="?" onclick="fnModeSubmit('delete', 'deliv_id', <!--{$arrDelivList[cnt].deliv_id}-->); return false;">
	                    削除</a></td>
	                <td class="center">
	                <!--{if $smarty.section.cnt.iteration != 1}-->
	                <a href="?" class="btn" onclick="fnModeSubmit('up','deliv_id', '<!--{$arrDelivList[cnt].deliv_id}-->'); return false;"><i class="icon-chevron-sign-up"></i></a>
	                <!--{/if}-->
	                <!--{if $smarty.section.cnt.iteration != $smarty.section.cnt.last}-->
	                <a href="?" class="btn" onclick="fnModeSubmit('down','deliv_id', '<!--{$arrDelivList[cnt].deliv_id}-->'); return false;"><i class="icon-chevron-sign-down"></i></a>
	                <!--{/if}-->
	                </td>
	            </tr>
	        <!--{/section}-->
	    </table>
	</div>
</form>