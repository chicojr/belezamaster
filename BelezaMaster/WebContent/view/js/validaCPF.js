function validarCPF(cpf) {
	var filtro = /^\d{3}.\d{3}.\d{3}-\d{2}$/i;

	if (!filtro.test(cpf)) {
		window.alert("CPF inválido. Tente novamente.");
		return false;
	}

	cpf = remove(cpf, ".");
	cpf = remove(cpf, "-");

	if (cpf.length != 11 || cpf == "00000000000" || cpf == "11111111111"
			|| cpf == "22222222222" || cpf == "33333333333"
			|| cpf == "44444444444" || cpf == "55555555555"
			|| cpf == "66666666666" || cpf == "77777777777"
			|| cpf == "88888888888" || cpf == "99999999999") {
		window.alert("CPF inválido. Tente novamente.");
		return false;
	}

	soma = 0;
	for (i = 0; i < 9; i++) {
		soma += parseInt(cpf.charAt(i)) * (10 - i);
	}

	resto = 11 - (soma % 11);
	if (resto == 10 || resto == 11) {
		resto = 0;
	}
	if (resto != parseInt(cpf.charAt(9))) {
		window.alert("CPF inválido. Tente novamente.");
		return false;
	}

	soma = 0;
	for (i = 0; i < 10; i++) {
		soma += parseInt(cpf.charAt(i)) * (11 - i);
	}
	resto = 11 - (soma % 11);
	if (resto == 10 || resto == 11) {
		resto = 0;
	}

	if (resto != parseInt(cpf.charAt(10))) {
		window.alert("CPF inválido. Tente novamente.");
		return false;
	}

	return true;
}

function remove(str, sub) {
	i = str.indexOf(sub);
	r = "";
	if (i == -1)
		return str;
	{
		r += str.substring(0, i) + remove(str.substring(i + sub.length), sub);
	}

	return r;
}

//valida campo nome
function soLetras(obj) {
	var tecla = (window.event) ? event.keyCode : obj.which;
	if ((tecla >= 65 && tecla <= 90) || (tecla >= 97 && tecla <= 122))
		return true;
	else {
		if (tecla != 8 && tecla !=32 && tecla !=11 )
			return false;
		else
			return true;
	}
	
}


// validação de campos

function mascara(o,f){
	v_obj=o
	v_fun=f
	setTimeout("execmascara()",1)
	}
	function execmascara(){
	v_obj.value=v_fun(v_obj.value)
	}
	function soLetras(v){
	return v.replace(/\d/g,"") //Remove tudo o que não é Letra
	}
	function soLetrasMA(v){
	v=v.toUpperCase() //Maiúsculas
	return v.replace(/\d/g,"") //Remove tudo o que não é Letra ->maiusculas
	}
	function soLetrasMI(v){
	v=v.toLowerCase() //Minusculas
	return v.replace(/\d/g,"") //Remove tudo o que não é Letra ->minusculas
	}
	function soNumeros(v){
	return v.replace(/\D/g,"") //Remove tudo o que não é dígito
	}

	//'onkeypress="mascara(this,soLetras)"
//Valida datas
	
	 function validaDat(campo,valor) {
			var date=valor;
			var ardt=new Array;
			var ExpReg=new RegExp("(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[012])/[12][0-9]{3}");
			ardt=date.split("/");
			erro=false;
			if ( date.search(ExpReg)==-1){
				erro = true;
				}
			else if (((ardt[1]==4)||(ardt[1]==6)||(ardt[1]==9)||(ardt[1]==11))&&(ardt[0]>30))
				erro = true;
			else if ( ardt[1]==2) {
				if ((ardt[0]>28)&&((ardt[2]%4)!=0))
					erro = true;
				if ((ardt[0]>29)&&((ardt[2]%4)==0))
					erro = true;
			}
			if (erro) {
				alert("  Data Inválida!");
				
				campo.value = "";
				return false;
			}
			return true;
		}
		 
	
