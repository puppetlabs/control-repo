# db2_server preofile
class profile::db2_server (
) {
  db2::install { '11.1':
    source     => 'file:///media/db2/v11.1_linuxx64_dec.tar.gz',
    components => [
      'ACS',
      'APPLICATION_DEVELOPMENT_TOOLS',
      'DB2_SAMPLE_DATABASE   ',
      'BASE_CLIENT',
      'BASE_DB2_ENGINE',
      'JAVA_SUPPORT',
      'SQL_PROCEDURES',
      'COMMUNICATION_SUPPORT_TCPIP'
    ],
    license_content => template('db2/license/trial.lic'),
  }
}
