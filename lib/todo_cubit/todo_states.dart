abstract class TodoStates{}

class TodoInitialState extends TodoStates{}

class GotDatabaseData extends TodoStates{}

class InsertedIntoDatabaseData extends TodoStates{}

class UpdatedDataBaseData extends TodoStates{}

class rawofDatabaseDeleted extends TodoStates{}

class ReminderChanged extends TodoStates{}

class ScheduledControllerChanged extends TodoStates{}
