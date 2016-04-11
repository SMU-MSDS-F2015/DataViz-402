// The various methods needed to track and allow the migration of inhabitants

interface IMigratable {
  boolean doIMigrate();
  Habitat migrate(Habitat oldHome);
}