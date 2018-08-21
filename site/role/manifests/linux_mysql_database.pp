# @summary This role installs a mysql databse and sample data
class role::linux_mysql_database {
  include profile::linux_baseline
  include profile::mysql
  include profile::sample_data
}
