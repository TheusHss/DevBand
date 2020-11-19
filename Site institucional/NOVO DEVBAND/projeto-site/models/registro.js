'use strict';

/* 
lista e explicação dos Datatypes:
https://codewithhugo.com/sequelize-data-types-a-practical-guide/
*/

module.exports = (sequelize, DataTypes) => {
    let Registro = sequelize.define('Registro',{	
		idRegistro: {
			field: 'idRegistro',
			type: DataTypes.INTEGER,
			primaryKey: true,
			autoIncrement: true
        },
        data_registro: {
			field: 'data_registro',
			type: DataTypes.DATE, // NÃO existe DATETIME. O tipo DATE aqui já tem data e hora
			allowNull: false
		},
		temperatura: {
			field: 'temperatura',
			type: DataTypes.REAL,
			allowNull: false
		},
		umidade: {
			field: 'umidade',
			type: DataTypes.REAL,
			allowNull: false
		},
		momento_grafico: {
			type: DataTypes.VIRTUAL, // campo 'falso' (não existe na tabela). Deverá ser preenchido 'manualmente' no select
			allowNull: true
		}
	}, 
	{
		tableName: 'registro', 
		freezeTableName: true, 
		underscored: true,
		timestamps: false,
	});

    return Registro;
};
