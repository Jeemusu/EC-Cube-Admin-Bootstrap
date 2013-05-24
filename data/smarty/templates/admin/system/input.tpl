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
//-->
</script>

<form style="margin:0px;padding: 0px 20px;" name="form1" id="form1" method="post" action="" onsubmit="return fnRegistMember();">
<input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
<input type="hidden" name="mode" value="<!--{$tpl_mode|h}-->">
<input type="hidden" name="member_id" value="<!--{$tpl_member_id|h}-->">
<input type="hidden" name="pageno" value="<!--{$tpl_pageno|h}-->">
<input type="hidden" name="old_login_id" value="<!--{$tpl_old_login_id|h}-->">

<h2>メンバー登録/編集</h2>

<table class="table">
    <col width="25%" />
    <col width="75%" />
    <tr>
        <th>名前<span class="attention"> *</span></th>
        <td>
            <!--{if $arrErr.name}--><span class="attention"><!--{$arrErr.name}--></span><!--{/if}-->
            <input type="text" name="name" class="span4" value="<!--{$arrForm.name|h}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" />
            
        </td>
    </tr>
    <tr>
        <th>所属</th>
        <td>
            <!--{if $arrErr.department}--><span class="attention"><!--{$arrErr.department}--></span><!--{/if}-->
            <input type="text" name="department" class="span4" value="<!--{$arrForm.department|h}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" />
        </td>
    </tr>
    <tr>
        <th>ログインＩＤ<span class="attention"> *</span></th>
        <td>
            <!--{if $arrErr.login_id}--><span class="attention"><!--{$arrErr.login_id}--></span><!--{/if}-->
            <input type="text" name="login_id" class="span4"     value="<!--{$arrForm.login_id|h}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->"/>
            <br />
            ※半角英数字<!--{$smarty.const.ID_MIN_LEN}-->～<!--{$smarty.const.ID_MAX_LEN}-->文字
        </td>
    </tr>
    <tr>
        <th>パスワード<span class="attention"> *</span></th>
        <td>
            <!--{if $arrErr.password}--><span class="attention"><!--{$arrErr.password}--><!--{$arrErr.password02}--></span><!--{/if}-->
            <input type="password" name="password" class="span4"  value="<!--{$arrForm.password}-->" onfocus="<!--{$tpl_onfocus}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->"/>
            <br />
            ※半角英数字<!--{$smarty.const.ID_MIN_LEN}-->～<!--{$smarty.const.ID_MAX_LEN}-->文字
            <br />
            <input type="password" name="password02" class="span4"  value="<!--{$arrForm.password02}-->" onfocus="<!--{$tpl_onfocus}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->"/>
           	<br /><span class="warning">確認のために2度入力してください。</span>
        </td>
    </tr>
    <tr>
        <th>権限<span class="attention"> *</span></th>
        <td>
            <!--{if $arrErr.authority}--><span class="attention"><!--{$arrErr.authority}--></span><!--{/if}-->
            <select class="input-medium" name="authority">
                <option value="">選択してください</option>
                <!--{html_options options=$arrAUTHORITY selected=$arrForm.authority}-->
            </select>
        </td>
    </tr>
    <tr>
        <th>稼働/非稼働<span class="attention"> *</span></th>
        <td>
            <!--{if $arrErr.work}--><span class="attention"><!--{$arrErr.work}--></span><!--{/if}-->
            <!--{assign var=key value="work"}-->
            <div class="inline">
            <input type="radio" id="<!--{$key}-->_1" name="<!--{$key}-->" value="1" style="<!--{$arrErr.work|sfGetErrorColor}-->" <!--{$arrForm.work|sfGetChecked:1}--> /><label for="<!--{$key}-->_1">稼働</label>
            <input type="radio" id="<!--{$key}-->_0" name="<!--{$key}-->" value="0" style="<!--{$arrErr.work|sfGetErrorColor}-->" <!--{$arrForm.work|sfGetChecked:0}--> /><label for="<!--{$key}-->_0">非稼働</label></div>
        </td>
    </tr>
</table>

<div class="btn-area">
    <a class="btn btn-primary" href="javascript:;" onclick="fnFormModeSubmit('form1', '<!--{$tpl_mode|h}-->', '', ''); return false;"><span class="btn-next">この内容で登録する</span></a>
</div>
</form>

<!--{include file="`$smarty.const.TEMPLATE_ADMIN_REALDIR`admin_popup_footer.tpl"}-->
