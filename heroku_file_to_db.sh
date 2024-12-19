pg_restore --verbose --clean --no-acl --no-owner -h localhost -d written_answers latest.dump
rake db:migrate

