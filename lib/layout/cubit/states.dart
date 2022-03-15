abstract class AppStates {}

class AppInitialState extends AppStates {}

//insertUserData
class AppCreateDatabasesState extends AppStates {}
class AppGetDatabasesState extends AppStates {}

class AppInsertAccountDetailsState extends AppStates {}

class AppInsertAccountDetailsSuccessState extends AppStates {}

class AppInsertAccountDetailsErrorState extends AppStates {}
