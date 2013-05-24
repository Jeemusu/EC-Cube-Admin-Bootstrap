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
<form name="form1" id="form1" method="post" action="">
	<input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
	<input type="hidden" name="mode" value="edit" />
	<input type="hidden" name="classcategory_id" value="<!--{$tpl_classcategory_id}-->" />
	<!--{foreach key=key item=item from=$arrHidden}-->
	    <input type="hidden" name="<!--{$key}-->" value="<!--{$item|h}-->" />
	<!--{/foreach}-->
<div id="products" class="contents-main">

    <table class="table">
        <tr>
            <th>規格名</th>
            <td><!--{$tpl_class_name}--></td>
        </tr>
        <tr>
            <th>分類名<span class="attention"> *</span></th>
            <td>
                <!--{if $arrErr.name}-->
                    <span class="attention"><!--{$arrErr.name}--></span>
                <!--{/if}-->
                <input type="text" name="name" value="<!--{$arrForm.name|h}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="" class="span5" />
                <span class="warning"> (上限<!--{$smarty.const.STEXT_LEN}-->文字)</span>
            </td>
        </tr>
    </table>
    <div class="btn-area">
        <a class="btn" href="<!--{$smarty.const.ROOT_URLPATH}--><!--{$smarty.const.ADMIN_DIR}-->products/classcategory.php?class_id=<!--{$smarty.get.class_id}-->" ><span class="btn-next">キャンセル</span></a> 
        <a class="btn btn-primary" href="javascript:;" onclick="fnFormModeSubmit('form1', 'edit', '', ''); return false;"><span class="btn-next">この内容で登録する</span></a>
    </div>

    <table class="table">
        <col />
        <col width="10%" />
        <col width="10%" />
        <col width="15%" />
        <tr>
            <th>分類名</th>
            <th class="center">編集</th>
            <th class="center">削除</th>
            <th class="center">移動</th>
        </tr>
        <!--{section name=cnt loop=$arrClassCat}-->
            <tr style="background:<!--{if $tpl_classcategory_id != $arrClassCat[cnt].classcategory_id}-->#ffffff<!--{else}--><!--{$smarty.const.SELECT_RGB}--><!--{/if}-->;">
                <td><!--{* 規格名 *}--><!--{$arrClassCat[cnt].name|h}--></td>
                <td class="center" >
                    <!--{if $tpl_classcategory_id != $arrClassCat[cnt].classcategory_id}-->
                        <a class="btn" href="?" onclick="fnModeSubmit('pre_edit','classcategory_id', <!--{$arrClassCat[cnt].classcategory_id}-->); return false;">編集</a>
                    <!--{else}-->
                        編集中
                    <!--{/if}-->
                </td>
                <td class="center">
                    <a href="?" class="btn btn-danger" onclick="fnModeSubmit('delete','classcategory_id', <!--{$arrClassCat[cnt].classcategory_id}-->); return false;">削除</a>
                </td>
                <td class="center">
                    <!--{if $smarty.section.cnt.iteration != 1}-->
                        <a class="btn" href="?" onclick="fnModeSubmit('up','classcategory_id', <!--{$arrClassCat[cnt].classcategory_id}-->); return false;"><i class="icon-chevron-sign-up"></i></a>
                    <!--{/if}-->
                    <!--{if $smarty.section.cnt.iteration != $smarty.section.cnt.last}-->
                        <a class="btn" href="?" onclick="fnModeSubmit('down','classcategory_id', <!--{$arrClassCat[cnt].classcategory_id}-->); return false;"><i class="icon-chevron-sign-down"></i></a>
                    <!--{/if}-->
                </td>
            </tr>
        <!--{/section}-->
    </table>
    <div>
        <a class="btn" href="./class.php"><span class="btn-prev">規格一覧に戻る</span></a>
    </div>
</div>
</form>
