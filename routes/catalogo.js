const express = require('express');
// eslint-disable-next-line new-cap
const router = express.Router();

// const { Op } = require('sequelize');
const { Catalogo, Categoria, Genero, Actricesyactores } = require('../modelos/index');

const messageErrorServer = JSON.stringify({ message: 'Se ha generado un error en el servidor' });

router.get('/', async (req, res) => {
    try {
        const results = await Catalogo.findAll({ attributes: ['idCatalogo', 'titulo', 'temporadas', 'poster', 'resumen', 'trailer'],
            include: Categoria });
        res.status(200).send(results);
    } catch (error) {
        console.log(error.message);
        res.status(500).send(messageErrorServer);
    }
});

router.get('/:idCatalogo', async (req, res) => {
    const ID = Number(req.params.idCatalogo);
    console.log(req.params.idCatalogo);
    // if (Number.isNaN(ID)) {
    //     res.status(400).send({ message: 'El id tu tiene que ser un numero'});
    //     return;
    // }
    try {
        // const movies = await Catalogo.findOne({attributes: ['idCatalogo', 'titulo', 'temporadas', 'idCategoria', 'poster', 'resumen', 'trailer'],
        //     where: {idCatalogo: ID} });
        const movies = await Catalogo.findByPk(ID);
        res.status(200).send(movies);
    } catch (error) {
        console.log(error.message);
        res.status(500).send(messageErrorServer);
    }
});

router.get('/categorias', async (req, res) => {
    try {
        const results = await Categoria.findAll({ attributes: ['nombreCategorias']});
        res.status(200).send(results);
    } catch (error) {
        console.log(error.message);
        res.status(500).send(messageErrorServer);
    }
});

module.exports = router;

