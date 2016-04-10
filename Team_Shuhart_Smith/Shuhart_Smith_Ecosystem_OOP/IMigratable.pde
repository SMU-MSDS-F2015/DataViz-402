// The various methods needed to track and allow the migration of inhabitants

interface IMigratable {
  Habitat Migrate(Habitat oldHome);
}