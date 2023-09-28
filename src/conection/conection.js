const Sequelize = require('sequelize');
const sequelize = new Sequelize(process.env.DATABASE, process.env.DBUSER, process.env.DBPASSWORD, { host: process.env.DBHOST,
    dialect: 'mysql'});
module.exports = sequelize;
