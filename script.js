document.addEventListener('DOMContentLoaded', () => {
  fetch('/opiniones')
    .then(response => response.json())
    .then(data => {
      const contenedor = document.querySelector('.testimonios-container');
      
      // Limpiar testimonios existentes
      contenedor.innerHTML = '';

      // Insertar los nuevos testimonios
      data.forEach(t => {
        const testimonioDiv = document.createElement('div');
        testimonioDiv.className = 'testimonio';
        testimonioDiv.innerHTML = `
          <p>"${t.mensaje_final}"</p>
          <span id="nombreYapellido">- ${t.nombre} ${t.apellido}</span>
        `;
        contenedor.appendChild(testimonioDiv);
      });
    })
    .catch(error => {
      console.error('Error al cargar testimonios:', error);
    });
});
