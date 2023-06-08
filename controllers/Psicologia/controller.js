const psicologiaRouter = require('./router');
const { renderView, redirect, renderJson } = require('../../helpers/render');
const bcrypt = require('bcrypt');
const { validationResult } = require('express-validator');
const transporter = require('../../infra/emailAdapter');
const {db, emailProvider} = require('../../config/env')

module.exports = {
    async home(request) {

        // const [psicologos, fields] = await db.query('SELECT * FROM USUARIOS WHERE TIPO = ? LIMIT 6', [2]);

        const psicologos = await db.query('SELECT * FROM USUARIOS LIMIT 6');

        console.log(psicologos)

        return renderView('Psicologia/home', { psicologos });

    },

    async login(request) {

   



        return renderView('Psicologia/login');
    },

    async detail(request) {

        const {codigo} = request
        const psicologo = await db.query(`SELECT * FROM USUARIOS where ID = ${codigo}`);

        return renderView('Psicologia/detail', {psicologo: psicologo[0]});
    },

    async register(request) {

   



        return renderView('Psicologia/register');
    },
    
    async registration(request) {

        const errors = validationResult(request);

        if (!errors.isEmpty()) {
            return renderJson(400, { errors: errors.array() });
        }

        const { email, matricula, senha, nome, descricao, topicos, telefone } = request

        let hashedPassword = await bcrypt.hash(senha, 10);

        let user = {
            EMAIL: email,
            MATRICULA: matricula,
            SENHA: hashedPassword,
            NOME: nome,
            DESCRICAO: descricao,
            TOPICOS: topicos,
            TELEFONE: telefone,
            TIPO: 2,  // Adicionar tipo de usuário 'PSICOLOGO'
        };

        try {
            let results = await db.query('INSERT INTO USUARIOS SET ?', user);

            let mailOptions = {
                from: emailProvider.user,
                to: email,
                subject: 'Por favor confirme seu email',
                text: 'Clique neste link para confirmar seu email: http://localhost:3000/psicologia/confirmRegister/' + results.insertId
            };

            await transporter.sendMail(mailOptions);

            return renderJson('Usuário registrado, por favor confirme seu email');
        } catch (error) {
            console.log(error);
            return renderJson(500, 'Erro do servidor');
        }

    },

    async confirmRegistration(request) {

        let {id} = request

        try {
            let results = await db.query('UPDATE USUARIOS SET CONFIRMACAO_REGISTRO = 1 WHERE ID = ?', [id]);
    
            if (results.affectedRows === 0) {
                return renderJson(404, 'Usuário não encontrado');
            } else {
                return renderJson('E-mail confirmado com sucesso!');
            }
        } catch (error) {
            console.log(error);
            return renderJson(500, 'Erro do servidor');
        }
    },

    async loginAuth(request) {

        const { matricula, senha } = request;
    
        try {
            let results = await db.query('SELECT * FROM USUARIOS WHERE MATRICULA = ?', [matricula]);
    
            if (results.length === 0) {
                return renderJson(404, 'Usuário não encontrado');
            }
    
            let user = results[0];
    
            if (!user.CONFIRMACAO_REGISTRO) {
                return renderJson(400, 'Por favor, confirme seu e-mail antes de fazer login');
            }
    
            let match = await bcrypt.compare(senha, user.SENHA);
    
            if (!match) {
                return renderJson(401, 'Senha incorreta');
            }
    
            // Aqui você pode definir a sessão de usuário ou emitir um token JWT
            // Se estiver usando sessões: req.session.user = user;
            // Se estiver usando JWT: let token = jwt.sign(user, secretKey);
    
            return redirect('/psicologia/home');
            // return renderView('Psicologia/home');
        } catch (error) {
            console.log(error);
            return renderJson(500, 'Erro do servidor');
        }
    }
    
}