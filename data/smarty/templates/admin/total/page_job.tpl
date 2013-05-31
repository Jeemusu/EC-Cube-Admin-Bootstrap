<!--{if $arrForm.page.value == 'job'}-->
<div id="placeholder" style="width:1040px;height:600px"></div>
<script>
	var data = <!--{$tpl_json}-->;
	$.plot('#placeholder', data, {
	    series: {
	        pie: {
	            show: true,
	            radius: 5/6,
	            label: {
	                show: true,
	                radius: 1,
	                background: {
	                    opacity: 0.7
	                },
	                formatter: function (label, series) {               
    					return '<div style="font-size:8pt;text-align:center;padding:5px;color:white;">' +
   						label + ' : ' +
    					Math.round(series.percent) + '%</div>';
					},
	            }
	        }
	    },
	    legend: {
	        show: true
	    }
	});
</script>			
<!--{/if}-->

<table id="total-job" class="table">
    <tr>
        <th>順位</th>
        <th>職業</th>
        <th>購入件数</th>
        <th>購入合計</th>
        <th>購入平均</th>
    </tr>

    <!--{section name=cnt loop=$arrResults}-->
        <!--{* 色分け判定 *}-->
        <!--{assign var=type value="`$smarty.section.cnt.index%2`"}-->
        <!--{if $type == 0}-->
            <!--{* 偶数行 *}-->
            <!--{assign var=color value="even"}-->
        <!--{else}-->
            <!--{* 奇数行 *}-->
            <!--{assign var=color value="odd"}-->
        <!--{/if}-->

        <tr class="<!--{$color}-->">
            <td class="center"><!--{*順位*}--><!--{$smarty.section.cnt.iteration}--></td>
            <td class="center"><!--{*職業*}--><!--{$arrResults[cnt].job_name}--></td>
            <td class="right"><!--{*購入件数*}--><!--{$arrResults[cnt].order_count}-->件</td>
            <td class="right"><!--{*購入合計*}--><!--{$arrResults[cnt].total|number_format}-->円</td>
            <td class="right"><!--{*購入平均*}--><!--{$arrResults[cnt].total_average|number_format}-->円</td>
        </tr>
    <!--{/section}-->

</table>
