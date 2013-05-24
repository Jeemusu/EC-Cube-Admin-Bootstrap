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
    <input type="hidden" name="maker_id" value="<!--{$tpl_maker_id}-->" />
    <div id="products" class="contents-main">

        <table class="table">
            <tr>
                <th>メーカー名<span class="attention"> *</span></th>
                <td>
                    <!--{if $arrErr.maker_id}--><span class="attention"><!--{$arrErr.maker_id}--></span><br /><!--{/if}-->
                    <!--{if $arrErr.name}--><span class="attention"><!--{$arrErr.name}--></span><!--{/if}-->
                    <input type="text" name="name" value="<!--{$arrForm.name|h}-->" maxlength="<!--{$smarty.const.SMTEXT_LEN}-->" class="span5"/>
                    <span class="warning"> (上限<!--{$smarty.const.SMTEXT_LEN}-->文字)</span>
                </td>
            </tr>
        </table>

        <div class="btn-area">
            <a class="btn" href="<!--{$smarty.const.ROOT_URLPATH}--><!--{$smarty.const.ADMIN_DIR}-->products/maker.php"><span class="btn-next">キャンセル</span></a>
			<a class="btn btn-primary" href="javascript:;" onclick="fnFormModeSubmit('form1', 'edit', '', ''); return false;"><span class="btn-next">この内容で登録する</span></a>
        </div>
        <!--{if count($arrMaker) > 0}-->
        <table class="table">
            <col width="10%" />
            <col width="50%" />
            <col width="10%" />
            <col width="10%" />
            <col width="20%" />
            <tr>
                <th>ID</th>
                <th>メーカー</th>
                <th class="center">編集</th>
                <th class="center">削除</th>
                <th class="center">移動</th>
            </tr>
            <!--{section name=cnt loop=$arrMaker}-->
            <tr style="background:<!--{if $tpl_maker_id != $arrMaker[cnt].maker_id}-->#ffffff<!--{else}--><!--{$smarty.const.SELECT_RGB}--><!--{/if}-->;">
                <!--{assign var=maker_id value=$arrMaker[cnt].maker_id}-->
                <td><!--{$maker_id|h}--></td>
                <td><!--{$arrMaker[cnt].name|h}--></td>
                <td class="center">
                    <!--{if $tpl_maker_id != $arrMaker[cnt].maker_id}-->
                    <a class="btn" href="?" onclick="fnModeSubmit('pre_edit', 'maker_id', <!--{$arrMaker[cnt].maker_id}-->); return false;">編集</a>
                    <!--{else}-->
                    編集中
                    <!--{/if}-->
                </td>
                <td class="center">
                    <!--{if $arrClassCatCount[$class_id] > 0}-->
                    -
                    <!--{else}-->
                    <a class="btn btn-danger" href="?" onclick="fnModeSubmit('delete', 'maker_id', <!--{$arrMaker[cnt].maker_id}-->); return false;">削除</a>
                    <!--{/if}-->
                </td>
                <td class="center">
                    <!--{if $smarty.section.cnt.iteration != 1}-->
                    <a class="btn" href="?" onclick="fnModeSubmit('up', 'maker_id', <!--{$arrMaker[cnt].maker_id}-->); return false;" /><i class="icon-chevron-sign-up"></i></a>
                    <!--{/if}-->
                    <!--{if $smarty.section.cnt.iteration != $smarty.section.cnt.last}-->
                    <a class="btn" href="?" onclick="fnModeSubmit('down', 'maker_id', <!--{$arrMaker[cnt].maker_id}-->); return false;" /><i class="icon-chevron-sign-down"></i></a>
                    <!--{/if}-->
                </td>
            </tr>
            <!--{/section}-->
        </table>
        <!--{/if}-->
    </div>
</form>
