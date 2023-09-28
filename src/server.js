const dotenv = require('dotenv');
dotenv.config();
const express = require('express');
const server = express();
const sequelize = require('./conection/conection');
require('../modelos/index');
const contenidos = require('../routes/catalogo');

// Middlewares

server.use(express.json());
server.use(express.urlencoded({ extended: true }));
server.use('/api', contenidos);

// Control de rutas inexistentes
server.use('*', (req, res) => {
    res.status(404).send();
});
sequelize.authenticate().then(() => {
    sequelize.sync({ force: false }).then(() => {
        server.listen(process.env.PORT, process.env.HOST, () => {
            console.log(`El servidor está escuchando en: http://${process.env.HOST}:${process.env.PORT}`);
        });
    }).catch(() => {
        console.log('Hubo un problema con la sincronización de la base de datos.');
    }).catch(() => {
        console.log('Hubo un problema de autenticación de la base de datos.');
    });
});