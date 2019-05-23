class demo::wintools (
  String $notepadplusplus = false,
  String $baretail        = false,
  ) {

  include chocolatey

  if $notepadplusplus {
    package { 'baretail':
      ensure   => installed,
      provider => chocolatey,
    }
  }

  if $baretail {
    package { 'notepadplusplus':
      ensure   => installed,
      provider => chocolatey,
    }
  }

}
