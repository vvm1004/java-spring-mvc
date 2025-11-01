// Initialize Simple-DataTables (no jQuery required)
window.addEventListener('DOMContentLoaded', () => {
  const table = document.getElementById('datatablesSimple');
  if (table && window.simpleDatatables && window.simpleDatatables.DataTable) {
    new window.simpleDatatables.DataTable(table);
  }
});
