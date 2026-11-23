# Cafetería y Pastelería (INF211)

Sitio web que consume datos desde una base de datos PostgreSQL a través de una API en Node.js y Express. Permite **leer**, **filtrar** e **insertar** productos.

## Estructura

```
proyecto-cafeteria-inf211/
├── frontend/                 Sitio web (HTML, Bootstrap, CSS y JavaScript)
│   ├── index.html
│   └── assets/
│       ├── css/style.css
│       └── js/script.js
├── backend/                  API (Node.js + Express + pg)
│   ├── server.js
│   └── package.json
└── respaldo_cafeteria.sql    Dump de la base de datos (estructura y datos)
```

## Cómo ejecutarlo

1. **Base de datos:** crear la base y restaurar el dump.

   ```
   createdb consulta_productos
   psql -d consulta_productos -f respaldo_cafeteria.sql
   ```

2. **Backend:** crear el archivo `backend/.env` con los datos de la base.

   ```
   DB_HOST=localhost
   DB_PORT=5432
   DB_DATABASE=consulta_productos
   DB_USER=postgres
   DB_PASSWORD=su_contraseña
   ```

   Luego instalar y levantar el servidor (queda en `http://localhost:3000`).

   ```
   cd backend
   npm install
   npm start
   ```

3. **Frontend:** abrir `frontend/index.html` con Live Server (puerto 5500).

## Secciones del sitio

- **Inicio:** presentación de la cafetería.
- **Productos:** lista desde la base de datos, filtros por nombre y categoría, y formulario para agregar productos.
- **Contacto:** correo, teléfono, dirección y horario.

## Tecnologías

HTML5 semántico, Bootstrap 5, JavaScript (fetch, DOM), Node.js, Express y PostgreSQL.
