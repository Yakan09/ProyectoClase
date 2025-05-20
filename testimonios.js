const contenedor = document.getElementById("contenedor");

for (let i = 0; i < coleccion.length; i++) {
  const elemento = coleccion[i];

  const div = document.createElement("div");
  div.classList.add("testimonio");
  div.innerHTML = `
    <p>"${elemento.mensaje}"</p>
    <span>- ${elemento.nombre} ${elemento.apellido}</span>
  `;
  contenedor.appendChild(div);
}
