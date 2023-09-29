/* eslint-disable new-cap */
const { DataTypes } = require('sequelize');
const sequelize = require('../src/conection/conection');

const Categoria = sequelize.define('categorias', {
    idCategoria: {
        type: DataTypes.INTEGER(10),
        primaryKey: true,
        autoIncrement: true
    },
    nombreCategoria: {
        type: DataTypes.STRING(50),
        allowNull: false
    }
}, {
    sequelize,
    tableName: 'categorias',
    timestamps: false
});

module.exports = Categoria;