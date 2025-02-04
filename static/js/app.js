document.addEventListener('DOMContentLoaded', function() {
    showTab('calendar');
    updateCalendar();
    loadEventList();
    loadContactManager(); // Asegúrate de cargar el gestor de contactos

    // const elemento = document.getElementById("tuElementoID");
    // if (elemento) {
    //     elemento.innerHTML = "Contenido cargado correctamente";
    // } else {
    //     console.error("El elemento con ID 'tuElementoID' no existe.");
    // }
});

function getCSRFToken() {
  const cookies = document.cookie.split(';');
  for (let cookie of cookies) {
      const [name, value] = cookie.trim().split('=');
      if (name === 'csrftoken') {
          return value;
      }
  }
  return null;
}

function showTab(tabName) {
    const tabs = document.querySelectorAll('.tab-content');
    tabs.forEach(tab => {
      tab.style.display = 'none';
    });
    document.getElementById(tabName).style.display = 'block';
}

let currentDate = new Date();

// function updateCalendar() {
//     const daysInMonth = new Date(currentDate.getFullYear(), currentDate.getMonth() + 1, 0).getDate();
//     const firstDayOfMonth = new Date(currentDate.getFullYear(), currentDate.getMonth(), 1).getDay();
//     document.getElementById('current-month').textContent = currentDate.toLocaleString('default', { month: 'long', year: 'numeric' });
//     const days = document.getElementById('days');
//     days.innerHTML = '';
//     for (let i = 0; i < firstDayOfMonth; i++) {
//       days.innerHTML += '<div></div>';
//     }
//     for (let i = 1; i <= daysInMonth; i++) {
//       days.innerHTML += `<button>${i}</button>`;
//     }
// }
function updateCalendar() {
  const days = document.getElementById('days');
  const currentMonth = document.getElementById('current-month');
  if (!days || !currentMonth) {
      console.error("No se encontraron los elementos necesarios para el calendario.");
      return;
  }

  const daysInMonth = new Date(currentDate.getFullYear(), currentDate.getMonth() + 1, 0).getDate();
  const firstDayOfMonth = new Date(currentDate.getFullYear(), currentDate.getMonth(), 1).getDay();

  currentMonth.textContent = currentDate.toLocaleString('default', { month: 'long', year: 'numeric' });
  days.innerHTML = '';
  for (let i = 0; i < firstDayOfMonth; i++) {
      days.innerHTML += '<div></div>';
  }
  for (let i = 1; i <= daysInMonth; i++) {
      days.innerHTML += `<button>${i}</button>`;
  }
}


function prevMonth() {
    currentDate.setMonth(currentDate.getMonth() - 1);
    updateCalendar();
}

function nextMonth() {
    currentDate.setMonth(currentDate.getMonth() + 1);
    updateCalendar();
}

function loadEventList() {
    const eventListComponent = document.getElementById('event-list-component');
    fetch('http://127.0.0.1:8000/api/reuniones/')
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .then(data => {
            eventListComponent.innerHTML = data.map(event => `
                <div class="event">
                    <div class="event-title"><h3>${event.asunto}</h3></div>
                    <div class="event-fecha"><p>${event.fecha}</p></div>
                    <div class="event-nombre"><p>${event.persona.full_name}</p></div>
                </div>
            `).join('');
        })
        .catch(error => console.error('Error fetching events:', error));
}

function loadContactManager() {
    // const contactManagerComponent = document.getElementById('contact-manager');
    // contactManagerComponent.innerHTML = `
    //   <div class="contact-manager">
    //     <input type="text" id="contact-name" placeholder="Nombre del contacto">
    //     <input type="text" id="contact-job" placeholder="Trabajo del contacto">
    //     <input type="email" id="contact-email" placeholder="Email del contacto">
    //     <input type="tel" id="contact-phone" placeholder="Teléfono del contacto">
    //     <input type="text" id="contact-hobbies" placeholder="Hobbies del contacto (separados por comas)">
    //     <button onclick="addContact()">Añadir Contacto</button>
    //   </div>
    //   <div class="contact-manager">
    //     <input type="text" id="search-term" placeholder="Buscar contacto">
    //     <button onclick="searchContact()">Buscar</button>
    //   </div>
    //   <div id="contact-list"></div>
    // `;
    // fetchContacts();

    
  // Verificar si el elemento existe en el DOM
  const contactManagerComponent = document.querySelector('.contact-manager');
  if (!contactManagerComponent) {
      console.error("No se encontró el componente de gestión de contactos en el HTML.");
      return;
  }

  // Cargar contactos desde la API
  fetchContacts();
}
  


