const { Router } = require('express');
const { expressAdapter } = require('../../infra/expressAdapter');
const psicologiaController = require('./controller')
const { body } = require('express-validator');

const psicologiaRouter = Router()

psicologiaRouter.get('/home', expressAdapter(psicologiaController.home))

psicologiaRouter.get('/', expressAdapter(psicologiaController.login));

psicologiaRouter.get('/PageRegister', expressAdapter(psicologiaController.register));

psicologiaRouter.post('/login', expressAdapter(psicologiaController.loginAuth));

psicologiaRouter.get('/:codigo/detail', expressAdapter(psicologiaController.detail));

// ALTER TABLE USUARIOS DROP INDEX MATRICULA; lembrar de alterar email e matricula

psicologiaRouter.post('/register',
    [
        body('email').isEmail().contains('@sga.pucminas.br'),
        body('matricula').isLength({ min: 1 }),
        body('senha').isLength({ min: 7 }),
        body('nome').isLength({ min: 1 }),
        body('descricao').optional().isLength({ max: 255 }),
        body('topicos').optional().isLength({ max: 255 }),
        body('telefone').optional().isMobilePhone('pt-BR'),
        body('confirmacaoDeSenha').custom((value, { req }) => {
            if (value !== req.body.senha) {
                throw new Error('A confirmação da senha não corresponde à senha');
            }
            return true;
        }),
    ],
    expressAdapter(psicologiaController.registration)
)


psicologiaRouter.get('/confirmRegister/:id', expressAdapter(psicologiaController.confirmRegistration));



module.exports = psicologiaRouter;