/* eslint-disable new-cap */
const { DataTypes } = require('sequelize');
const sequelize = require('../src/conection/conection');


const ContenidoGenero = sequelize.define('contenido_generos', {
    idContenidoGenero: {
        type: DataTypes.INTEGER(10),
        primaryKey: true,
        autoIncrement: true
    },
    idCatalogo: {
        type: DataTypes.INTEGER(10),
        allowNull: false
    },
    idGenero: {
        type: DataTypes.INTEGER(10),
        allowNull: false
    }
}, {
    sequelize,
    tableName: 'contenido_generos',
    timestamps: false
});
module.exports = ContenidoGenero;