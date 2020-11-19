'use strict';

/* 
lista e explicação dos Datatypes:
https://codewithhugo.com/sequelize-data-types-a-practical-guide/
*/

module.exports = (sequelize, DataTypes) => {
    let Sensor = sequelize.define('Sensor',{
		idSensor: {
			field: 'idSensor',
			type: DataTypes.INTEGER,
			primaryKey: true,
			autoIncrement: true
		},		
		localizacao_sensor: {
			field: 'localizacao_sensor',
			type: DataTypes.STRING,
			allowNull: false
        },
        status_sensor: {
			field: 'status_sensor',
			type: DataTypes.STRING,
			allowNull: true
		},
	}, 
	{
		tableName: 'sensor', 
		freezeTableName: true, 
		underscored: true,
		timestamps: false,
	});

    return Sensor;
};
