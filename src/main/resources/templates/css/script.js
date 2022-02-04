
function validarAluno(){
	
	if(document.aluno.nome.value!="" &&
			document.aluno.numMatricula.value!="" && document.aluno.status.value!=""){
	    let modal = document.querySelector('.modal')
	    modal.style.display = 'block';
	}
}

function validarCurso(){
	
	if(document.curso.nomecurso.value!="" && document.curso.valor.value!=""){
	    let modal = document.querySelector('.modal')
	    modal.style.display = 'block';
	}
}

function validarTurma(){
	
	if(document.turma.nometurma.value!=""){
	    let modal = document.querySelector('.modal')
	    modal.style.display = 'block';
	}
}

function validarProfessor(){
	
	if(document.professor.nomeprofessor.value!="" && 
			document.professor.cpf.value!="" && 
			document.professor.estado.value!="" && 
			document.professor.datanascimento.value!="" && 
			document.professor.cidade.value!="" &&
			document.professor.estadocivil.value!=""){
	    let modal = document.querySelector('.modal')
	    modal.style.display = 'block';
	}
}

function validarMatricula(){
	
	if(document.matricula.nome.value!="" && 
			document.matricula.cpf.value!="" && 
			document.matricula.estado.value!="" && 
			document.matricula.datanascimento.value!="" && 
			document.matricula.cidade.value!="" &&
			document.matricula.estadocivil.value!=""){
	    let modal = document.querySelector('.modal')
	    modal.style.display = 'block';
	}
}

function validarMatDis(){
	
	if(document.matdis.cdaluno.value!=""){
	    let modal = document.querySelector('.modal')
	    modal.style.display = 'block';
	}
}


function validar(){
    let modal = document.querySelector('.modal')
    modal.style.display = 'block';
}

function validarExcluirAluno(){
	
    let modal = document.querySelector('.modal-excluir')
    modal.style.display = 'block';
    
	}

function validarExcluirAluno(){
	
    let modal = document.querySelector('.modal-excluir')
    modal.style.display = 'block';
    
	}

function validarAlterarAluno(){
	
    let modal = document.querySelector('.modal-alterar')
    modal.style.display = 'block';
    
	}
function validarSemestre(){

	if(document.semestre.ano.value!=""){
    let modal = document.querySelector('.modal')
    modal.style.display = 'block';
	}
}

function validarDisciplina(){
	
	if(document.disciplina.nomedisciplina.value!="" && document.disciplina.valor.value!=""){
	    let modal = document.querySelector('.modal')
	    modal.style.display = 'block';
	}
}

function validarNota(){
	
	if(document.nota.nota.value >= 0  &&
			document.nota.nota.value  <= 10  &&
			document.nota.referencia.value!=""){
	    let modal = document.querySelector('.modal')
	    modal.style.display = 'block';
	}
}
var password = document.getElementById("password")
, confirm_password = document.getElementById("confirm_password");

function validatePassword(){
if(password.value != confirm_password.value) {
  confirm_password.setCustomValidity("Senhas diferentes!");
} else {
  confirm_password.setCustomValidity('');
}
}

password.onchange = validatePassword;
confirm_password.onkeyup = validatePassword;

function validarFuncionario(){
	
	if(document.funcionario.nomefuncionario.value!="" && 
			document.funcionario.cpf.value!="" && 
			document.funcionario.estado.value!="" && 
			document.funcionario.datanascimento.value!="" && 
			document.funcionario.cidade.value!="" &&
			document.funcionario.estadocivil.value!="" &&
			document.funcionario.senha.value.length >= 8 &&
			document.funcionario.senha2.value.length  >= 8 &&
			password.value == confirm_password.value){
	    let modal = document.querySelector('.modal')
	    modal.style.display = 'block';
	}
}

function fechar(){

    let modal = document.querySelector('.modal')


    modal.style.display = 'none';

}