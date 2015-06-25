######         ######
##  Configure R10k ##
######         ######

##  This manifest requires the zack/R10k module
##  Beware! (and good luck!)

class { 'r10k':
  version           => '1.5.1',
  sources           => {
    'puppet' => {
      #Edit remote to be your own control_repo
      'remote'  => 'https://github.com/npwalker/control-repo.git',
      'basedir' => "${::settings::confdir}/environments",
      'prefix'  => false,
    }
  },
  manage_modulepath => false,
}
