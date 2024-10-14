class ApiStrings {
  static const baseurl = 'http://127.0.0.1:5000/waitinglist';
  static const getDesignation = '${baseurl}/public/getDesignations/';
  static const department = '${baseurl}/public/getDepartments';
  static const cadre = '${baseurl}/public/getCadres';
  static const unit = '${baseurl}/public/getUnits/';
  static const createUser = '${baseurl}/public/createUser';
  static const forgotPassword = '${baseurl}/public/forgotPassword';
  static const createAccount = '${baseurl}/public/createAccount';
  static const getBuilding = '${baseurl}/public/getBuildings';
  static const getFloors = '${baseurl}/public/getFloors/';
  static const getRooms = '${baseurl}/public/getRooms/';

  /// Auth

  static const login = '${baseurl}/auth/login';
  static const logOut = '${baseurl}/auth/logout';

  static const patient = '${baseurl}/patient';

  static const patientCreate = '${patient}/create';
  static const patientgetAll = '${patient}/getAll';
  static const patientUpdate = '${patient}/update';
  static const patientRedate = '${patient}/redate/';
  static const patientDelete = '${patient}/';
}
