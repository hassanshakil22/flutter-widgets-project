class ApiUrls {
  static const baseURL = "https://api.guardsos.com";

  //registration

  //login
  static const login = "/auth/login";

  //register
  static const registerGuard = "/guards";
  static const registerClient = "/clients";

  //file upload url
  static const dataUpload = "/file/url";

  //guards
  static const allguardsbyOrganization = "/guards/by-organization";
  static const guardswithAssignedLocations = "/guards/with/assigned-locations";

  static assignedGuardtoLocation(guardId) => "/guards/assign-guard/$guardId";
  static const assignGuard = "/guards/assign-guard";

  //clients
  static const clientsByOrganization = "/clients/by-organization";
  static clientsById(String clientId) => "/clients/$clientId";

  //location
  static const locationsByOrganization = "/location/by-organization";
  static locationByClient(String clientId) => "/location/by-client/$clientId";

  static requestGuardsByLocation(String locationId) =>
      "/location/requested-guards/$locationId";

  // offices      

  static const getOfficeByOrgranization = "/organizations/get-offices" ;

  
}
