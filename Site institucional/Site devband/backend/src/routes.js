const express = require('express');
const database = require('./database/config');

const route = express.Router();

route.post('/', (request, response) => {
    const { email,
        senha,
        cnpj,
        nome_fantasia,
        razao_social,
        telefone,
        numero,
        complemento,
        cep } = request.body;

        console.log(request.body)

        var sql = `INSERT INTO empresa 
        (idEmpresa, cnpj, razao_social, nome_fantasia, cep, numero, complemento, email_empresa, 
        senha_empresa, telefone) VALUES (null, '${cnpj}', '${razao_social}', '${nome_fantasia}',
        '${cep}', '${numero}', '${complemento}', '${email}', '${senha}', '${telefone}')`;

        database.query(sql, function(err, result) {
            if (err) throw err;
        })

    return response.json({ ok: 'ok' })
})

module.exports = route;