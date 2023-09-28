const Catalogo = require('./catalogos');
const Genero = require('./generos');
const Categoria = require('./categoria');
const CatalogoGenero = require('./catalogo_generos');
const CatalogoReparto = require('./catalogo_repartos');
const Actricesyactores = require('./actricesyactores');


// Relacion one-to-many entre Catalogo y Genero
Catalogo.hasMany(Genero);
Genero.belongsTo(Catalogo);

// Relacion one-to-many entre Catalogo y Categoria
Categoria.hasMany(Catalogo, { foreignKey: 'idCategoria' });
Catalogo.belongsTo(Categoria, { foreignKey: 'idCategoria' });

// Relacion many-to-many entre Catalogo y Genero a travez de CatalogoGenero
Catalogo.belongsToMany(Genero, {
    through: CatalogoGenero,
    foreignKey: 'idCatalogo'
});
Genero.belongsToMany(Catalogo, {
    through: CatalogoGenero,
    foreignKey: 'idCatalogo'
});

// Relacion many-to-many entre Catalogo y Actricesyactores a travez de CatalogoReparto
Catalogo.belongsToMany(Actricesyactores, {
    through: CatalogoReparto,
    foreignKey: 'idCatalogo'
});
Actricesyactores.belongsToMany(Catalogo, {
    through: CatalogoReparto,
    foreignKey: 'idCatalogo'
});

module.exports = { Catalogo, Genero, Categoria, CatalogoGenero, CatalogoReparto, Actricesyactores };