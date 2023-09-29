/* eslint-disable new-cap */
const { DataTypes } = require('sequelize');
const sequelize = require('../src/conection/conection');

const Actricesyactores = sequelize.define('actricesyactores', {
    idActor: {
        type: DataTypes.INTEGER(10),
        primaryKey: true,
        autoIncrement: true
    },
    nombre: {
        type: DataTypes.STRING(50),
        allowNull: false
    }
}, {
    sequelize,
    tableName: 'actricesyactores',
    timestamps: false
});

module.exports = Actricesyactores;