select *
from vw_mis_mtr_cont_gl gl
WHERE TRUNC(gl.POSTING_DATE) BETWEEN '01/June/2025' AND
'27/Oct/2025'
and (gl.BRANCH_CODE = '" + UserClass + "' or '" + UserClass + "'= '01')
