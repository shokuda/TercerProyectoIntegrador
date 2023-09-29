const Contenido = require('./contenidos');
const Genero = require('./generos');
const Categoria = require('./categoria');
const ContenidoGenero = require('./contenido_generos');
const ContenidoReparto = require('./contenido_repartos');
const Actricesyactores = require('./actricesyactores');

// Relacion one-to-many entre Contenido y Categoria
Categoria.hasMany(Contenido, { foreignKey: 'idCategoria' });
Contenido.belongsTo(Categoria, { foreignKey: 'idCategoria' });

// Relacion many-to-many entre Contenido y Genero a travez de ContenidoGenero
Contenido.belongsToMany(Genero, {
    through: { model: ContenidoGenero, unique: false },
    foreignKey: 'idContenido',
    otherKey: 'idGenero',
    as: 'generos'
});
Genero.belongsToMany(Contenido, {
    through: { model: ContenidoGenero, unique: false },
    foreignKey: 'idGenero',
    otherKey: 'idContenido',
    as: 'cont_gen'

});

// Relacion many-to-many entre Contenido y Actricesyactores a travez de ContenidoReparto
Contenido.belongsToMany(Actricesyactores, {
    through: { model: ContenidoReparto, unique: false },
    foreignKey: 'idContenido',
    otherKey: 'idActor',
    as: 'actor'
});
Actricesyactores.belongsToMany(Contenido, {
    through: { model: ContenidoReparto, unique: false },
    foreignKey: 'idActor',
    otherKey: 'idContenido',
    as: 'cont_act'
});

module.exports = { Contenido, Genero, Categoria, ContenidoGenero, ContenidoReparto, Actricesyactores };