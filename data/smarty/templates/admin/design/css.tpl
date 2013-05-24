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

<form name="form_css" method="post" action="?" >
<input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
<input type="hidden" name="mode" value="" />
<input type="hidden" name="area_row" value="<!--{$area_row|h}-->" />
<input type="hidden" name="old_css_name" value="<!--{$old_css_name|h}-->" />
<input type="hidden" name="device_type_id" value="<!--{$device_type_id|h}-->" />
<div id="design" class="contents-main">

    <!--{if $arrErr.err != ""}-->
        <div class="message">
            <span class="attention"><!--{$arrErr.err}--></span>
        </div>
    <!--{/if}-->

    <!--▼CSS設定ここから-->
    <table class="table">
        <tr>
            <th>CSSファイル名</th>
            <td>
                <!--{assign var=key value="css_name"}-->
                <div class="input-append">
                <input type="text" name="<!--{$key}-->" value="<!--{$arrForm[$key].value|h}-->" maxlength="<!--{$arrForm[$key].length}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->" size="60" class="box60" /><span class="add-on">.css</span></div>&nbsp;&nbsp;
                <span class="warning"> (上限<!--{$arrForm[$key].length}-->文字)</span>
                <!--{if $arrErr[$key] != ""}--> <div class="attention"><!--{$arrErr[$key]}--></div> <!--{/if}-->
            </td>
        </tr>
        <tr>
            <th>CSS内容</th>
            <td>
                <!--{assign var=key value="css_data"}-->
                <textarea id="css" class="top" name="<!--{$key}-->" cols="90" rows=<!--{$area_row}--> align="left" style="width: 650px;"><!--{"\n"}--><!--{$arrForm[$key].value|h}--></textarea>
                <input type="hidden" name="area_row" value="<!--{$area_row}-->" /><br />
                <div style="margin:10px 0 0 0;">
                    <a id="resize-btn" class="btn" href="javascript:;" onclick="ChangeSize('#resize-btn', '#css', 50, 30); return false;">拡大</a>
                </div>
            </td>
        </tr>
    </table>
    <div class="btn-area">
        <a class="btn btn-primary" href="javascript:;" onclick="fnFormModeSubmit('form_css','confirm','',''); return false;"><span class="btn-next">この内容で登録する</span></a>
    </div>
    <!--▲CSS設定　ここまで-->

    <!--▼CSSファイル一覧　ここから-->
    <h2>編集可能CSSファイル</h2>
    <div class="btn-area-top">
        <a class="btn" href="?device_type_id=<!--{$device_type_id|h}-->"><span>CSSを新規入力</span></a>
    </div>
    <table class="table" id="design-css-list">
        <col width="80%" />
        <col width="10%" />
        <col width="10%" />
        <tr>
            <th class="name">ファイル名</th>
            <th class="center">編集</th>
            <th class="center">削除</th>
        </tr>
        <!--{if count($arrCSSList) > 0}-->
        <!--{foreach key=key item=item from=$arrCSSList}-->
        <tr>
            <td style="background:<!--{if $item.css_name == $css_name}--><!--{$smarty.const.SELECT_RGB}--><!--{else}-->#ffffff<!--{/if}-->;"><!--{$item.file_name|h}--></td>
            <td class="center" style="background:<!--{if $item.css_name == $css_name}--><!--{$smarty.const.SELECT_RGB}--><!--{else}-->#ffffff<!--{/if}-->;">
                <a class="btn" href="?css_name=<!--{$item.css_name|h}-->&amp;device_type_id=<!--{$device_type_id|h}-->">編集</a>
            </td>
            <td class="center" style="background:<!--{if $item.css_name == $css_name}--><!--{$smarty.const.SELECT_RGB}--><!--{else}-->#ffffff<!--{/if}-->;">
                <a class="btn btn-danger" href="javascript:;" onclick="fnFormModeSubmit('form_css','delete','css_name','<!--{$item.css_name|h}-->'); return false;">削除</a>
            </td>
        </tr>
        <!--{/foreach}-->
        <!--{else}-->
        <tr>
            <td colspan="3">CSSファイルが存在しません。</td>
        </tr>
        <!--{/if}-->
    </table>
    <!--▲CSSファイル一覧　ここまで-->

</div>
</form>