// function fetchContacts() {
//   fetch('http://127.0.0.1:8000/api/personas/')// URL correcta
//     .then(response => response.json())
//     .then(data => {
//       const contactsContainer = document.getElementById('contact-list');
//       contactsContainer.innerHTML = ''; // Limpiar el contenedor antes de agregar nuevos contactos

//       data.forEach(person => {
//         const hobbies = person.hobbies.map(hobby => hobby.hobby).join(", ");
//         const contactElement = `
//           <div class="contact">
//             <p> ${person.full_name}</p>
//             <p> ${person.job}</p>
//             <p> ${person.email}</p>
//             <p> ${person.phone}</p>
//             <p>${hobbies}</p>
//           </div>
//         `;
//         contactsContainer.innerHTML += contactElement;
//       });
//     })
//     .catch(error => console.error('Error fetching contacts:', error));
// }


// function fetchContacts() {
//   fetch('http://127.0.0.1:8000/api/personas/')
//     .then(response => {
//       if (!response.ok) {
//         throw new Error(`HTTP error! status: ${response.status}`);
//       }
//       return response.json();
//     })
//     .then(data => {
//       const contactsContainer = document.getElementById('contact-list');
//       if (!contactsContainer) {
//         console.error('No se encontró el contenedor con ID "contact-list".');
//         return;
//       }

//       contactsContainer.innerHTML = ''; // Limpiar el contenedor antes de agregar nuevos contactos

//       data.forEach(person => {
//         // Extraer los nombres de los hobbies
//         const hobbies = person.hobbies.map(hobby => typeof hobby === 'string' ? hobby : hobby.hobby).join(", ");
//         // const hobbies = person.hobbies.join(", ");
//         // console.log(`Hobbies: ${hobbies}`);
//         // Crear el elemento HTML para cada contacto
//         const contactElement = `
//           <div class="contact-list">
//             <p><strong>Nombre:</strong> ${person.full_name}</p>
//             <p><strong>Trabajo:</strong> ${person.job}</p>
//             <p><strong>Email:</strong> ${person.email}</p>
//             <p><strong>Teléfono:</strong> ${person.phone}</p>
//             <p><strong>Hobbies:</strong> ${hobbies}</p>
//             <button onclick="deleteContact(${person.id}, this)">Eliminar</button>
//           </div>
//         `;
//         contactsContainer.innerHTML += contactElement;
//       });
//     })
//     .catch(error => console.error('Error fetching contacts:', error));
// }


function fetchContacts() {
  console.log("fetchContacts() se está ejecutando..."); // Depuración inicial
  fetch('http://127.0.0.1:8000/api/personas/')
    .then(response => {
      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      return response.json();
    })
    .then(data => {
      console.log("Datos recibidos del servidor:", data); // Depuración
      const contactsContainer = document.getElementById('contact-list');
      if (!contactsContainer) {
        console.error('No se encontró el contenedor con ID "contact-list".');
        return;
      }

      // Limpiar el contenedor antes de agregar nuevos contactos
      contactsContainer.innerHTML = '';

      data.forEach(person => {
        console.log(`Contacto: ${person.full_name}`); // Depuaracion
        console.log('Hobbies:', person.hobbies); // Depuración
        // Extraer los nombres de los hobbies
        const hobbies = person.hobbies ? person.hobbies.join(", ") : "Sin hobbies";
        console.log(`Hobbies procesados: ${hobbies}`);
        // Crear el elemento HTML para cada contacto
        const contactElement = document.createElement('div');
        contactElement.classList.add('contact');

        contactElement.innerHTML = `
          <p> ${person.full_name}</p>
          <p> ${person.job}</p>
          <p> ${person.email}</p>
          <p> ${person.phone}</p>
          <p> ${hobbies}</p>
          <button onclick="deleteContact(${person.id}, this)">Eliminar</button>
        `;

        // Agregar el elemento al contenedor
        contactsContainer.appendChild(contactElement);
      });
    })
    .catch(error => console.error('Error fetching contacts:', error));
}

