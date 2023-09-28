/* eslint-disable new-cap */
const { DataTypes } = require('sequelize');
const sequelize = require('../src/conection/conection');

const CatalogoReparto = sequelize.define('catalogo_repartos', {
    idCatalogoReparto: {
        type: DataTypes.INTEGER(10),
        primaryKey: true,
        autoIncrement: true
    },
    idCatalogo: {
        type: DataTypes.INTEGER(10),
        allowNull: false
    },
    idActor: {
        type: DataTypes.INTEGER(10),
        allowNull: false
    }
}, {
    sequelize,
    modelName: 'catalogo_repartos',
    timestamps: false
});

module.exports = CatalogoReparto;