// window.addEventListener('message', (event) => {
//   const data = event.data;
//   if (data.action === 'update') {
//     updateTasks(data.tasks);
//   } else if (data.action === 'close') {
//     document.getElementById('task-ui').classList.add('hidden');
//   } else if (data.action === 'updateClothType') {
//     const cloth = data.cloth;
//     const cards = document.querySelectorAll('.task-card');
//     cards.forEach(card => {
//       const title = card.querySelector('.task-title');
//       if (!title) return;
//       if (title.textContent.includes('Pilih Pakaian') || title.textContent.includes('Jahit Baju')) {
//         title.textContent = `Proses ${cloth}`;
//         const desc = card.querySelector('.task-desc');
//         if (desc) desc.textContent = `Menjahit ${cloth.toLowerCase()} di meja jahit.`;
//       }
//     });
//     window.selectedCloth = cloth;
//   }
// });

window.addEventListener('message', (event) => {
  const data = event.data;

  if (data.action === 'update') {
    updateTasks(data.tasks);

  } else if (data.action === 'close') {
    document.getElementById('task-ui').classList.add('hidden');
    window.selectedCloth = null;

  } else if (data.action === 'resetCloth') {
    window.selectedCloth = null; // 🧹 reset cloth pas mulai job baru

  } else if (data.action === 'updateClothType') {
    const cloth = data.cloth;

    // cari card untuk task baju lalu ubah titlenya jadi "Proses <cloth>"
    const cards = document.querySelectorAll('.task-card');
    cards.forEach(card => {
      const title = card.querySelector('.task-title');
      if (!title) return;
      if (title.textContent.includes('Pilih Pakaian') || title.textContent.includes('Jahit Baju')) {
        title.textContent = `Proses ${cloth}`;
        const desc = card.querySelector('.task-desc');
        if (desc) desc.textContent = `Menjahit ${cloth.toLowerCase()} di meja jahit.`;
      }
    });

    // tandai kalau sudah pilih, supaya progress baju ditampilkan
    window.selectedCloth = cloth;
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
    title: "Pilih Pakaian",
    desc: "Silahkan pilih pakaian untuk dijahit."
  }
};

function updateTasks(tasks) {
  const ui = document.getElementById('task-ui');
  const list = document.getElementById('task-list');
  ui.classList.remove('hidden');
  list.innerHTML = '';

  const order = ['kapas', 'benang', 'kain', 'baju'];

  for (const key of order) {
    const data = tasks[key];
    if (!data) continue;

    const done = data.done || 0;
    const required = data.required || 0;
    const progress = required > 0 ? (done / required) * 100 : 0;
    const finished = done >= required && required > 0;
    const info = taskTexts[key] || { title: key, desc: "" };

    let ratioText = `${done}/${required}`;
    let progressHTML = `<div class="task-progress"><span style="width:${progress}%;"></span></div>`;

    // jika tahap baju tapi belum pilih pakaian, hilangkan progress
    if (key === 'baju' && !window.selectedCloth) {
      ratioText = '';
      progressHTML = '';
    }

    const card = document.createElement('div');
    card.className = 'task-card';
    card.innerHTML = `
      <div class="task-top">
        <div class="task-info">
          <div class="task-checkbox ${finished ? 'checked' : ''}"></div>
          <div class="task-title">${info.title}</div>
        </div>
        <div class="task-ratio">${ratioText}</div>
      </div>
      <div class="task-desc">${info.desc}</div>
      ${progressHTML}
    `;
    list.appendChild(card);
  }
}
