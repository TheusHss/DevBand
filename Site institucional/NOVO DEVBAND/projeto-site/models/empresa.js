'use strict';

/* 
lista e explicação dos Datatypes:
https://codewithhugo.com/sequelize-data-types-a-practical-guide/
*/

module.exports = (sequelize, DataTypes) => {
    let Empresa = sequelize.define('Empresa',{
		idEmpresa: {
			field: 'idEmpresa',
			type: DataTypes.INTEGER,
			primaryKey: true,
			autoIncrement: true
		},		
		cnpj: {
			field: 'cnpj',
			type: DataTypes.STRING,
            allowNull: false,
		},
		razao_social: {
			field: 'razao_social',
			type: DataTypes.STRING,
			allowNull: false
		},
		nome_fantasia: {
			field: 'nome_fantasia',
			type: DataTypes.STRING,
			allowNull: false
        },
        cep: {
            field: 'cep',
			type: DataTypes.STRING,
			allowNull: false
        },
        numero: {
            field: 'numero',
			type: DataTypes.INTEGER,
			allowNull: false
        },
        complemento: {
            field: 'complemento',
			type: DataTypes.STRING,
			allowNull: true
        },
        telefone: {
            field: 'telefone',
			type: DataTypes.STRING,
			allowNull: false
        },
        email_empresa: {
            field: 'email_empresa',
			type: DataTypes.STRING,
			allowNull: false
        },
        senha_empresa: {
            field: 'senha_empresa',
			type: DataTypes.STRING,
			allowNull: false
        },
	}, 
	{
		tableName: 'empresa', 
		freezeTableName: true, 
		underscored: true,
		timestamps: false,
    });
    
    return Empresa;
};
