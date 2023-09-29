const express = require('express');
// eslint-disable-next-line new-cap
const router = express.Router();

const { Contenido, Categoria, Genero, Actricesyactores} = require('../modelos/index');
const sequelize = require('../src/conection/conection');

const { Op } = require('sequelize');
const messageErrorServer = JSON.stringify({ message: 'Se ha generado un error en el servidor' });
const messageError2 = JSON.stringify({ message: 'El dato no se corresponde a un contenido'});

router.get('/', async (req, res) => {
    try {
        const sql = `
        SELECT 
        c.idContenido AS id,
        CONCAT('https://localhost:3000/img', c.poster) AS poster,
        c.titulo AS titulo,
        ca.nombreCategoria AS categoria,
        GROUP_CONCAT( DISTINCT g.nombreGenero SEPARATOR ', ') AS genero,
        c.resumen AS resumen,
        c.temporadas AS temporadas,
        GROUP_CONCAT( DISTINCT act.nombre SEPARATOR ', ') AS reparto,
        c.trailer AS trailer 
        FROM contenidos c
        JOIN categorias ca ON c.idCategoria= ca.idCategoria
        LEFT JOIN contenido_repartos cr ON c.idContenido = cr.idContenido
        LEFT JOIN actricesyactores act ON cr.idActor = act.idActor
        LEFT JOIN contenido_generos cg ON c.idContenido = cg.idContenido
        LEFT JOIN generos g ON g.idGenero = cg.idGenero
        GROUP BY c.idContenido;`;
        const results = await sequelize.query(sql);
        res.status(200).send(results);
    } catch (error) {
        console.log(error.message);
        res.status(500).send(messageErrorServer);
    }
});

router.get('/contenido/:id', async (req, res) => {
    const ID = Number(req.params.id);
    if (isNaN(ID)) {
        res.status(400).send({ message: 'El id tiene que ser un numero'});
        return;
    }
    try {
        const movies = await Contenido.findOne({attributes: ['titulo', 'temporadas', 'poster', 'resumen', 'trailer'],
            where: {idContenido: ID},
            include: [
                { model: Actricesyactores, as: 'actor', attributes: ['nombre'], through: { attributes: [] }},
                { model: Categoria, attributes: ['nombreCategoria'] },
                { model: Genero, as: 'generos', attributes: ['nombreGenero'], through: { attributes: [] }}
            ] });
        if (movies === null) {
            res.status(400).send(messageError2);
        } else {
            res.status(200).send(movies);
        }
    } catch (error) {
        console.log(error.message);
        res.status(500).send(messageErrorServer);
    }
});


router.get('/genero/:genero', async (req, res) => {
    const gen = req.params.genero;
    // if (!name) {
    //     res.status(403).send({ message: 'Debe ingresar el nombre de la serie o pelicula'});
    //     return;
    // }
    try {
        const movies = await Contenido.findAll({attributes: ['idContenido', 'titulo', 'temporadas', 'poster', 'resumen', 'trailer'],
            include: [
                { model: Actricesyactores, as: 'actor', attributes: ['nombre'], through: { attributes: [] }},
                { model: Categoria, attributes: ['nombreCategoria'] },
                { model: Genero, as: 'generos', attributes: ['nombreGenero'], where: {nombreGenero: gen}, through: { attributes: [] }}
            ] });
        if (movies === null) {
            res.status(400).send(messageError2);
        } else {
            res.status(200).send(movies);
        }
    } catch (error) {
        console.log(error.message);
        res.status(500).send(messageErrorServer);
    }
});

router.get('/categoria/:categoria', async (req, res) => {
    const cat = req.params.categoria;
    if (!cat) {
        res.status(403).send({ message: 'Debe ingresar el nomobre de la serie o pelicula'});
        return;
    }
    try {
        const movies = await Contenido.findAll({attributes: ['idContenido', 'titulo', 'temporadas', 'poster', 'resumen', 'trailer'],
            include: [
                { model: Categoria, where: { nombreCategoria: cat}, attributes: ['nombreCategoria']},
                { model: Actricesyactores, as: 'actor', attributes: ['nombre'], through: { attributes: [] }},
                { model: Genero, as: 'generos', attributes: ['nombreGenero'], through: { attributes: [] }}
            ] });
        if (movies.length === 0) {
            res.status(400).send(messageError2);
        } else {
            res.status(200).send(movies);
        }
    } catch (error) {
        console.log(error.message);
        res.status(500).send(messageErrorServer);
    }
});

router.get('/nombre/:nombre', async (req, res) => {
    const name = req.params.nombre;
    if (!name) {
        res.status(403).send({ message: 'Debe ingresar el nombre de la serie o pelicula'});
        return;
    }
    try {
        const movies = await Contenido.findAll({attributes: ['idContenido', 'titulo', 'temporadas', 'poster', 'resumen', 'trailer'],
            where: { titulo: { [Op.substring]: `%${name}%`}},
            include: [
                { model: Actricesyactores, as: 'actor', attributes: ['nombre'], through: { attributes: [] }},
                { model: Categoria, attributes: ['nombreCategoria'] },
                { model: Genero, as: 'generos', attributes: ['nombreGenero'], through: { attributes: [] }}
            ] });
        if (movies === null) {
            res.status(400).send(messageError2);
        } else {
            res.status(200).send(movies);
        }
    } catch (error) {
        console.log(error.message);
        res.status(500).send(messageErrorServer);
    }
});

router.get('/actores/:idContenido', async (req, res) => {
    const ID = Number(req.params.idContenido);
    try {
        const { rows } = await Contenido.findByPk(ID, {attributes: ['titulo'],
            include: [{ model: Actricesyactores, as: 'actor', attributes: ['nombre'], through: { attributes: [] }}]});
        console.log(rows);
        const movies = rows;
        if (movies === null) {
            res.status(400).send(messageError2);
        } else {
            res.status(200).send(movies);
        }
    } catch (error) {
        console.log(error.message);
        res.status(500).send(messageErrorServer);
    }
});

router.get('/categorias', async (req, res) => {
    try {
        const results = await Categoria.findAll({ attributes: ['nombreCategoria']});
        res.status(200).send(results);
    } catch (error) {
        console.log(error.message);
        res.status(500).send(messageErrorServer);
    }
});

module.exports = router;

