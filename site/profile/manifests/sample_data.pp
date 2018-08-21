# @summary This profile installs sample data into a mysql db
class profile::sample_data (
    $database_content,
    $database_name,
) {

  include mysql::server

  file { '/tmp/sample_data.sql':
      ensure => file,
      source => $database_content,
    }

    mysql::db { $database_name:
      user     => 'admin',
      password => 'admin',
      host     => 'localhost',
      grant    => ['ALL'],
      sql      => '/tmp/sample_data.sql',
    }
}
