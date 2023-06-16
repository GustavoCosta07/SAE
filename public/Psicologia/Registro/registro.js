function registrar() {

    const boxSae = document.querySelector('.box-sae');

    const email = boxSae.querySelector('input[name="email"]').value;
    const matricula = boxSae.querySelector('input[name="matricula"]').value;
    const nomeCompleto = boxSae.querySelector('input[name="nome"]').value;
    // const descricao = boxSae.querySelector('input[name="descricao"]').value;
    // const especialidade = boxSae.querySelector('input[name="topicos"]').value;
    const telefone = boxSae.querySelector('input[name="telefone"]').value;
    const senha = boxSae.querySelector('input[name="senha"]').value;
    const confirmacaoSenha = boxSae.querySelector('input[name="confirmacaoDeSenha"]').value;

    const body = {
        email,
        matricula,
        nomeCompleto,
        // descricao,
        // especialidade,
        telefone,
        senha,
        confirmacaoSenha
    }

    console.log(body)

    fetch('http://localhost:3000/psicologia/register', {
        method: 'POST',
        body: JSON.stringify(body),
        headers: {
          Accept: 'application/json',
          'Content-Type': 'application/json'
        }
      })
        .then((dados) => {
          return dados.json();
        })
        .then((dados) => {
            console.log(dados.errors)
          if (dados.errors) {
            alert(dados.errors[0].msg);
          }
          alert(dados)
        //   window.location.reload();
        });
    
    

    console.log(body)

}