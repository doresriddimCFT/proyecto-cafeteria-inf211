require("dotenv").config();

const express = require("express");
const cors = require("cors");
const { Pool } = require("pg");

const app = express();
const PORT = process.env.PORT || 3000;
app.use(express.json());

// En producción, FRONTEND_URL debe contener el origen de GitHub Pages.
// Durante el desarrollo también se permite localhost.
const origenesPermitidos = [
  process.env.FRONTEND_URL,
  "http://127.0.0.1:5500",
  "http://localhost:5500",
  "http://127.0.0.1:5501",
  "http://localhost:5501"
].filter(Boolean);

app.use(cors({
  origin: function (origen, callback) {
    // Permite herramientas sin origen (por ejemplo, pruebas directas) y los orígenes indicados.
    if (!origen || origenesPermitidos.includes(origen)) {
      return callback(null, true);
    }
    return callback(new Error("Origen no permitido por CORS"));
  }
}));

const pool = new Pool({
  host: process.env.DB_HOST,
  port: Number(process.env.DB_PORT || 5432),
  database: process.env.DB_DATABASE,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  ssl: process.env.DB_SSL === "true" ? { rejectUnauthorized: false } : false
});

app.get("/", (req, res) => {
  res.send("Backend de consulta funcionando.");
});

// Consulta dos tablas relacionadas mediante INNER JOIN.
// Los filtros se aplican en JavaScript en el navegador para mantener simple el ejemplo.
app.get("/api/productos", async (req, res) => {
  try {
    const consulta = `
      SELECT
        p.producto_id,
        p.nombre,
        p.descripcion,
        p.precio,
        c.nombre AS categoria
      FROM demo_productos AS p
      INNER JOIN demo_categorias AS c
        ON p.categoria_id = c.categoria_id
      ORDER BY p.nombre;
    `;

    const resultado = await pool.query(consulta);
    res.json(resultado.rows);
  } catch (error) {
    console.error("Error al consultar productos:", error.message);
    res.status(500).json({ mensaje: "Error al consultar la base de datos." });
  }
});

// Inserta un nuevo producto desde el formulario web.
app.post("/api/productos", async (req, res) => {
  try {
    const { nombre, descripcion, categoria, precio } = req.body;

    const consulta = `
      INSERT INTO demo_productos (nombre, descripcion, categoria_id, precio)
      VALUES ($1, $2, $3, $4)
      RETURNING *;
    `;

    const valores = [nombre, descripcion, categoria, precio];
    const resultado = await pool.query(consulta, valores);

    res.status(201).json({
      mensaje: "Producto guardado con éxito",
      producto: resultado.rows[0]
    });
  } catch (error) {
    console.error("Error al insertar producto:", error.message);
    res.status(500).json({ mensaje: "Error al guardar en la base de datos." });
  }
});

app.listen(PORT, () => {
  console.log("Servidor escuchando en el puerto " + PORT);
});
