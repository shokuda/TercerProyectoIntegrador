/* eslint-disable new-cap */
const { DataTypes } = require('sequelize');
const sequelize = require('../src/conection/conection');

const Genero = sequelize.define('generos', {
    idGenero: {
        type: DataTypes.INTEGER(10),
        primaryKey: true,
        autoIncrement: true
    },
    nombreGenero: {
        type: DataTypes.STRING(50),
        allowNull: false
    }
}, {
    sequelize,
    tableName: 'generos',
    timestamps: false
});

module.exports = Genero;