desc 'Create a database and test database from a database dump'
task :build do
  system("createdb volunteer_tracker")
  system("psql volunteer_tracker < database_backup.sql")
  system("createdb -T volunteer_tracker volunteer_tracker_test")
end