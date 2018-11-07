# Create a local user
# Create a local group
# Add the user to the group
# Grant your user the "Log on as a Service" right

# Explain what the "Log on as a Service" right does : 
# This policy setting determines which service accounts can register a process as a service. 
# Running a process under a service account circumvents the need for human intervention.



class windows::users {
  $users = ['service-01']
  $group = 'service-account'

  user { $users:
    ensure => present,
  }

  group { $group:
    ensure => present, 
    members => $users,
  }

  # local_security_policy { 'Log on as a service':
  #   ensure => present,
  #   policy_value => '90',
  # }

}