function addContact() {
    const csrfToken = getCSRFToken();
    console.log('addContact llama correctamente');
    const name = document.getElementById('contact-name').value;
    const job = document.getElementById('contact-job').value;
    const email = document.getElementById('contact-email').value;
    const phone = document.getElementById('contact-phone').value;
    const hobbies = document.getElementById('contact-hobbies').value.split(',').map(hobby => hobby.trim());

    const requestBody = JSON.stringify({
      full_name: name,
      job: job,
      email: email,
      phone: phone, 
      hobbies_input: hobbies // Envia los hobbies como una lista de string
    });

    console.log(requestBody); // Verifica el formato del JSON

    fetch('http://127.0.0.1:8000/api/persona/create/', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRFToken': csrfToken
      },
      body: requestBody
    })
      .then(response => {
        if (!response.ok) {
          throw new Error('HTTP error! status: ${response.status}');
        }
        return response.json();
      })
      .then(data => {
        fetchContacts();
        document.getElementById('contact-name').value = '';
        document.getElementById('contact-job').value = '';
        document.getElementById('contact-email').value = '';
        document.getElementById('contact-phone').value = '';
        document.getElementById('contact-hobbies').value = '';
      })
      .catch(error => console.error('Error adding contact:', error));
}

// function addContact() {
//   const csrfToken = getCSRFToken(); // Asegúrate de que esta función retorne el token CSRF correcto
//   console.log('addContact llama correctamente');
//   const name = document.getElementById('contact-name').value;
//   const job = document.getElementById('contact-job').value;
//   const email = document.getElementById('contact-email').value;
//   const phone = document.getElementById('contact-phone').value;
//   const hobbies = document.getElementById('contact-hobbies').value.split(',').map(hobby => ({ hobby: hobby.trim() }));

//   const requestBody = JSON.stringify({
//     full_name: name,
//     job: job,
//     email: email,
//     phone: phone,
//     hobbies: hobbies
//   });

//   console.log(requestBody); // Verifica el formato del JSON

//   fetch('http://127.0.0.1:8000/api/persona/create/', {
//     method: 'POST',
//     headers: {
//       'Content-Type': 'application/json',
//       'X-CSRFToken': csrfToken
//     },
//     body: requestBody
//   })
//     .then(response => response.json())
//     .then(data => {
//       fetchContacts();
//       document.getElementById('contact-name').value = '';
//       document.getElementById('contact-job').value = '';
//       document.getElementById('contact-email').value = '';
//       document.getElementById('contact-phone').value = '';
//       document.getElementById('contact-hobbies').value = '';
//     })
//     .catch(error => console.error('Error adding contact:', error));
// }


function deleteContact(id, button) {
    const csrfToken = getCSRFToken();
    fetch(`http://127.0.0.1:8000/api/persona/delete/${id}/`, {
      method: 'DELETE',
      headers: {
        'X-CSRFToken': csrfToken
    }
    })
      .then(response => {
        if (response.ok) {
          // Eliminar el contacto del DOM
          const contactDiv = button.parentElement;
          contactDiv.remove();
      } else {
          throw new Error('Error al eliminar el contacto');
      }
  })
  .catch(error => console.error('Error deleting contact:', error));
}
 



function searchContact() {
    const searchTerm = document.getElementById('search-term').value.toLowerCase();
    const contacts = document.querySelectorAll('.contact');
    contacts.forEach(contact => {
      const name = contact.querySelector('p:nth-child(1)').textContent.toLowerCase();
      const job = contact.querySelector('p:nth-child(2)').textContent.toLowerCase();
      const email = contact.querySelector('p:nth-child(3)').textContent.toLowerCase();
      const phone = contact.querySelector('p:nth-child(4)').textContent.toLowerCase();
      const hobbies = contact.querySelector('p:nth-child(5)').textContent.toLowerCase();
      if (name.includes(searchTerm) || job.includes(searchTerm) || email.includes(searchTerm) || phone.includes(searchTerm) || hobbies.includes(searchTerm)) {
        contact.style.display = 'flex';
      } else {
        contact.style.display = 'none';
      }
    });
}
