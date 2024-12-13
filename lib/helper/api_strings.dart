class ApiStrings {
  static const baseurl = 'https://rpcapplication.aiims.edu/waitinglist';
  // static const baseurl = 'http://192.168.1.44:5000/waitinglist';

  static const getDesignation = '$baseurl/public/getDesignations/';
  static const department = '$baseurl/public/getDepartments';
  static const cadre = '$baseurl/public/getCadres';
  static const unit = '$baseurl/public/getUnits/';
  static const createUser = '$baseurl/public/createUser';
  static const forgotPassword = '$baseurl/public/forgotPassword';
  static const createAccount = '$baseurl/public/createAccount';
  static const getBuilding = '$baseurl/public/getBuildings';
  static const getFloors = '$baseurl/public/getFloors/';
  static const getRooms = '$baseurl/public/getRooms/';

  /// Auth

  static const login = '$baseurl/auth/login';
  static const logOut = '$baseurl/auth/logout';

  static const fetch = '$baseurl/patientdemographic/fetch/';
  static const patient = '$baseurl/patiententry';

  static const diagnosis = '$baseurl/diagnosis/getAllNondeleted';
  static const plan = '$baseurl/plan/getAllNondeleted';
  static const eye = '$baseurl/eye/getAllNondeleted';
  static const priority = '$baseurl/priority/getAllNondeleted';
  static const anesthesia = '$baseurl/anesthesia/getAllNondeleted';
  static const eua = '$baseurl/eua/getAllNondeleted';
  static const short = '$baseurl/short/getAllNondeleted';
  static const getAllDesignations = '$baseurl/designation/getAllNondeleted';

  static const userParent = '$baseurl/user/setParent/';
  static const patientCreate = '$patient/create';
  static const patientGet = '$patient/';
  static const patientGetAll = '$patient/getAll';
  static const patientUpdate = '$patient/update';
  static const patientReDate = '$patient/redate/';
  static const patientDelete = '$patient/';

  static const getDoctor = '$baseurl/user/getDoctors';

  static const String getChild = '$baseurl/user/getUserVerify';
  static const String verifyChild = '$baseurl/user/verifyChild/';
}
