// link servece
const String serverLink = "http://127.0.0.1";
const unansweredConsultationsLink =
    "/Medical_Consultation/Unanswered_Medical_Consultations/";
const answeredConsultationsLink =
    "$serverLink/Medical_Consultation/Answered_Medical_Consultation";

linkForGetWithId(String url, String id) {
  return '$serverLink+$url+$id';
}

// Error
const serverError = 'server error';
const uncreate = 'uncreate';
const somethingWentWrong = 'something went wrong, try again!';
