## Example for creating domain users
```
    dsc_xaduser {'username':
      dsc_ensure => present,
      dsc_domainname => 'domain.name',
      dsc_username => 'username',
      dsc_password => {
        'user' => 'username',
        'password' => Sensitive("$password")
      },
    }
```

## Example for adding domain user to local admin group
```
  group {'Local Administrators':
    name => 'Administrators',
    ensure => present,
    auth_membership => false,
    members => 'DOMAIN\User',
  }
```

## Example for scheduled tasks
```
  scheduled_task {'run script':
    name => 'test task',
    ensure => present,
    enabled => true,
    command => 'c:\\temp\\scheduled_task.ps1',
    trigger => {
      schedule => 'daily',
      start_time => '15:30'
    },
  }
```

