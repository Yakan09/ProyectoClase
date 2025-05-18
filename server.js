const { Client } = require('pg');

// Configura estos valores con los de tu entorno
const client = new Client({
  host: '192.168.1.0', // Reemplaza con la IP de tu máquina host (por ejemplo, 192.168.56.1)
  port: 5432,
  user: 'postgres',       // Reemplaza con tu usuario de PostgreSQL
  password: 'fer180703',// Reemplaza con tu contraseña
  database: 'Clinica_de_psicologia' // Reemplaza con el nombre de tu base de datos
});

client.connect()
  .then(() => {
    console.log('Conexión exitosa a PostgreSQL');

    return client.query('SELECT nombre, apellido, mensaje_final FROM opinion_mejora');
  })
  .then(res => {
    console.log('Opiniones de mejora:');
    res.rows.forEach(row => {
      console.log(`Nombre: ${row.nombre}, Apellido: ${row.apellido}, Mensaje: ${row.mensaje_final}`);
    });
  })
  .catch(err => {
    console.error('Error en la conexión o consulta:', err.stack);
  })
  .finally(() => {
    client.end();
  });
