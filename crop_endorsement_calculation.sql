select * from ins_misc_crop_details
where assorted_code in('070000169373','050000824317') for update

Net Contribution : sumcovered * rate / 100;
contribution Rate : sum_covered_per_unit * rate /100;
gross contribution : net_contribution / 1.16;


SELECT IP.PREMIUM_SEQNO,IP.PREMIUM_TYPE_CODE,IP.REFERENCE_CODE,IP.ORDER_NO,IP.AMOUNT,
IP.PREV_AMOUNT,(IP.AMOUNT-IP.PREV_AMOUNT) DIFFERENCE,IP.RATE, IP.CHARGE_CODE,IP.ENT_BY
FROM INS_PREMIUM IP
WHERE IP.REFERENCE_CODE = '050000824317'
ORDER BY TO_NUMBER(IP.ORDER_NO) ASC    
for update

