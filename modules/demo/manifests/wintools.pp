class demo::wintools (
  Boolean $install_notepadplusplus = false,
  Boolean $install_baretail        = false,
  ) {

  include chocolatey

  if $install_notepadplusplus {
    package { 'baretail':
      ensure   => installed,
      provider => chocolatey,
    }
  }

  if $install_baretail {
    package { 'notepadplusplus':
      ensure   => installed,
      provider => chocolatey,
    }
  }

}
