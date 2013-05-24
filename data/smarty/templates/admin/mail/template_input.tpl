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
<input type="hidden" name="mode" value="<!--{$mode}-->" />
<input type="hidden" name="template_id" value="<!--{$arrForm.template_id|h}-->" />
<div id="mail" class="contents-main">
    <table class="table">
        <tr>
            <th>メール形式<span class="attention"> *</span></th>
            <td>
                <span <!--{if $arrErr.mail_method}--><!--{sfSetErrorStyle}--><!--{/if}-->>
                <div class="inline">
                <!--{html_radios name="mail_method" options=$arrMagazineType separator="&nbsp;" selected=$arrForm.mail_method}-->
                </div>
                </span>
                <!--{if $arrErr.mail_method}--><br /><span class="attention"><!--{$arrErr.mail_method}--></span><!--{/if}-->
            </td>
        </tr>
        <tr>
            <th>Subject<span class="attention"> *</span></th>
            <td>
                <input type="text" name="subject" class="span5" <!--{if $arrErr.subject}--><!--{sfSetErrorStyle}--><!--{/if}--> value="<!--{$arrForm.subject|h}-->" />
                <!--{if $arrErr.subject}--><br /><span class="attention"><!--{$arrErr.subject}--></span><!--{/if}-->
            </td>
        </tr>
        <tr>
            <th>本文<span class="attention"> *</span><br />（名前差し込み時は {name} といれてください）</th>
            <td>
                <textarea name="body" rows="40" class="span6" <!--{if $arrErr.body}--><!--{sfSetErrorStyle}--><!--{/if}-->><!--{"\n"}--><!--{$arrForm.body|h}--></textarea>
                <!--{if $arrErr.body}--><br /><span class="attention"><!--{$arrErr.body}--></span><!--{/if}-->
                <br />
                <p><div class="input-append">
                    今までに入力した文字:<input class="input-mini box4" type="text" name="cnt_footer" size="4" readonly = true style="text-align:right" /><a class="btn" href="javascript:;" onclick="fnCharCount('form1','body','cnt_footer'); return false;" name="next" id="next"><span>文字数カウント</span></a>
                </div></p>
            </td>
        </tr>
    </table>
    <div class="btn-area">
        <a class="btn btn-primary" href="javascript:;" onclick="fnFormModeSubmit('form1', '<!--{$mode}-->', '', ''); return false;"><span class="btn-next">この内容で登録する</span></a>
    </div>
</div>
</form>
