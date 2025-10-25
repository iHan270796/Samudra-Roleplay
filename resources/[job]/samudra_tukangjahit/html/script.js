window.addEventListener('message', (event) => {
  const data = event.data;
  if (data.action === 'update') {
    updateTasks(data.tasks);
  } else if (data.action === 'close') {
    document.getElementById('task-ui').classList.add('hidden');
  }
});

const taskTexts = {
  kapas: {
    title: "Ambil Kapas",
    desc: "Mengambil kapas dari kebun dan memasukkannya ke wadah pemintal."
  },
  benang: {
    title: "Proses Benang",
    desc: "Memintal kapas menjadi benang di alat pemintal."
  },
  kain: {
    title: "Proses Kain",
    desc: "Menjalin benang menjadi kain menggunakan alat tenun."
  },
  baju: {
    title: "Jahit Baju",
    desc: "Menjahit kain menjadi pakaian jadi di meja jahit."
  }
};

function updateTasks(tasks) {
  const ui = document.getElementById('task-ui');
  const list = document.getElementById('task-list');
  ui.classList.remove('hidden');
  list.innerHTML = '';

  // urutan tetap
  const order = ['kapas', 'benang', 'kain', 'baju'];

  for (const key of order) {
    const data = tasks[key];
    if (!data) continue;

    const done = data.done || 0;
    const required = data.required || 0;
    const progress = required > 0 ? (done / required) * 100 : 0;
    const finished = done >= required && required > 0;

    const info = taskTexts[key] || { title: key, desc: "" };

    const card = document.createElement('div');
    card.className = 'task-card';
    card.innerHTML = `
      <div class="task-top">
        <div class="task-info">
          <div class="task-checkbox ${finished ? 'checked' : ''}"></div>
          <div class="task-title">${info.title}</div>
        </div>
        <div class="task-ratio">${done}/${required}</div>
      </div>
      <div class="task-desc">${info.desc}</div>
      <div class="task-progress"><span style="width:${progress}%;"></span></div>
    `;
    list.appendChild(card);
  }
}

