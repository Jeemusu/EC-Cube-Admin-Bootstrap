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
	<input type="hidden" name="kiyaku_id" value="<!--{$tpl_kiyaku_id}-->" />
	<div id="basis" class="contents-main">
	    <table class="table">
	        <tr>
	            <th>規約タイトル<span class="attention"> *</span></th>
	            <td>
	                <span class="attention"><!--{$arrErr.kiyaku_title}--></span>
	                <span class="attention"><!--{$arrErr.name}--></span>
	                <input type="text" name="kiyaku_title" value="<!--{$arrForm.kiyaku_title|h}-->" maxlength="<!--{$smarty.const.SMTEXT_LEN}-->" style="<!--{if $arrErr.kiyaku_title != "" || $arrErr.name != ""}-->background-color: <!--{$smarty.const.ERR_COLOR}-->;<!--{/if}-->" class="span5"/>
	                <span class="warning"> (上限<!--{$smarty.const.SMTEXT_LEN}-->文字)</span>
	            </td>
	        </tr>
	        <tr>
	            <th>規約内容<span class="attention"> *</span></th>
	            <td>
	            <span class="attention"><!--{$arrErr.kiyaku_text}--></span>
	            <textarea name="kiyaku_text" maxlength="<!--{$smarty.const.MLTEXT_LEN}-->" rows="8" class="span6" style="<!--{if $arrErr.kiyaku_text != ""}-->background-color: <!--{$smarty.const.ERR_COLOR}-->;<!--{/if}-->" ><!--{"\n"}--><!--{$arrForm.kiyaku_text|h}--></textarea>
	            <span class="warning"> (上限<!--{$smarty.const.MLTEXT_LEN}-->文字)</span>
	            </td>
	        </tr>
	    </table>
	    <div class="btn-area">
	        <a class="btn" href="<!--{$smarty.const.ROOT_URLPATH}--><!--{$smarty.const.ADMIN_DIR}-->basis/kiyaku.php"><span class="btn-next">キャンセル</span></a>
	        <a class="btn btn-primary" href="javascript:;" onclick="fnFormModeSubmit('form1', 'confirm', '', ''); return false;"><span class="btn-next">この内容で登録する</span></a>	        </ul>
	    </div>
	
	    <table class="table">
	        <col width="65%" />
	        <col width="10%" />
	        <col width="10%" />
	        <col width="15%" />
	        <tr>
	            <th>規約タイトル</th>
	            <th class="center">編集</th>
	            <th class="center">削除</th>
	            <th class="center">移動</th>
	        </tr>
	        <!--{section name=cnt loop=$arrKiyaku}-->
	            <tr style="background:<!--{if $tpl_kiyaku_id != $arrKiyaku[cnt].kiyaku_id}-->#ffffff<!--{else}--><!--{$smarty.const.SELECT_RGB}--><!--{/if}-->;">
	            <!--{assign var=kiyaku_id value=$arrKiyaku[cnt].kiyaku_id}-->
	                <td><!--{* 規格名 *}--><!--{$arrKiyaku[cnt].kiyaku_title|h}--></td>
	                <td class="center">
	                    <!--{if $tpl_kiyaku_id != $arrKiyaku[cnt].kiyaku_id}-->
	                    <a class="btn" href="?" onclick="fnSetFormSubmit('form1', 'kiyaku_id', <!--{$arrKiyaku[cnt].kiyaku_id}-->); return false;">編集</a>
	                    <!--{else}-->
	                    編集中
	                    <!--{/if}-->
	                </td>
	                <td class="center">
	                    <!--{if $arrClassCatCount[$class_id] > 0}-->
	                    -
	                    <!--{else}-->
	                    <a class="btn btn-danger" href="?" onclick="fnModeSubmit('delete', 'kiyaku_id', <!--{$arrKiyaku[cnt].kiyaku_id}-->); return false;">削除</a>
	                    <!--{/if}-->
	                </td>
	                <td class="center">
	                    <!--{if $smarty.section.cnt.iteration != 1}-->
	                    <a class="btn" href="?" onclick="fnModeSubmit('up', 'kiyaku_id', <!--{$arrKiyaku[cnt].kiyaku_id}-->); return false;"><i class="icon-chevron-sign-up"></i></a>
	                    <!--{/if}-->
	                    <!--{if $smarty.section.cnt.iteration != $smarty.section.cnt.last}-->
	                    <a class="btn" href="?" onclick="fnModeSubmit('down', 'kiyaku_id', <!--{$arrKiyaku[cnt].kiyaku_id}-->); return false;"><i class="icon-chevron-sign-down"></i></a>
	                    <!--{/if}-->
	                </td>
	            </tr>
	        <!--{/section}-->
	    </table>
	
	</div>
</form>