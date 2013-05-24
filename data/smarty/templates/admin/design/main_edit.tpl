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

<script type="text/javascript">
<!--
function fnTargetSelf(){
    document.form_edit.target = "_self";
}
//-->
</script>


<form name="form_edit" id="form_edit" method="post" action="?" >
<input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
<input type="hidden" name="mode" value="" />
<input type="hidden" name="page_id" value="<!--{$page_id|h}-->" />
<input type="hidden" name="device_type_id" value="<!--{$device_type_id|h}-->" />

    <!--{if $arrErr.err != ""}-->
        <div class="message">
            <span class="attention"><!--{$arrErr.err}--></span>
        </div>
    <!--{/if}-->
    <table class="table">
        <tr>
            <th>名称</th>
            <td>
                <!--{assign var=key value="page_name"}-->
                <!--{if $arrForm.edit_flg.value == 2}-->
                    <!--{$arrForm[$key].value|h}--><input type="hidden" name="<!--{$key}-->" value="<!--{$arrForm[$key].value|h}-->" />
                <!--{else}-->
                    <input type="text" name="<!--{$key}-->" value="<!--{$arrForm[$key].value|h}-->" maxlength="<!--{$arrForm[$key].length|h}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->" class="span5" /><span class="warning">&nbsp;&nbsp;(上限<!--{$arrForm[$key].length|h}-->文字)</span>
                <!--{/if}-->
                <!--{if $arrErr[$key] != ""}-->
                    <div class="message">
                        <span class="attention"><!--{$arrErr[$key]}--></span>
                    </div>
                <!--{/if}-->
            </td>
        </tr>
        <tr>
        <th>URL</th>
            <td>
                <!--{assign var=key value="filename"}-->
                <!--{if $arrForm.edit_flg.value == 2}-->
                    <!--{$smarty.const.HTTP_URL|h}--><!--{$arrForm[$key].value|h}-->.php
                    <input type="hidden" name="<!--{$key}-->" value="<!--{$arrForm[$key].value|h}-->" />
                <!--{else}-->
                    <div class="input-append input-prepend"><span class="add-on"><!--{$smarty.const.USER_URL|h}--></span><input type="text" name="<!--{$key}-->" value="<!--{$arrForm[$key].value|h}-->" maxlength="<!--{$arrForm[$key].length|h}-->" style="ime-mode: disabled;<!--{$arrErr[$key]|sfGetErrorColor}-->" class="span3" /><span class="add-on">.php</span></div><span class="warning">&nbsp;&nbsp;(上限<!--{$arrForm[$key].length|h}-->文字)</span>
                <!--{/if}-->
                <!--{if $arrErr[$key] != ""}-->
                    <div class="attention">
                        <span class="attention"><!--{$arrErr[$key]}--></span>
                    </div>
                <!--{/if}-->
            </td>
        </tr>
        <tr>
            <td colspan="2">
            <p>
            <div class="inline">
                <label for="header-chk"><input type="checkbox" name="header_chk" id="header-chk" value="1" <!--{if $arrForm.header_chk.value == "1"}-->checked="checked"<!--{/if}--> />共通のヘッダーを使用する</label>&nbsp;
                <label for="footer-chk"><input type="checkbox" name="footer_chk" id="footer-chk" value="1" <!--{if $arrForm.footer_chk.value == "1"}-->checked="checked"<!--{/if}--> />共通のフッターを使用する</label>
                </div>
                </p>
                <div>
                    <textarea id="tpl_data" class="top" name="tpl_data" rows=<!--{$text_row}--> style="width: 98%;"><!--{"\n"}--><!--{$arrForm.tpl_data.value|h|smarty:nodefaults}--></textarea>
                    <input type="hidden" name="html_area_row" value="<!--{$text_row}-->" /><br />
                    <a  style="margin: 10px 0 0 0;" id="resize-btn" class="btn" href="javascript:;" onclick="ChangeSize('#resize-btn', '#tpl_data', 50, 13); return false;"><span>拡大</span></a>
                </div>
            </td>
        </tr>
    </table>

    <div class="btn-area">
    <a class="btn " href="<!--{$smarty.const.ROOT_URLPATH}--><!--{$smarty.const.ADMIN_DIR}-->design/main_edit.php?device_type_id=<!--{$device_type_id|u}-->" name='subm' >キャンセル</a>

    
        <a class="btn btn-primary" href="javascript:;" name='subm' onclick="fnTargetSelf(); fnFormModeSubmit('form_edit','confirm','',''); return false;"><span class="btn-next">登録する</span></a>
    </div>

    <h2>編集可能ページ一覧</h2>
    <div class="btn-area-top">
        <a class="btn" href="?device_type_id=<!--{$device_type_id|u}-->"><span>ページを新規入力</span></a>
    </div>
    <table class="table">
        <col width="80%" />
        <col width="10%" />
        <col width="10%" />
        <tr>
            <th>名称</th>
            <th>編集</th>
            <th class="center">削除</th>
        </tr>
        <!--{foreach key=key item=item from=$arrPageList}-->
            <tr style="<!--{if $item.page_id == $page_id}-->background-color: <!--{$smarty.const.SELECT_RGB}-->;<!--{/if}-->">
                <td>
                    <!--{$item.page_name}-->
                </td>
                <td class="center">
                    <!--{if $item.filename|strlen >= 1}-->
                        <a class="btn" href="?page_id=<!--{$item.page_id}-->&amp;device_type_id=<!--{$item.device_type_id}-->">編集</a>
                    <!--{/if}-->
                </td>
                <td class="center">
                    <!--{if $item.edit_flg == 1}-->
                        <a class="btn btn-danger" href="javascript:;" onclick="fnTargetSelf(); fnFormModeSubmit('form_edit','delete','page_id','<!--{$item.page_id|escape:'javascript'|h}-->'); return false;">削除</a>
                    <!--{/if}-->
                </td>
            </tr>
        <!--{/foreach}-->
    </table>
</form>
