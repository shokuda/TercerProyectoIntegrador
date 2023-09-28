/* eslint-disable new-cap */
const { DataTypes } = require('sequelize');
const sequelize = require('../src/conection/conection');
const path = require('path');
const pathPoster = path.join(__dirname, '../img');

const Catalogos = sequelize.define('catalogos', {
    idCatalogo: {
        type: DataTypes.INTEGER(10),
        primaryKey: true,
        allowNull: false,
        autoincrement: true
    },
    idCategoria: {
        type: DataTypes.INTEGER(10),
        allowNull: false
    },
    poster: {
        type: DataTypes.STRING(80),
        default: '',
        get() {
            return pathPoster + this.getDataValue('poster').slice(1);
        },
        allowNull: false
    },
    titulo: {
        type: DataTypes.STRING(80),
        allowNull: false
    },
    temporadas: {
        type: DataTypes.STRING(3),
        allowNull: false
    },
    resumen: {
        type: DataTypes.TEXT,
        allowNull: false
    },
    trailer: {
        type: DataTypes.STRING(120)
    }
}, {
    sequelize,
    modelName: 'catalogos',
    timestamps: false
});

module.exports = Catalogos;
