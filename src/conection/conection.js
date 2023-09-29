/**
 * @description= Este codigo conecta a la base de datos MySQL usando la librería Sequelize
 * @exports= sequelize model
 */
const Sequelize = require('sequelize');
const sequelize = new Sequelize(process.env.DATABASE, process.env.DBUSER, process.env.DBPASSWORD, { host: process.env.DBHOST,
    dialect: 'mysql',
    define: {
        charset: 'utf8mb4',
        collate: 'utf8mb4_unicode_ci'
    }});
module.exports = sequelize;
