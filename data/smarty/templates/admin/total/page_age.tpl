<!--{if $arrForm.page.value == 'age'}-->
<div id="placeholder" style="width:1040px;height:600px"></div>
<script>
	var data = <!--{$tpl_json}-->;

	
	$.plot("#placeholder", [ data ], {
		series: {
			bars: {
				show: true,
				barWidth: 0.2,
				align: "center"
			}
		},
		xaxis: {
			mode: "categories",
			tickLength: 0,
			autoscaleMargin: 0.1
		}
	});
</script>			
<!--{/if}-->

<table id="total-age" class="table">
    <tr>
        <th>年齢</th>
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
            <td class="center"><!--{*年齢*}--><!--{$arrResults[cnt].age_name}--></td>
            <td class="right"><!--{*購入件数*}--><!--{$arrResults[cnt].order_count}-->件</td>
            <td class="right"><!--{*購入合計*}--><!--{$arrResults[cnt].total|number_format}-->円</td>
            <td class="right"><!--{*購入平均*}--><!--{$arrResults[cnt].total_average|number_format}-->円</td>
        </tr>
    <!--{/section}-->

</table>
