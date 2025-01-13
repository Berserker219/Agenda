document.addEventListener('DOMContentLoaded', function() {
    showTab('calendar');
    updateCalendar();
    loadEventList();
  });
  
  function showTab(tabName) {
    const tabs = document.querySelectorAll('.tab-content');
    tabs.forEach(tab => {
      tab.style.display = 'none';
    });
    document.getElementById(tabName).style.display = 'block';
  }
  
  let currentDate = new Date();
  
  function updateCalendar() {
    const daysInMonth = new Date(currentDate.getFullYear(), currentDate.getMonth() + 1, 0).getDate();
    const firstDayOfMonth = new Date(currentDate.getFullYear(), currentDate.getMonth(), 1).getDay();
    document.getElementById('current-month').textContent = currentDate.toLocaleString('default', { month: 'long', year: 'numeric' });
    const days = document.getElementById('days');
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
    fetch('http://localhost:8000/api/reuniones/')
      .then(response => response.json())
      .then(data => {
        eventListComponent.innerHTML = data.map(event => `
          <div class="event">
            <h3>${event.title}</h3>
            <p>${event.date} ${event.time}</p>
          </div>
        `).join('');
      })
      .catch(error => console.error('Error fetching events:', error));
  }
  
  function addContact() {
    const name = document.getElementById('contact-name').value;
    const email = document.getElementById('contact-email').value;
    const phone = document.getElementById('contact-phone').value;
    const contactList = document.getElementById('contact-list');
    contactList.innerHTML += `
      <div class="contact">
        <p>${name}</p>
        <p>${email}</p>
        <p>${phone}</p>
        <button onclick="deleteContact(this)">Eliminar</button>
      </div>
    `;
  }
  
  function deleteContact(button) {
    button.parentElement.remove();
  }
  
  function searchContact() {
    const searchTerm = document.getElementById('search-term').value.toLowerCase();
    const contacts = document.querySelectorAll('.contact');
    contacts.forEach(contact => {
      const name = contact.querySelector('p:nth-child(1)').textContent.toLowerCase();
      const email = contact.querySelector('p:nth-child(2)').textContent.toLowerCase();
      const phone = contact.querySelector('p:nth-child(3)').textContent.toLowerCase();
      if (name.includes(searchTerm) || email.includes(searchTerm) || phone.includes(searchTerm)) {
        contact.style.display = 'flex';
      } else {
        contact.style.display = 'none';
      }
    });
  }

  function loadContactManager() {
    const contactManagerComponent = document.getElementById('contact-manager-component');
    contactManagerComponent.innerHTML = `
      <div class="contact-manager">
        <input type="text" id="contact-name" placeholder="Nombre del contacto">
        <input type="email" id="contact-email" placeholder="Email del contacto">
        <input type="tel" id="contact-phone" placeholder="Teléfono del contacto">
        <button onclick="addContact()">Añadir Contacto</button>
      </div>
      <div class="contact-manager">
        <input type="text" id="search-term" placeholder="Buscar contacto">
        <button onclick="searchContact()">Buscar</button>
      </div>
      <div id="contact-list"></div>
    `;
    fetchContacts();
  }
  
  function fetchContacts() {
    fetch('http://localhost:8000/api/personas/')
      .then(response => response.json())
      .then(data => {
        const contactList = document.getElementById('contact-list');
        contactList.innerHTML = data.map(contact => `
          <div class="contact">
            <p>${contact.full_name}</p>
            <p>${contact.email}</p>
            <p>${contact.phone}</p>
            <button onclick="deleteContact(${contact.id}, this)">Eliminar</button>
          </div>
        `).join('');
      })
      .catch(error => console.error('Error fetching contacts:', error));
  }
  
  function addContact() {
    const name = document.getElementById('contact-name').value;
    const email = document.getElementById('contact-email').value;
    const phone = document.getElementById('contact-phone').value;
  
    fetch('http://localhost:8000/api/persona/create/', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({ full_name: name, email: email, phone: phone })
    })
      .then(response => response.json())
      .then(data => {
        fetchContacts();
        document.getElementById('contact-name').value = '';
        document.getElementById('contact-email').value = '';
        document.getElementById('contact-phone').value = '';
      })
      .catch(error => console.error('Error adding contact:', error));
  }
  
  function deleteContact(id, button) {
    fetch(`http://localhost:8000/api/persona/delete/${id}/`, {
      method: 'DELETE'
    })
      .then(() => {
        button.parentElement.remove();
      })
      .catch(error => console.error('Error deleting contact:', error));
  }
  
  function searchContact() {
    const searchTerm = document.getElementById('search-term').value.toLowerCase();
    const contacts = document.querySelectorAll('.contact');
    contacts.forEach(contact => {
      const name = contact.querySelector('p:nth-child(1)').textContent.toLowerCase();
      const email = contact.querySelector('p:nth-child(2)').textContent.toLowerCase();
      const phone = contact.querySelector('p:nth-child(3)').textContent.toLowerCase();
      if (name.includes(searchTerm) || email.includes(searchTerm) || phone.includes(searchTerm)) {
        contact.style.display = 'flex';
      } else {
        contact.style.display = 'none';
      }
    });
  }
    