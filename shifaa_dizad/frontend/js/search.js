// ── Search page ───────────────────────────────────────────────────────────────
let currentPage = 1;
const params = new URLSearchParams(window.location.search);

const PRICE_TYPES = ['device','parapharmacy','special_needs','home_care','emergency'];

function setCatFilter(btn, type) {
  document.querySelectorAll('.cat-filter-btn').forEach(b => b.classList.remove('active'));
  btn.classList.add('active');
  const sel = document.getElementById('s-type');
  if (sel) { sel.value = type; }
  currentPage = 1;
  doSearch();
}

function getFilters() {
  return {
    q:            document.getElementById('s-query')?.value.trim()    || '',
    wilaya:       document.getElementById('s-wilaya')?.value           || '',
    type:         document.getElementById('s-type')?.value             || '',
    availability: document.getElementById('s-availability')?.value     || '',
    page:         currentPage,
    limit:        10,
  };
}

function availabilityBadge(a) {
  if (a === 'available') return '<span class="badge badge-secondary">متوفر</span>';
  if (a === 'limited')   return '<span class="badge badge-orange">محدود</span>';
  return '<span class="badge badge-red">غير متوفر</span>';
}

async function doSearch() {
  const container = document.getElementById('results');
  const countEl   = document.getElementById('results-count');

  if (!container) return;

  container.innerHTML = '<div class="spinner" style="margin:2rem auto"></div>';

  try {
    const f = getFilters();
    const data = await api.get('/medicines/search.php', f);

    // Support both data.medicines and data.results for robustness
    const medicines = data.medicines ?? data.results ?? [];
    const total     = data.total ?? medicines.length;

    if (countEl) countEl.textContent = `${formatNum(total)} نتيجة`;

    if (!medicines.length) {
      container.innerHTML = `<div class="empty-state">
        <div class="empty-icon">🔍</div>
        <p>لا توجد نتائج مطابقة</p>
      </div>`;
      return;
    }

    container.innerHTML = medicines.map(m => {
      const showPrice = PRICE_TYPES.includes(m.type) && m.price;
      return `
      <div class="search-med-card animate-in">
        <div class="med-main">
          <h3>${m.name}${m.name_ar
            ? ` <small style="font-weight:400;color:var(--muted)">${m.name_ar}</small>`
            : ''}</h3>
          <div class="med-meta">
            <span>💊 ${m.active_ingredient || 'غير محدد'}</span>
            <span>📍 ${m.city}، ${m.wilaya}</span>
            <span>🏥 ${m.pharmacy_name || '—'}</span>
            ${m.pharmacy_phone ? `<span>📞 ${m.pharmacy_phone}</span>` : ''}
          </div>
        </div>
        <div class="med-right">
          <div style="text-align:center">
            <div style="font-size:1.2rem;font-weight:900">${m.quantity}</div>
            <div style="font-size:0.72rem;color:var(--muted)">وحدة</div>
          </div>
          ${showPrice ? `<div style="text-align:center"><div style="font-size:1rem;font-weight:800;color:var(--primary)">${formatNum(m.price)} DA</div></div>` : ''}
          ${availabilityBadge(m.availability)}
          <button class="btn btn-primary btn-sm"
            onclick="openReservation(${JSON.stringify(m).replace(/"/g, '&quot;')})">
            حجز
          </button>
        </div>
      </div>`}).join('');

  } catch (err) {
    // Log the real error so it's visible in DevTools
    console.error('[Search] doSearch failed:', err);
    container.innerHTML = `<p style="color:var(--muted);text-align:center;padding:2rem">
      حدث خطأ أثناء البحث
    </p>`;
  }
}

// ── Reservation modal ─────────────────────────────────────────────────────────
let _resData = null;

function openReservation(med) {
  _resData = med;
  const nameEl     = document.getElementById('res-medicine-name');
  const pharmacyEl = document.getElementById('res-pharmacy-name');
  if (nameEl)     nameEl.textContent     = med.name;
  if (pharmacyEl) pharmacyEl.textContent = med.pharmacy_name || '—';
  openModal('reservation-modal');
}

async function submitReservation(e) {
  e.preventDefault();
  if (!_resData) return;
  const btn = e.target.querySelector('[type=submit]');
  btn.disabled = true; btn.textContent = 'جارٍ الحجز...';
  try {
    await api.post('/reservations/create.php', {
      medicineId:   parseInt(_resData.id),
      pharmacyId:   parseInt(_resData.pharmacy_id),
      medicineName: _resData.name,
      pharmacyName: _resData.pharmacy_name || '',
      patientName:  document.getElementById('res-patient-name').value,
      patientPhone: document.getElementById('res-patient-phone').value,
      quantity:     parseInt(document.getElementById('res-qty').value) || 1,
      notes:        document.getElementById('res-notes').value,
    });
    closeModal('reservation-modal');
    showToast('تم الحجز بنجاح! سيتم التواصل معك قريباً', 'success');
    e.target.reset();
  } catch (err) {
    console.error('[Search] submitReservation failed:', err);
    showToast('حدث خطأ أثناء الحجز', 'error');
  } finally {
    btn.disabled = false; btn.textContent = 'تأكيد الحجز';
  }
}

// ── Init ──────────────────────────────────────────────────────────────────────
function initSearch() {
  // Pre-fill inputs from URL query string
  const qEl = document.getElementById('s-query');
  const wEl = document.getElementById('s-wilaya');
  const tEl = document.getElementById('s-type');
  const aEl = document.getElementById('s-availability');

  if (qEl && params.get('q'))            qEl.value = params.get('q');
  if (wEl && params.get('wilaya'))       wEl.value = params.get('wilaya');
  if (tEl && params.get('type'))         tEl.value = params.get('type');
  if (aEl && params.get('availability')) aEl.value = params.get('availability');

  // Populate wilaya <select>
  if (wEl && typeof WILAYAS !== 'undefined') {
    WILAYAS.forEach(w => {
      const o = document.createElement('option');
      o.value = w; o.textContent = w;
      wEl.appendChild(o);
    });
  }

  // Search form submit
  document.getElementById('search-form')?.addEventListener('submit', (e) => {
    e.preventDefault();
    currentPage = 1;
    doSearch();
  });

  // Filter dropdowns trigger search immediately
  ['s-wilaya', 's-type', 's-availability'].forEach(id => {
    document.getElementById(id)?.addEventListener('change', () => {
      currentPage = 1;
      doSearch();
    });
  });

  // Reservation form
  document.getElementById('res-form')?.addEventListener('submit', submitReservation);

  // Auto-search if URL already has parameters
  if (params.get('q') || params.get('category')) {
    doSearch();
  }
}

document.addEventListener('DOMContentLoaded', initSearch);
