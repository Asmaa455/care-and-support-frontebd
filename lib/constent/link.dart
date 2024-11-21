// link servece
const String serverLink = "https://d7f3-5-0-138-106.ngrok-free.app";
const String createConsultationLink =
    "/Medical_Consultation/patient_consultation_store/";

const unansweredConsultationsLink =
    "$serverLink/Medical_Consultation/Unanswered_Medical_Consultations/";
const answeredConsultationsLink =
    "$serverLink/Medical_Consultation/patient_consultation/";

linkForGetWithId(String url, String id) {
  return '$serverLink$url$id';
}

// Error
const serverError = 'server error';
const uncreate = 'uncreate';
const somethingWentWrong = 'something went wrong, try again!';
