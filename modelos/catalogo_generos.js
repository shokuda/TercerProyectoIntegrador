/* eslint-disable new-cap */
const { DataTypes } = require('sequelize');
const sequelize = require('../src/conection/conection');


const CatalogoGenero = sequelize.define('catalogo_generos', {
    idCatalogoGenero: {
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
    modelName: 'catalogo_generos',
    timestamps: false
});
module.exports = CatalogoGenero;