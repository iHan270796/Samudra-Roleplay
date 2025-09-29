// These are the jobs that can create documents. The ranks in templateGrades can create templates for this job.
const AVAILABLE_JOBS = [
  {
    job: 'police',
    templateGrades: [14, 15, 16],
    logo: '/web/build/police.png',
  },
  {
    job: 'pemerintah',
    templateGrades: [10, 11],
    logo: '/web/build/police.png',
  },
  {
    job: 'ambulance',
    templateGrades: [3, 4, 5],
    logo: '/web/build/ambulance.png',
  },
  // {
  //   job: 'mechanic',
  //   templateGrades: [4],
  //   logo: '/web/build/mechaniclogo.jpg',
  // },
]

// These templates are visible to all players. If you don't want
// any citizen templates, delete everything inside the [] like this:
//    const CITIZEN_TEMPLATES = []
//
// If these templates are empty, the issued documents tab will
// not be visible to players who fon't have a specified job.
// const CITIZEN_TEMPLATES = [
//   {
//     id: 'citizen_contract',
//     documentName: 'Citizen Contract',
//     documnetDescription:
//       'This is a document between two citizens of Los Santos. This document is an official legal document.',
//     fields: [
//       {
//         name: 'Firstname',
//         value: '',
//       },
//       {
//         name: 'Lastname',
//         value: '',
//       },
//       {
//         name: 'Valid Until',
//         value: '',
//       },
//     ],
//     infoName: 'INFORMATION',
//     infoTemplate: '',
//   },
// ]

const COLORS = {
  // These are hexadecimal color codes for the main theme. You can change them as you wish.
  // Primary colors are colors of buttons, and some texts, while secondary color is used for the cancel button.
  primary: '#1064feff',
  secondary: '#ff0145ff',

  // These two should stay RGBA to give them a 90% opacity. Only change the first 3 numbers with any RGB code
  // i.e. rgba([red], [green], [blue], 0.9)
  menuGradientBottom: 'rgba(6, 147, 255, 0.9)',
  menuGradientTop: 'rgba(6, 147, 255, 0.9)',
}

// These are the texts that show up on the NUI. Translate them as you wish. If you'd like to change
// the client texts, go to the config.lua file.

const TEXTS = {
  myDocumentsTitle: 'Document Saya',
  issuedDocumentsTitle: 'Document Yang Di Terbitkan',
  templatesTitle: 'Buat Document',
  customDocumentName: 'Nama Document',
  documentType: 'Tipe Document',
  documentName: 'Nama Document',
  unnamed: 'TANPA NAMA',
  actions: 'Actions',
  edit: 'Ubah',
  cancel: 'Batal',
  delete: 'Hapus',
  view: 'Lihat',
  show: 'Tunjukan',
  copy: 'Salin',
  newTemplateBtn: 'Buat Document',
  deleteTemplateTitle: 'Hapus Document',
  deleteTemplateQuestion: 'Apakah Kamu Serius Mau Hapus Document ini?:',
  date: 'Tanggal',
  newDocumentBtn: 'Buat Document',
  newCitizenDocumentBtn: 'New Citizen Document',
  deleteDocumentTitle: 'Hapus Document',
  deleteDocumentQuestion: 'Are you sure you want to delete this document?:',
  signHereText: 'Tanda Tangan Di sini',
  selectDocumentType: 'Pilih Tipe Document',
  cannotIssueDocument: 'Tidak Ada Akses Untuk Pekerjaan Anda',
  issuerFirstname: 'Nama Depan',
  issuerLastname: 'Nama Belakang',
  issuerDOB: 'Tanggal Lahir',
  issuerJob: 'Pekerjaan',
  termsAndSigning: 'YANG BERTANDA TANGAN DI BAWAH INI',
  terms1: 'Dokumen ini bila ditandatangani menjadi dokumen resmi.',
  terms2:
    'Dengan menandatangani dokumen ini, Anda terikat secara hukum dengan konteksnya dan menerima setiap konsekuensi hukum yang mungkin ditimbulkannya.',
  terms3:
    'Setiap salinan dokumen ini mempunyai nilai yang sama dengan aslinya. Berhati-hatilah saat memberikan salinan.',
  terms4:
    "Pastikan Anda sepenuhnya memahami konteks dokumen ini sebelum menandatanganinya.",
  terms5: "Jangan ragu untuk mencari bantuan dari dewan hukum sebelum menandatangani.",
  requiredError: 'Bidang ini wajib diisi',
  docNameField: 'NAMA UNTUK DOCUMENT',
  docDescField: 'KETERANGAN DOCUMENT',
  docFieldField: 'BUAT NAMA BIDANG DOCUMENT',
  docAddField: 'TAMBAH BIDANG DOCUMENT',
  docInfoNameField: 'JUDUL DOCUMENT',
  docInfoValueField: 'INFORMASI DOCUMENT',
  docMinGradeField: 'MINIMUM PANGKAT UNTUK BUAT DOCUMENT',
  editTemplateBtn: 'UBAH DOCUMENT',
  createTemplateBtn: 'BUAT DOCUMENT',
  createDocumentBtn: 'BUAT DOCUMENT',
  documentCopy: 'SALIN',
}
