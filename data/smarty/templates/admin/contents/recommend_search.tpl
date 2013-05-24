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

<!--{include file="`$smarty.const.TEMPLATE_ADMIN_REALDIR`admin_popup_header.tpl"}-->

<script type="text/javascript">
<!--
self.moveTo(20,20);self.focus();

function func_submit( id ){
    var fm = window.opener.document.form<!--{$smarty.get.rank}-->;
    fm.product_id.value = id;
    fm.mode.value = 'set_item';
    fm.rank.value = '<!--{$smarty.get.rank}-->';
    fm.submit();
    window.close();
    return false;
}
//-->
</script>

<!--▼検索フォーム-->
<div style="padding: 0 20px;margin:0;">
<form name="form1" id="form1" method="post" action="#">
<input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
<input name="mode" type="hidden" value="search" />
<input name="search_pageno" type="hidden" value="" />
    <table class="table">
        <col width="20%" />
        <col width="80%" />
        <tr>
            <th>カテゴリ</th>
            <td>
                <select name="search_category_id">
                    <option value="" selected="selected">選択してください</option>
                    <!--{html_options options=$arrCatList selected=$arrForm.search_category_id}-->
                </select>
            </td>
        </tr>
        <tr>
            <th>商品コード</th>
            <td><input type="text" name="search_product_code" value="<!--{$arrForm.search_product_code}-->"class="span4" /></td>
        </tr>
        <tr>
            <th>商品名</th>
            <td><input type="text" name="search_name" value="<!--{$arrForm.search_name}-->"class="span4" /></td>
        </tr>
    </table>
    <div class="btn-area">
        <a class="btn btn-primary" href="javascript:;" onclick="fnFormModeSubmit('form1', 'search', '', ''); return false;"><span class="btn-next"><i class="icon-search"></i> 検索を開始</span></a>
    </div>
    <!--{* ▼検索結果表示 *}-->
    <!--{if is_numeric($tpl_linemax)}-->
    <p><!--{$tpl_linemax}-->件が該当しました。</p>
    <!--{$tpl_strnavi}-->

    <table class="table">
        <col width="15%" />
        <col width="30%" />
        <col width="35%" />
        <col width="20%" />
        <tr>
            <th class="center">商品画像</th>
            <th>商品コード</th>
            <th>商品名</th>
            <th class="center">決定</th>
        </tr>

        <!--{foreach name=loop from=$arrProducts item=arr}-->
        <!--▼商品<!--{$smarty.foreach.loop.iteration}-->-->
        <tr>
            <td class="center">
                <img src="<!--{$smarty.const.ROOT_URLPATH}-->resize_image.php?image=<!--{$arr.main_list_image|sfNoImageMainList|h}-->&width=65&height=65" alt="" />
            </td>
            <td>
                <!--{assign var=codemin value=`$arr.product_code_min`}-->
                <!--{assign var=codemax value=`$arr.product_code_max`}-->
                <!--{* 商品コード *}-->
                <!--{if $codemin != $codemax}-->
                    <!--{$codemin|h}--> ～ <br /><!--{$codemax|h}-->
                <!--{else}-->
                    <!--{$codemin|h}-->
                <!--{/if}-->
            </td>
            <td><!--{$arr.name|h}--></td>
            <td class="center"><a href="" class="btn" onClick="return func_submit(<!--{$arr.product_id}-->)">決定</a></td>
        </tr>
        <!--▲商品<!--{$smarty.foreach.loop.iteration}-->-->    
        <!--{/foreach}-->
        <!--{if !$tpl_linemax>0}-->
        <tr>
            <td colspan="4">商品が登録されていません</td>
        </tr>
        <!--{/if}-->
        
    </table>
    <!--{/if}-->
    <!--{* ▲検索結果表示 *}-->

</form>
</div>
<!--{include file="`$smarty.const.TEMPLATE_ADMIN_REALDIR`admin_popup_footer.tpl"}-->
