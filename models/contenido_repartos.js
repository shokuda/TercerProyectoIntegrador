/* eslint-disable new-cap */
const { DataTypes } = require('sequelize');
const sequelize = require('../src/conection/conection');

const ContenidoReparto = sequelize.define('contenido_repartos', {
    idContenidoReparto: {
        type: DataTypes.INTEGER(10),
        primaryKey: true,
        autoIncrement: true
    },
    idContenido: {
        type: DataTypes.INTEGER(10),
        allowNull: false
    },
    idActor: {
        type: DataTypes.INTEGER(10),
        allowNull: false
    }
}, {
    sequelize,
    tableName: 'contenido_repartos',
    timestamps: false
});

module.exports = ContenidoReparto;