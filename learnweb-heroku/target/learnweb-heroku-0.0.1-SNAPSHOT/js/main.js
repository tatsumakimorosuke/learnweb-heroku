/**
 *
 */
'use strict';

{
	function selectCode(selectedCode) {
		document.getElementById("selectedCode").value = selectedCode
		document.itemSelect.submit();
	}
	document.querySelector('button').addEventListener('click',selectCode);

}