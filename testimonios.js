<<<<<<< HEAD
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
=======
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
>>>>>>> 6340fed6c952f3eef6a1b96246453e90ae6d418f
