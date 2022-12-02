async function velemenyKuldes() {
    const [name, email, phone, message] = [document.getElementById('name'), document.getElementById('email'), document.getElementById('phone'), document.getElementById('message')];

    if (!name.value || !email.value || !phone.value || !message.value) {
        alert('Kérjük, minden mezőt töltsön ki az űrlapon!');
        return;
    }

    const res = await fetch('/api/kapcsolat', {
        method: 'POST',
        headers: {'Content-Type': 'application/json'},
        body: JSON.stringify({
            name: String(name.value),
            email: String(email.value),
            phone: String(phone.value),
            message: String(message.value)
        })
    })

    if (res.status === 200) {
        alert('Munkatársunk hamarosan keresni fogja önt!');
        name.value = "";
        email.value = "";
        phone.value = "";
        message.value = "";
    }
}

function szamlalo() {
    setInterval(() => {
        document.getElementById('szamlalo').innerHTML = Number(document.getElementById('szamlalo').innerText) + 1;
    }, 500)
}

window.onload = szamlalo;
