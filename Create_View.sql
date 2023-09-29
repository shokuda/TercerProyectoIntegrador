USE Trailerflix;
CREATE VIEW view_contenido AS
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
    left JOIN contenido_repartos cr ON c.idContenido = cr.idContenido
    left JOIN actricesyactores act ON cr.idActor = act.idActor
    left JOIN contenido_generos cg ON c.idContenido = cg.idContenido
    left JOIN generos g ON g.idGenero = cg.idGenero
    GROUP BY c.idContenido;