class demo::uninstall_wintools (
  Boolean $uninstall_notepadplusplus = false,
  Boolean $uninstall_baretail        = false,
  ) {

  include chocolatey

  if $uninstall_notepadplusplus {
    package { 'baretail':
      ensure   => absent,
      provider => chocolatey,
    }
  }

  if $uninstall_baretail {
    package { 'notepadplusplus':
      ensure   => absent,
      provider => chocolatey,
    }
  }

}
