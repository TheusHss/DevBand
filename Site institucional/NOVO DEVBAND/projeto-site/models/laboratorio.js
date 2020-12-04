'use strict';

const empresa = require("./empresa");

/* 
lista e explicação dos Datatypes:
https://codewithhugo.com/sequelize-data-types-a-practical-guide/
*/

module.exports = (sequelize, DataTypes) => {
    let Laboratorio = sequelize.define('Laboratorio',{
		idLab: {
			field: 'idLab',
			type: DataTypes.INTEGER,
			primaryKey: true,
			autoIncrement: true
		},		
		nomeLab: {
			field: 'nomeLab',
			type: DataTypes.STRING,
            allowNull: false,
		},
	}, 
	{
		tableName: 'laboratorio', 
		freezeTableName: true, 
		underscored: true,
		timestamps: false,
    });

    
    return Laboratorio;
};
